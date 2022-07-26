package brokk
import "core:intrinsics"
import "core:fmt"
import "utils"

TILE_HEIGHT :: 4
TILE_WIDTH :: 4

Index :: distinct [2]int
Tile_Index :: distinct [2]int

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

extract_tile_ptr_from_index :: proc(mat: ^Matrix($T), index: Tile_Index) ->
	^matrix[TILE_HEIGHT, TILE_WIDTH]T {
	tile_row, tile_col, inner_row, inner_col := tile_from_index(index)
	return &mat.data[tile_row][tile_col]
}

extract_tile_from_index :: proc(mat: ^Matrix($T), index: Index) ->
	matrix[TILE_HEIGHT, TILE_WIDTH]T {
	tile_row, tile_col, inner_row, inner_col := tile_from_index(index)
	return mat.data[tile_row][tile_col]^
}
extract_tile_ptr_from_tile_index :: proc(mat: ^Matrix($T), index: Tile_Index) ->
	^matrix[TILE_HEIGHT, TILE_WIDTH]T {
	return &mat.data[index.x][index.y]
}
extract_tile_ptr :: proc {
	extract_tile_ptr_from_index,
	extract_tile_ptr_from_tile_index,
}
extract_tile :: proc {
	extract_tile_from_index,
	extract_tile_from_tile_index,
}

extract_tile_from_tile_index :: proc(mat: ^Matrix($T), index: Tile_Index) ->
	matrix[TILE_HEIGHT, TILE_WIDTH]T {
	return mat.data[index.x][index.y]
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

filled :: proc(height, width: int, value: $T) -> ^Matrix(T) {
	mat := zeros(T, height, width)
	for r in 0 ..< height {
		for c in 0 ..< width {
			replace_element(mat, Index{r, c}, value)
		}
	}

	return mat
}

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
	filled,
}

multiply :: proc(left, right: ^Matrix($T)) -> ^Matrix(T) {
	assert(left.width == right.height)
	ret := new_matrix(T, left.height, right.width)
	for index_tile_a in 0 ..< left.width {
		for index_tile_b in 0 ..< right.height {
			for shared_dim in 0 ..< right.width {
				extract_tile_ptr(ret, Tile_Index{index_tile_a, index_tile_b})^ =
					extract_tile(ret, Tile_Index{index_tile_a, index_tile_b}) +
					extract_tile(left, Tile_Index{index_tile_a, shared_dim}) *
						extract_tile(right, Tile_Index{shared_dim, index_tile_b})
			}}
	}
	return ret
}
