package brokk

import "core:simd"

WECTOR_WIDTH :: 8
Vector3 :: #simd[4]f64

Wector3_Lane :: #simd[WECTOR_WIDTH]f64

Wector3 :: struct {
	x, y, z: Wector3_Lane,
}

Point3 :: Vector3
WPoint3 :: Wector3

wector_extract :: proc(wec: ^Wector3, n: uint) -> Vector3 {
	return Vector3{simd.extract(wec.x, n), simd.extract(wec.y, n), simd.extract(wec.z, n)}
}

wector_to_vectors::proc(wec: ^Wector3) -> (vecs: [WECTOR_WIDTH]Vector3){
    for i in 0..<uint(WECTOR_WIDTH){
        vecs[0]=wector_extract(wec, i)
    }
    return
}

