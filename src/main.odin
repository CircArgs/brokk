package brokk
import "core:fmt"

main :: proc() {
	a := [][]f32{
		{1, 2, 3, 4, 5},
		{5, 6, 7, 8, 6},
		{9, 10, 11, 12, 7},
		{13, 14, 15, 16, 8},
	}
	x := new_matrix(a)
	replace_element(x, Index{1, 3}, 4)
	fmt.println(x)
}
