package brokk
import "core:fmt"
import "core:strings"
import "core:c/libc"
import "core:slice"
import "utils"
main :: proc() {
	using fmt
	/* a := [][]f32{ */
	/* 	{1, 2, 3, 4, 5}, */
	/* 	{5, 6, 7, 8, 6}, */
	/* 	{9, 10, 11, 12, 7}, */
	/* 	{13, 14, 15, 16, 8}, */
	/* } */
	/* b := [][]f32{ */
	/* 	{1, 2, 3, 4, 5}, */
	/* 	{5, 6, 7, 8, 6}, */
	/* 	{9, 10, 11, 12, 7}, */
	/* 	{13, 14, 15, 16, 8}, */
	/* 	{13, 14, 15, 16, 8}, */
	/* } */
	/* x := new_matrix(a) */
	/* y := new_matrix(b) */
	/* /* b := matrix[2, 2]f32 { */ */
	/* /* 	1, 2,  */ */
	/* /* 	3, 4,  */ */
	/* /* } */ */
	/* /* fmt.println(transpose(b)[0]) */ */
	/* print_matrix(x) */
	/* print_matrix(y) */
	/* print_matrix(multiply(x, y)) */
	/* t := .1e-1 */
	/* fmt.println(type_info_of(typeid_of(type_of(t)))) */
	f32_4 :: [4]f32
	x := []f32_4{f32_4{}, f32_4{}}
	for r in &x {
		r[0] = 0
		r[1] = 1
		r[2] = 2
		r[3] = 3
	}
	println(x)
}
