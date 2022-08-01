package matmul
import "core:fmt"
import "core:math/rand"

random_fill :: proc() -> f32 {
	return rand.float32_range(0.0, 100.0)
}

main :: proc() {
	left_size := 4
	shared_size := 16
	right_size := 16
	a := make_2d_slice(left_size, shared_size, f32)
	b := make_2d_slice(shared_size, right_size, f32)
	c := make_2d_slice(left_size, right_size, f32)
	for i in 0 ..< left_size {
		for j in 0 ..< shared_size {
			a[i][j] = random_fill()
		}
	}
	for i in 0 ..< shared_size {
		for j in 0 ..< right_size {
			b[i][j] = random_fill()
		}
	}
	matmul_dot4x16(a, b, c)
	fmt.println(a, "\n", b, "\n", c)
}
