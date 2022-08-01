package matmul

import "core:simd"

// Resources:
// https://github.com/flame/how-to-optimize-gemm
// https://github.com/pytorch/glow/blob/405e632ef138f1d49db9c3181182f7efd837bccc/lib/Backends/CPU/libjit/libjit_matmul.cpp
// https://github.com/pytorch/glow/blob/405e632ef138f1d49db9c3181182f7efd837bccc/lib/Backends/CPU/libjit/libjit_defs.h

//Thanks to Phil H - odin discord
make_2d_slice :: proc(y, x: int, $T: typeid, allocator := context.allocator) -> (
	res: [][]T,
) {
	assert(x > 0 && y > 0)
	context.allocator = allocator

	backing := make([]T, x * y)
	res = make([][]T, y)

	for i in 0 ..< y {
		res[i] = backing[x * i:][:x]
	}
	return
}

delete_2d_slice :: proc(slice: [][]$T, allocator := context.allocator) {
	delete(slice[0], allocator)
	delete(slice, allocator)
}

/// Naive gemm helper to handle oddly-sized matrices.
matmul_odd :: proc(a, b, c: [][]f32) {
	for i in 0 ..< len(a) {
		for j in 0 ..< len(b[0]) {
			for k in 0 ..< len(b) {
				c[i][j] += a[i][k] * b[k][j]
			}
		}
	}
}

// TODO: is from_slice slow? better way?
add_u_f32x8 :: #force_inline proc(p: []f32, v: simd.f32x8) {
	temp := simd.to_array(simd.from_slice(simd.f32x8, p) + v)
	copy(p, temp[:])
}

/// Compute a 4x16 block of C using a vectorized dot product.
matmul_dot4x16 :: proc(a, b, c: [][]f32) {
	ctmp07 := [4]simd.f32x8{}
	ctmp815 := [4]simd.f32x8{}
	for p in 0 ..< 16 {
		a0p := simd.from_array(
			[8]f32{
				a[0][p],
				a[0][p],
				a[0][p],
				a[0][p],
				a[0][p],
				a[0][p],
				a[0][p],
				a[0][p],
			},
		)
		a1p := simd.from_array(
			[8]f32{
				a[1][p],
				a[1][p],
				a[1][p],
				a[1][p],
				a[1][p],
				a[1][p],
				a[1][p],
				a[1][p],
			},
		)
		a2p := simd.from_array(
			[8]f32{
				a[2][p],
				a[2][p],
				a[2][p],
				a[2][p],
				a[2][p],
				a[2][p],
				a[2][p],
				a[2][p],
			},
		)
		a3p := simd.from_array(
			[8]f32{
				a[3][p],
				a[3][p],
				a[3][p],
				a[3][p],
				a[3][p],
				a[3][p],
				a[3][p],
				a[3][p],
			},
		)
		bp0p7 := simd.from_slice(simd.f32x8, b[p][:8])
		bp8p15 := simd.from_slice(simd.f32x8, b[p][8:])
		ctmp07[0] = simd.fma(a0p, bp0p7, ctmp07[0])
		ctmp07[1] = simd.fma(a1p, bp0p7, ctmp07[1])
		ctmp07[2] = simd.fma(a2p, bp0p7, ctmp07[2])
		ctmp07[3] = simd.fma(a3p, bp0p7, ctmp07[3])
		ctmp815[0] = simd.fma(a0p, bp8p15, ctmp815[0])
		ctmp815[1] = simd.fma(a1p, bp8p15, ctmp815[1])
		ctmp815[2] = simd.fma(a2p, bp8p15, ctmp815[2])
		ctmp815[3] = simd.fma(a3p, bp8p15, ctmp815[3])
	}
	// TODO: see about combining into f32x16
	add_u_f32x8(c[0][:8], ctmp07[0])
	add_u_f32x8(c[1][:8], ctmp07[1])
	add_u_f32x8(c[2][:8], ctmp07[2])
	add_u_f32x8(c[3][:8], ctmp07[3])
	add_u_f32x8(c[0][8:], ctmp815[0])
	add_u_f32x8(c[1][8:], ctmp815[1])
	add_u_f32x8(c[2][8:], ctmp815[2])
	add_u_f32x8(c[3][8:], ctmp815[3])
}

/* /// Compute a portion of C one 4*16 block at a time.  Handle ragged edges with */
/* /// calls to a slow but general helper. */
/* void matmul_inner(int m, int n, int k, const float *a, int lda, */
/*                          const float *b, int ldb, float *c, int ldc) { */
/*   constexpr int mc = 4 */
/*   constexpr int nr = 16 */
/*   // The tiling scheme naturally divides the input matrices into 2 parts each */
/*   // one tiled section, and three "ragged" edges. */
/*   // */
/*   // --------------------    ------- */
/*   // | A00*B00 | A00*B01|    | A00 |   ------------- */
/*   // -------------------- += ------- * | B00 | B01 | */
/*   // | A10*B00 | A10*B01|    | A10 |   ------------- */
/*   // --------------------    ------- */
/*   // */
/*   // We can process this as 4 separate matrix multiplications.  A00*B00 is the */
/*   // perfectly-tiled portion, which we handly with a 4x16 dot-product kernel. */
/*   // The ragged edges are (ideally) less critical, so we handle them with a call */
/*   // to a general matrix-multiplication for odd sizes. */
/*   for (int j = 0 j < n - nr + 1 j += nr) { */
/*     for (int i = 0 i < m - mc + 1 i += mc) { */
/*       matmul_dot4x16(k, &A(i, 0), lda, &B(0, j), ldb, &C(i, j), ldc) */
/*     } */
/*   } */
/*   int i = (m / mc) * mc */
/*   int j = (n / nr) * nr */
/*   if (i < m) { */
/*     matmul_odd(m - i, j, k, &A(i, 0), lda, &B(0, 0), ldb, &C(i, 0), ldc) */
/*   } */
/*   if (j < n) { */
/*     matmul_odd(i, n - j, k, &A(0, 0), lda, &B(0, j), ldb, &C(0, j), ldc) */
/*   } */
/*   if (i < m && j < n) { */
/*     matmul_odd(m - i, n - j, k, &A(i, 0), lda, &B(0, j), ldb, &C(i, j), */
/*                       ldc) */
/*   } */
/* } */

/* /// Tile A into mc * kc blocks, where mc and kc are chosen to approximately fit */
/* /// the L2 cache on recent Intel processors (e.g., 256 KB for Skylake).  Stream */
/* /// kc * n panels of B through memory to compute each mc * n block of C. */
/* /// \p a is an \p m x \p k row-major matrix */
/* /// \p b is a \p k x \p n row-major matrix */
/* /// \p c is a \p m x \p n row-major matrix. */
/* /// \p lda, \p ldb, and \p ldc are the leading dimensions of A, B, and C, */
/* /// respectively. */
/* void matmul_outer(int m, int n, int k, const float *a, int lda, */
/*                          const float *b, int ldb, float *c, int ldc) { */
/*   // TODO: Generalize these parameters for other cache sizes. */
/*   constexpr int mc = 256 */
/*   constexpr int kc = 128 */
/*   for (int p = 0 p < k p += kc) { */
/*     int pb = MIN(k - p, kc) */
/*     for (int i = 0 i < m i += mc) { */
/*       int ib = MIN(m - i, mc) */
/*       matmul_inner(ib, n, pb, &A(i, p), lda, &B(p, 0), ldb, &C(i, 0), */
/*                           ldc) */
/*     } */
/*   } */
/* } */


/* } // namespace */

/* extern "C" { */

/* /// Performs the matrix multiplication c = a * b, where c, a, and b are */
/* /// row-major matrices. */
/* /// \p c is a m x n matrix, so \p cDims = {m, n} */
/* /// \p a is a m x k matrix, so \p aDims = {m, k} */
/* /// \p b is a k x n matrix, so \p bDims = {k, n} */
/* matmul::proc(a, b: [][]f32) { */
/*   c:=make_2d_slice(len(a), len(b[0]), f32) */
/*   // Call the matrix multiplication routine with appropriate dimensions and */
/*   // leading dimensions. The "leading dimension" for a row-major matrix is equal */
/*   // to the number of columns in the matrix.  For a, this is k for b and c, */
/*   // this is n. */
/*   // */
/*   // The matrix multiplication routine is heavily inspired by: */
/*   // https://github.com/flame/how-to-optimize-gemm */
/*   matmul_outer(cDims[0], cDims[1], aDims[1], a, aDims[1], b, bDims[1], c, */
/*                       cDims[1]) */
/* } */
