package matmul

import "core:simd"
import "core:fmt"
// References:
// https://github.com/flame/how-to-optimize-gemm
// https://github.com/pytorch/glow/blob/405e632ef138f1d49db9c3181182f7efd837bccc/lib/Backends/CPU/libjit/libjit_matmul.cpp
// https://github.com/pytorch/glow/blob/405e632ef138f1d49db9c3181182f7efd837bccc/lib/Backends/CPU/libjit/libjit_defs.h

//Thanks to Phil H - odin discord
make_2d_slice :: proc(y, x: int, $T: typeid, allocator := context.allocator) -> (res: [][]T) {
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


/// Compute a 4x16 block of C using a vectorized dot product. from slices a: 4x16, b: 16x16

matmul_dot4x16 :: proc(a, b, c: [][]f32, a_col: int = 0) {
	ctmp07 := [cth]simd.f32x8{}
	ctmp815 := [cth]simd.f32x8{}
	for p in 0 ..< bth {
		a0p := simd.from_array([8]f32{a[0][a_col + p], a[0][a_col + p], a[0][a_col + p], a[0][a_col + p], a[0][a_col + p], a[0][a_col + p], a[0][a_col + p], a[0][a_col + p]})
		a1p := simd.from_array([8]f32{a[1][a_col + p], a[1][a_col + p], a[1][a_col + p], a[1][a_col + p], a[1][a_col + p], a[1][a_col + p], a[1][a_col + p], a[1][a_col + p]})
		a2p := simd.from_array([8]f32{a[2][a_col + p], a[2][a_col + p], a[2][a_col + p], a[2][a_col + p], a[2][a_col + p], a[2][a_col + p], a[2][a_col + p], a[2][a_col + p]})
		a3p := simd.from_array([8]f32{a[3][a_col + p], a[3][a_col + p], a[3][a_col + p], a[3][a_col + p], a[3][a_col + p], a[3][a_col + p], a[3][a_col + p], a[3][a_col + p]})
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
	fmt.println(a, "\n\n", b, "\n\n", c, "\n\n=========================================================\n\n\n")
}

/// a is a slice a[row:row+4] e.g. 4 rows all columns
/// a_packed is a slice of contiguous memory the same size as passed the slice of a
pack_matrix_a :: proc(a, a_packed: [][]f32) {
	copy(a_packed, a)
}

/// col is the starting column to pack from b
// b_packed is len(b) x 4 
// TODO: can b_packed just be simd since we only ever access these cols of B 1 time (pack once) rather than doing the simd over and over in matmul_dot4x4
pack_matrix_b :: proc(col: int, b, b_packed: [][]f32) {
	for r, i in b {
		copy(b_packed[i], r[col:col + btw])
	}
}

pack_matrix_c :: proc(col_c: int, c, c_packed: [][]f32) {
	for r, i in c {
		copy(c_packed[i], r[col_c:col_c + ctw])
	}
}

unpack_matrix_c :: proc(col_c: int, c, c_packed: [][]f32) {
	for r, i in c {
		copy(r[col_c:col_c + ctw], c_packed[i])
	}
}
/// loops over tiles of the packed a and b to make a complete tile of c
matmul_inner :: proc(a_packed, b_packed, c_packed: [][]f32) {
	for i in 0 ..< len(b_packed) / bth {
		j := bth
		matmul_dot4x16(a_packed, b_packed[j:j + bth], c_packed, j)
	}
}

ath :: 4 // a tile height
bth :: 16 // b tile height
btw :: 16 // b tile width
atw :: bth
// c tiles are ofc 4x16
cth :: ath
ctw :: btw

matmul :: proc(a, b: [][]f32) -> (c: [][]f32) {
	col := 0
	c = make_2d_slice(len(a), len(b[0]), f32)
	a_packed := make_2d_slice(ath, len(a[0]), f32)
	b_packed := make_2d_slice(len(b), btw, f32)
	c_packed := make_2d_slice(cth, ctw, f32)
	for j := 0; j < len(c[0]) - 1; j += ctw { //iterate cols of c
		// to make a new column of tiles of c we need a new column of b tiles 
		// so we will repack b
		// and move the column number to know where to start packing
		pack_matrix_b(col, b, b_packed)
		col += btw
		for i := 0; i < len(c) - 1; i += cth { //iterate rows of c
			pack_matrix_a(a[i:i + ath], a_packed)
			pack_matrix_c(j, c[i:i + cth], c_packed)
			matmul_inner(a_packed, b_packed, c_packed)
			assert(false)
			unpack_matrix_c(j, c[i:i + cth], c_packed)
		}
	}

	return
}
