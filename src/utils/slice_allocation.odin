package utils

//Thanks to Phil H
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
