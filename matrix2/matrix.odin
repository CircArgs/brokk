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

/* Block sizes */
mc :: 256
kc :: 128
nb :: 1000


/* Routine for computing C = A * B + C */

matmul :: proc(a, b, c: [][]f32) {

	pb, ib: int
	/* This time, we compute a mc x n block of C by a call to the InnerKernel */
  // mc 
	for p := 0; p < k; p += kc {
		pb = min(k - p, kc)
		for i := 0; i < m; i += mc {
			ib = min(m - i, mc)
			inner_kernel(ib, n, pb, a[i], &B(p, 0), &C(i, 0), i == 0)
		}
	}
}

inner_kernel :: proc(m, n, k: int, a, b, c: [][]f32, first_time: bool) {
	packed_a := [m][k]f32{}
	packed_b := [kc][nb]f32{}

	for j := 0; j < n; j += 4 { /* Loop over the columns of C, unrolled by 4 */
		if first_time {
			pack_matrix_b(k, &B(0, j), ldb, &packedB[j * k])
		}
		for i := 0; i < m; i += 4 { /* Loop over the rows of C */
			/* Update C( i,j ), C( i,j+1 ), C( i,j+2 ), and C( i,j+3 ) in
	 one routine (four inner products) */
			if j == 0 {
				pack_matrix_a(k, &A(i, 0), lda, &packedA[i * k])
			}
			AddDot4x4(k, &packedA[i * k], 4, &packedB[j * k], k, &C(i, j), ldc)
		}
	}
}

pack_matrix_a::proc(k: int, a, a_to: [][]f32){

  for( j:=0; j<k; j++){  /* loop over columns of A */
    f32 
      *a_ij_pntr = &A( 0, j );

    *a_to     = *a_ij_pntr;
    *(a_to+1) = *(a_ij_pntr+1);
    *(a_to+2) = *(a_ij_pntr+2);
    *(a_to+3) = *(a_ij_pntr+3);

    a_to += 4;
  }
}

/* void pack_matrix_b( int k, f32 *b, int ldb, f32 *b_to ) */
/* { */
/*   int i; */
/*   f32  */
/*     *b_i0_pntr = &B( 0, 0 ), *b_i1_pntr = &B( 0, 1 ), */
/*     *b_i2_pntr = &B( 0, 2 ), *b_i3_pntr = &B( 0, 3 ); */

/*   for( i=0; i<k; i++){  /* loop over rows of B */ */
/*     *b_to++ = *b_i0_pntr++; */
/*     *b_to++ = *b_i1_pntr++; */
/*     *b_to++ = *b_i2_pntr++; */
/*     *b_to++ = *b_i3_pntr++; */
/*   } */
/* } */

/* #include <mmintrin.h> */
/* #include <xmmintrin.h>  // SSE */
/* #include <pmmintrin.h>  // SSE2 */
/* #include <emmintrin.h>  // SSE3 */

/* typedef union */
/* { */
/*   __m128d v; */
/*   f32 d[2]; */
/* } v2df_t; */

/* void AddDot4x4( int k, f32 *a, int lda,  f32 *b, int ldb, f32 *c, int ldc ) */
/* { */
/*   /* So, this routine computes a 4x4 block of matrix A */
/*            C( 0, 0 ), C( 0, 1 ), C( 0, 2 ), C( 0, 3 ).   */
/*            C( 1, 0 ), C( 1, 1 ), C( 1, 2 ), C( 1, 3 ).   */
/*            C( 2, 0 ), C( 2, 1 ), C( 2, 2 ), C( 2, 3 ).   */
/*            C( 3, 0 ), C( 3, 1 ), C( 3, 2 ), C( 3, 3 ).   */
/*      Notice that this routine is called with c = C( i, j ) in the */
/*      previous routine, so these are actually the elements  */
/*            C( i  , j ), C( i  , j+1 ), C( i  , j+2 ), C( i  , j+3 )  */
/*            C( i+1, j ), C( i+1, j+1 ), C( i+1, j+2 ), C( i+1, j+3 )  */
/*            C( i+2, j ), C( i+2, j+1 ), C( i+2, j+2 ), C( i+2, j+3 )  */
/*            C( i+3, j ), C( i+3, j+1 ), C( i+3, j+2 ), C( i+3, j+3 )  */
/* 	   */
/*      in the original matrix C  */
/*      And now we use vector registers and instructions */ */

/*   int p; */
/*   v2df_t */
/*     c_00_c_10_vreg,    c_01_c_11_vreg,    c_02_c_12_vreg,    c_03_c_13_vreg, */
/*     c_20_c_30_vreg,    c_21_c_31_vreg,    c_22_c_32_vreg,    c_23_c_33_vreg, */
/*     a_0p_a_1p_vreg, */
/*     a_2p_a_3p_vreg, */
/*     b_p0_vreg, b_p1_vreg, b_p2_vreg, b_p3_vreg;  */

/*   c_00_c_10_vreg.v = _mm_setzero_pd();    */
/*   c_01_c_11_vreg.v = _mm_setzero_pd(); */
/*   c_02_c_12_vreg.v = _mm_setzero_pd();  */
/*   c_03_c_13_vreg.v = _mm_setzero_pd();  */
/*   c_20_c_30_vreg.v = _mm_setzero_pd();    */
/*   c_21_c_31_vreg.v = _mm_setzero_pd();   */
/*   c_22_c_32_vreg.v = _mm_setzero_pd();    */
/*   c_23_c_33_vreg.v = _mm_setzero_pd();  */

/*   for ( p=0; p<k; p++ ){ */
/*     a_0p_a_1p_vreg.v = _mm_load_pd( (f32 *) a ); */
/*     a_2p_a_3p_vreg.v = _mm_load_pd( (f32 *) ( a+2 ) ); */
/*     a += 4; */

/*     b_p0_vreg.v = _mm_loaddup_pd( (f32 *) b );       /* load and duplicate */ */
/*     b_p1_vreg.v = _mm_loaddup_pd( (f32 *) (b+1) );   /* load and duplicate */ */
/*     b_p2_vreg.v = _mm_loaddup_pd( (f32 *) (b+2) );   /* load and duplicate */ */
/*     b_p3_vreg.v = _mm_loaddup_pd( (f32 *) (b+3) );   /* load and duplicate */ */

/*     b += 4; */

/*     /* First row and second rows */ */
/*     c_00_c_10_vreg.v += a_0p_a_1p_vreg.v * b_p0_vreg.v; */
/*     c_01_c_11_vreg.v += a_0p_a_1p_vreg.v * b_p1_vreg.v; */
/*     c_02_c_12_vreg.v += a_0p_a_1p_vreg.v * b_p2_vreg.v; */
/*     c_03_c_13_vreg.v += a_0p_a_1p_vreg.v * b_p3_vreg.v; */

/*     /* Third and fourth rows */ */
/*     c_20_c_30_vreg.v += a_2p_a_3p_vreg.v * b_p0_vreg.v; */
/*     c_21_c_31_vreg.v += a_2p_a_3p_vreg.v * b_p1_vreg.v; */
/*     c_22_c_32_vreg.v += a_2p_a_3p_vreg.v * b_p2_vreg.v; */
/*     c_23_c_33_vreg.v += a_2p_a_3p_vreg.v * b_p3_vreg.v; */
/*   } */

/*   C( 0, 0 ) += c_00_c_10_vreg.d[0];  C( 0, 1 ) += c_01_c_11_vreg.d[0];   */
/*   C( 0, 2 ) += c_02_c_12_vreg.d[0];  C( 0, 3 ) += c_03_c_13_vreg.d[0];  */

/*   C( 1, 0 ) += c_00_c_10_vreg.d[1];  C( 1, 1 ) += c_01_c_11_vreg.d[1];   */
/*   C( 1, 2 ) += c_02_c_12_vreg.d[1];  C( 1, 3 ) += c_03_c_13_vreg.d[1];  */

/*   C( 2, 0 ) += c_20_c_30_vreg.d[0];  C( 2, 1 ) += c_21_c_31_vreg.d[0];   */
/*   C( 2, 2 ) += c_22_c_32_vreg.d[0];  C( 2, 3 ) += c_23_c_33_vreg.d[0];  */

/*   C( 3, 0 ) += c_20_c_30_vreg.d[1];  C( 3, 1 ) += c_21_c_31_vreg.d[1];   */
/*   C( 3, 2 ) += c_22_c_32_vreg.d[1];  C( 3, 3 ) += c_23_c_33_vreg.d[1];  */
/* } */
