
package benchmark
import "core:fmt"
import "core:time"
import brokk "../../src"
import "core:math/rand"
import utils "../../src/utils"

random_fill :: proc() -> f32 {
	return rand.float32_range(0.0, 100.0)
}
mm::proc(l, r: [][]f32)->[][]f32{
    result:= utils.make_2d_slice(len(l), len(r[0]), f32)
   for i in 0..<len(l) {
      for j in 0..<len(r[0]) {
         for k in 0..<len(r) {
            result[i][j] += l[i][k] * r[k][j];
         }
      }
   }
   return result
}
main :: proc() {
	left_size := 1024// rand.int_max(1000) + 1001
	shared_size := 1024 //rand.int_max(1000) + 1001
	right_size := 1024//rand.int_max(1000) + 1001
	left := utils.make_2d_slice(left_size, shared_size, f32)
	right := utils.make_2d_slice(shared_size, right_size, f32)
  for i in 0..<left_size{
    for j in 0..<shared_size{
      left[i][j]=random_fill()
    }
  }
  for i in 0..<shared_size{
    for j in 0..<right_size{
      right[i][j]=random_fill()
    }
  }
	start := time.now()
	mm(left, right)
	end := time.since(start)
	fmt.println(left_size, shared_size, right_size, end)
}
