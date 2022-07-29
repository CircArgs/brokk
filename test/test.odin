package test

import brokk "../src"
import "core:fmt"


main :: proc() {
	a := [][]f32{
		{1, 2, 3, 4, 5},
		{5, 6, 7, 8, 6},
		{9, 10, 11, 12, 7},
		{13, 14, 15, 16, 8},
	}

	x := brokk.new_matrix(a)

	brokk.print_matrix(x)
}
