package benchmark
import "core:fmt"
import "core:time"
import brokk "../../src"
import "core:math/rand"

random_fill :: proc(index: brokk.Index) -> f32 {
	return rand.float32_range(0.0, 100.0)
}

main :: proc() {
	left_size := rand.int_max(1000) + 1001
	shared_size := rand.int_max(1000) + 1001
	right_size := rand.int_max(1000) + 1001
	left := brokk.filled_proc(left_size, shared_size, random_fill)
	right := brokk.filled_proc(shared_size, right_size, random_fill)
	start := time.now()
	brokk.multiply(left, right)
	end := time.since(start)
	fmt.println(left_size, shared_size, right_size, end)
}
