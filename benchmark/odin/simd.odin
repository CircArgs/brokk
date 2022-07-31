package benchmark
import "core:fmt"
import "core:time"
import brokk "../../src"
import "core:math/rand"
import utils "../../src/utils"
import "core:simd"

random_fill :: proc() -> f32 {
	return rand.float32_range(0.0, 100.0)
}

WIDTH :: 8
VEC :: #simd[WIDTH]f32

get_simd_col :: proc(r: [][]f32, index: int) -> []VEC {
	ret := make([]VEC, len(r))
	for row, i in r {
		row_slice := row[index * WIDTH:min(len(r[0]), index * WIDTH + WIDTH)]
		for e, j in row_slice {
			ret[i] = simd.replace(ret[i], j, e)
		}
	}
	return ret
}

get_simd_row :: proc(l: [][]f32, index: int) -> []VEC {
	ret := make([]VEC, len(l[0]))
	row_slice := l[index * WIDTH:min(len(l), index * WIDTH + WIDTH)]
	for row, i in row_slice {
		for e, j in row {
			ret[j] = simd.replace(ret[j], i, e)
		}
	}
	return ret
}

mm :: proc(l, r: [][]f32) -> [][]VEC {
	result := utils.make_2d_slice(len(l) / WIDTH + 1, len(r[0]) / WIDTH + 1, VEC)
	for i in 0 ..< len(l) / WIDTH + 1 {
		left := get_simd_row(l, i)
		for j in 0 ..< len(r[0]) / WIDTH + 1 {
			right := get_simd_col(r, j)
			for k in 0 ..< len(right) {
				result[i][j] = simd.fma(left[k], right[k], result[i][j])
			}
		}
	}
	return result
}

main :: proc() {
	left_size := rand.int_max(1000) + 1001
	shared_size := rand.int_max(1000) + 1001
	right_size := rand.int_max(1000) + 1001
	left := utils.make_2d_slice(left_size, shared_size, f32)
	right := utils.make_2d_slice(shared_size, right_size, f32)
	for i in 0 ..< left_size {
		for j in 0 ..< shared_size {
			left[i][j] = random_fill()
		}
	}
	for i in 0 ..< shared_size {
		for j in 0 ..< right_size {
			right[i][j] = random_fill()
		}
	}
	start := time.now()
	mm(left, right)
	end := time.since(start)
	fmt.println(left_size, shared_size, right_size, end)
}
