package brokk
import "core:intrinsics"
import "core:fmt"
import "core:math"
import "utils"

// TILE_WIDTH*TILE_HEIGHT must not exceed 16
TILE_HEIGHT :: 4
TILE_WIDTH :: 4

#assert(TILE_WIDTH == TILE_HEIGHT && TILE_HEIGHT * TILE_WIDTH <= 16)

Index :: distinct [2]int
Tile_Index :: distinct [2]int
Shape :: distinct [2]int
Pair :: union {
	Index,
	Tile_Index,
	Shape,
}


transmute_index_to_tile_index :: #force_inline proc(index: Index) -> Tile_Index {
	return transmute(Tile_Index)index
}

column_tiles :: proc(w: int) -> int {
	ret := w / TILE_WIDTH
	return w % TILE_WIDTH == 0 ? ret : ret + 1
}

row_tiles :: proc(h: int) -> int {
	ret := h / TILE_HEIGHT
	return h % TILE_HEIGHT == 0 ? ret : ret + 1
}

Matrix :: struct($T: typeid) where intrinsics.type_is_numeric(T) {
	height:       int,
	width:        int,
	row_tiles:    int,
	column_tiles: int,
	data:         [][]matrix[TILE_HEIGHT, TILE_WIDTH]T,
}

shape :: proc(mat: ^Matrix($T)) -> Shape {
	return Shape{mat.height, mat.width}
}

tile_shape :: proc(mat: ^Matrix($T)) -> Shape {
	return Shape{mat.row_tiles, mat.column_tiles}
}

tile_from_index :: proc(index: Index) -> (
	tile_row,
	tile_col,
	inner_row,
	inner_col: int,
) {
	tile_row = index.x / TILE_HEIGHT
	tile_col = index.y / TILE_WIDTH
	inner_row = index.x % TILE_HEIGHT
	inner_col = index.y % TILE_WIDTH
	return
}

extract_tile_ptr_from_index :: proc(mat: ^Matrix($T), index: Index) ->
	^matrix[TILE_HEIGHT, TILE_WIDTH]T {
	tile_row, tile_col, inner_row, inner_col := tile_from_index(index)
	return &mat.data[tile_row][tile_col]
}

extract_tile_from_index :: proc(mat: ^Matrix($T), index: Index) ->
	matrix[TILE_HEIGHT, TILE_WIDTH]T {
	tile_row, tile_col, inner_row, inner_col := tile_from_index(index)
	return mat.data[tile_row][tile_col]
}
extract_tile_ptr_from_tile_index :: proc(mat: ^Matrix($T), index: Tile_Index) ->
	^matrix[TILE_HEIGHT, TILE_WIDTH]T {
	return &mat.data[index.x][index.y]
}
extract_tile_from_tile_index :: proc(mat: ^Matrix($T), index: Tile_Index) ->
	matrix[TILE_HEIGHT, TILE_WIDTH]T {
	return mat.data[index.x][index.y]
}
extract_tile_ptr :: proc {
	extract_tile_ptr_from_index,
	extract_tile_ptr_from_tile_index,
}
extract_tile :: proc {
	extract_tile_from_index,
	extract_tile_from_tile_index,
}

extract_element_ptr :: proc(mat: ^Matrix($T), index: Index) -> ^T {
	assert(index.x >= 0 && index.y >= 0 && index.x < mat.height && index.y < mat.width)
	tile_row, tile_col, inner_row, inner_col := tile_from_index(index)
	assert(
		tile_row >= 0 &&
		tile_col >= 0 &&
		tile_col < mat.column_tiles &&
		tile_row < mat.row_tiles,
	)
	return &mat.data[tile_row][tile_col][inner_row, inner_col]
}

extract_element :: proc(mat: ^Matrix($T), index: Index) -> T {
	return extract_element_ptr(mat, index)^
}

to_slice :: proc(mat: ^Matrix($T)) -> (ret: [][]T) {
	ret = utils.make_2d_slice(mat.height, mat.width, T)
	for row, r in mat.data {
		for col, c in row {
			for tr in 0 ..< min(TILE_HEIGHT, mat.height - TILE_HEIGHT * r) {
				ret_row := tr + TILE_HEIGHT * r
				s := c * TILE_WIDTH
				e := min(TILE_WIDTH + s, mat.width)
				temp := transpose(col)[tr]
				copy(ret[ret_row][s:e], temp[:])
			}
		}
	}
	return
}

print_matrix :: proc(mat: ^Matrix($T)) {
	fmt.println()
	temp := to_slice(mat)
	for row in temp {
		fmt.println(row)
	}
	utils.delete_2d_slice(temp)
	fmt.println()
}

replace_element :: proc(mat: ^Matrix($T), index: Index, value: T) {
	extract_element_ptr(mat, index)^ = value
}

delete_matrix :: proc(mat: ^Matrix($T)) {
	utils.delete_2d_slice(mat.data^)
	delete(mat)
}

zeros :: proc($T: typeid, height, width: int) -> ^Matrix(T) {
	rt, ct := row_tiles(height), column_tiles(width)
	mat := new(Matrix(T))
	data := utils.make_2d_slice(rt, ct, matrix[TILE_HEIGHT, TILE_WIDTH]T)
	mat.height = height
	mat.width = width
	mat.row_tiles = rt
	mat.column_tiles = ct
	mat.data = data
	return mat
}

filled_const :: proc(height, width: int, value: $T) -> ^Matrix(T) {
	mat := zeros(T, height, width)
	for i in 0 ..< height {
		for j in 0 ..< width {
			index := Index{i, j}
			replace_element(mat, index, value)
		}
	}

	return mat
}

filled_proc :: proc( height, width: int, f: proc(x: $T, index: Index) -> T) -> ^Matrix(T) {
	mat := zeros(T, height, width)
	apply(f, mat)

	return mat
}

filled::proc{filled_proc, filled_const}

apply_on_elements :: proc(f: proc(x: $T, index: Index) -> T, mat: ^Matrix(T)) -> ^Matrix(T) {
	for i in 0 ..< mat.height {
		for j in 0 ..< mat.width {
			index := Index{i, j}
			replace_element(mat, index, f(extract_element(mat, index), index))
		}
	}
	return mat
}

apply_on_tiles :: proc(
	f: proc(t: ^matrix[TILE_HEIGHT, TILE_WIDTH]$T, index: Tile_Index) ->
		^matrix[TILE_HEIGHT, TILE_WIDTH]T,
	mat: ^Matrix(T),
) -> ^Matrix(T) {
	for row, i in mat.data {
		for tile, j in row {
			index := Tile_Index{i, j}
			extract_tile_ptr(mat, index)^ = f(extract_tile(mat, index), index)
		}
	}
	return mat
}

apply::proc{apply_on_elements, apply_on_tiles}


from_slice :: proc(a: [][]$T) -> ^Matrix(T) {
	height, width := len(a), len(a[0])
	ret := zeros(T, height, width)
	for r in 0 ..< height {
		for c in 0 ..< width {
			assert(len(a[r]) == width)
			replace_element(ret, Index{r, c}, a[r][c])
		}
	}
	return ret
}

new_matrix :: proc {
	zeros,
	from_slice,
	filled_const, filled_proc,
}

multiply :: proc(left, right: ^Matrix($T)) -> ^Matrix(T) {
	assert(left.column_tiles == right.row_tiles)
	ret := new_matrix(T, left.height, right.width)
	for index_tile_a in 0 ..< left.row_tiles {
		for index_tile_b in 0 ..< right.column_tiles {
			for shared_dim in 0 ..< right.row_tiles {
				extract_tile_ptr(ret, Tile_Index{index_tile_a, index_tile_b})^ =
					extract_tile(ret, Tile_Index{index_tile_a, index_tile_b}) +
					extract_tile(left, Tile_Index{index_tile_a, shared_dim}) *
						extract_tile(right, Tile_Index{shared_dim, index_tile_b})
			}}
	}
	return ret
}
