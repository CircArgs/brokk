package benchmark
// this file generated automatically from python
import "core:fmt"
import "core:time"
import "core:testing"
import brokk "../../src"

@(test)
bench_mat_2_800_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_3_1_800)
   fmt.println("bench_mat_2_800_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_22_1_1)
   fmt.println("bench_mat_2_800_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_23_1_1)
   fmt.println("bench_mat_2_800_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_24_1_100)
   fmt.println("bench_mat_2_800_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_26_1_900)
   fmt.println("bench_mat_2_800_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_28_1_200)
   fmt.println("bench_mat_2_800_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_30_1_1000)
   fmt.println("bench_mat_2_800_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_32_1_300)
   fmt.println("bench_mat_2_800_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_34_1_400)
   fmt.println("bench_mat_2_800_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_36_1_500)
   fmt.println("bench_mat_2_800_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_38_1_600)
   fmt.println("bench_mat_2_800_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_2_800_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_2_800_1, mat_40_1_700)
   fmt.println("bench_mat_2_800_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_3_1_800_mat_2_800_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_3_1_800, mat_2_800_1)
   fmt.println("bench_mat_3_1_800_mat_2_800_1", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_3_1_800)
   fmt.println("bench_mat_22_1_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_22_1_1)
   fmt.println("bench_mat_22_1_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_23_1_1)
   fmt.println("bench_mat_22_1_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_24_1_100)
   fmt.println("bench_mat_22_1_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_26_1_900)
   fmt.println("bench_mat_22_1_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_28_1_200)
   fmt.println("bench_mat_22_1_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_30_1_1000)
   fmt.println("bench_mat_22_1_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_32_1_300)
   fmt.println("bench_mat_22_1_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_34_1_400)
   fmt.println("bench_mat_22_1_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_36_1_500)
   fmt.println("bench_mat_22_1_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_38_1_600)
   fmt.println("bench_mat_22_1_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_22_1_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_22_1_1, mat_40_1_700)
   fmt.println("bench_mat_22_1_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_3_1_800)
   fmt.println("bench_mat_23_1_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_22_1_1)
   fmt.println("bench_mat_23_1_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_23_1_1)
   fmt.println("bench_mat_23_1_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_24_1_100)
   fmt.println("bench_mat_23_1_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_26_1_900)
   fmt.println("bench_mat_23_1_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_28_1_200)
   fmt.println("bench_mat_23_1_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_30_1_1000)
   fmt.println("bench_mat_23_1_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_32_1_300)
   fmt.println("bench_mat_23_1_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_34_1_400)
   fmt.println("bench_mat_23_1_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_36_1_500)
   fmt.println("bench_mat_23_1_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_38_1_600)
   fmt.println("bench_mat_23_1_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_23_1_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_23_1_1, mat_40_1_700)
   fmt.println("bench_mat_23_1_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_24_1_100_mat_25_100_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_24_1_100, mat_25_100_1)
   fmt.println("bench_mat_24_1_100_mat_25_100_1", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_3_1_800)
   fmt.println("bench_mat_25_100_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_22_1_1)
   fmt.println("bench_mat_25_100_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_23_1_1)
   fmt.println("bench_mat_25_100_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_24_1_100)
   fmt.println("bench_mat_25_100_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_26_1_900)
   fmt.println("bench_mat_25_100_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_28_1_200)
   fmt.println("bench_mat_25_100_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_30_1_1000)
   fmt.println("bench_mat_25_100_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_32_1_300)
   fmt.println("bench_mat_25_100_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_34_1_400)
   fmt.println("bench_mat_25_100_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_36_1_500)
   fmt.println("bench_mat_25_100_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_38_1_600)
   fmt.println("bench_mat_25_100_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_25_100_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_25_100_1, mat_40_1_700)
   fmt.println("bench_mat_25_100_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_26_1_900_mat_27_900_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_26_1_900, mat_27_900_1)
   fmt.println("bench_mat_26_1_900_mat_27_900_1", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_3_1_800)
   fmt.println("bench_mat_27_900_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_22_1_1)
   fmt.println("bench_mat_27_900_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_23_1_1)
   fmt.println("bench_mat_27_900_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_24_1_100)
   fmt.println("bench_mat_27_900_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_26_1_900)
   fmt.println("bench_mat_27_900_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_28_1_200)
   fmt.println("bench_mat_27_900_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_30_1_1000)
   fmt.println("bench_mat_27_900_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_32_1_300)
   fmt.println("bench_mat_27_900_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_34_1_400)
   fmt.println("bench_mat_27_900_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_36_1_500)
   fmt.println("bench_mat_27_900_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_38_1_600)
   fmt.println("bench_mat_27_900_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_27_900_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_27_900_1, mat_40_1_700)
   fmt.println("bench_mat_27_900_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_28_1_200_mat_29_200_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_28_1_200, mat_29_200_1)
   fmt.println("bench_mat_28_1_200_mat_29_200_1", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_3_1_800)
   fmt.println("bench_mat_29_200_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_22_1_1)
   fmt.println("bench_mat_29_200_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_23_1_1)
   fmt.println("bench_mat_29_200_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_24_1_100)
   fmt.println("bench_mat_29_200_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_26_1_900)
   fmt.println("bench_mat_29_200_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_28_1_200)
   fmt.println("bench_mat_29_200_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_30_1_1000)
   fmt.println("bench_mat_29_200_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_32_1_300)
   fmt.println("bench_mat_29_200_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_34_1_400)
   fmt.println("bench_mat_29_200_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_36_1_500)
   fmt.println("bench_mat_29_200_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_38_1_600)
   fmt.println("bench_mat_29_200_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_29_200_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_29_200_1, mat_40_1_700)
   fmt.println("bench_mat_29_200_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_30_1_1000_mat_31_1000_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_30_1_1000, mat_31_1000_1)
   fmt.println("bench_mat_30_1_1000_mat_31_1000_1", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_3_1_800)
   fmt.println("bench_mat_31_1000_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_22_1_1)
   fmt.println("bench_mat_31_1000_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_23_1_1)
   fmt.println("bench_mat_31_1000_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_24_1_100)
   fmt.println("bench_mat_31_1000_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_26_1_900)
   fmt.println("bench_mat_31_1000_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_28_1_200)
   fmt.println("bench_mat_31_1000_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_30_1_1000)
   fmt.println("bench_mat_31_1000_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_32_1_300)
   fmt.println("bench_mat_31_1000_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_34_1_400)
   fmt.println("bench_mat_31_1000_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_36_1_500)
   fmt.println("bench_mat_31_1000_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_38_1_600)
   fmt.println("bench_mat_31_1000_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_31_1000_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_31_1000_1, mat_40_1_700)
   fmt.println("bench_mat_31_1000_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_32_1_300_mat_33_300_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_32_1_300, mat_33_300_1)
   fmt.println("bench_mat_32_1_300_mat_33_300_1", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_3_1_800)
   fmt.println("bench_mat_33_300_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_22_1_1)
   fmt.println("bench_mat_33_300_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_23_1_1)
   fmt.println("bench_mat_33_300_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_24_1_100)
   fmt.println("bench_mat_33_300_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_26_1_900)
   fmt.println("bench_mat_33_300_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_28_1_200)
   fmt.println("bench_mat_33_300_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_30_1_1000)
   fmt.println("bench_mat_33_300_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_32_1_300)
   fmt.println("bench_mat_33_300_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_34_1_400)
   fmt.println("bench_mat_33_300_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_36_1_500)
   fmt.println("bench_mat_33_300_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_38_1_600)
   fmt.println("bench_mat_33_300_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_33_300_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_33_300_1, mat_40_1_700)
   fmt.println("bench_mat_33_300_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_34_1_400_mat_35_400_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_34_1_400, mat_35_400_1)
   fmt.println("bench_mat_34_1_400_mat_35_400_1", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_3_1_800)
   fmt.println("bench_mat_35_400_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_22_1_1)
   fmt.println("bench_mat_35_400_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_23_1_1)
   fmt.println("bench_mat_35_400_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_24_1_100)
   fmt.println("bench_mat_35_400_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_26_1_900)
   fmt.println("bench_mat_35_400_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_28_1_200)
   fmt.println("bench_mat_35_400_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_30_1_1000)
   fmt.println("bench_mat_35_400_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_32_1_300)
   fmt.println("bench_mat_35_400_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_34_1_400)
   fmt.println("bench_mat_35_400_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_36_1_500)
   fmt.println("bench_mat_35_400_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_38_1_600)
   fmt.println("bench_mat_35_400_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_35_400_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_35_400_1, mat_40_1_700)
   fmt.println("bench_mat_35_400_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_36_1_500_mat_37_500_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_36_1_500, mat_37_500_1)
   fmt.println("bench_mat_36_1_500_mat_37_500_1", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_3_1_800)
   fmt.println("bench_mat_37_500_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_22_1_1)
   fmt.println("bench_mat_37_500_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_23_1_1)
   fmt.println("bench_mat_37_500_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_24_1_100)
   fmt.println("bench_mat_37_500_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_26_1_900)
   fmt.println("bench_mat_37_500_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_28_1_200)
   fmt.println("bench_mat_37_500_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_30_1_1000)
   fmt.println("bench_mat_37_500_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_32_1_300)
   fmt.println("bench_mat_37_500_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_34_1_400)
   fmt.println("bench_mat_37_500_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_36_1_500)
   fmt.println("bench_mat_37_500_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_38_1_600)
   fmt.println("bench_mat_37_500_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_37_500_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_37_500_1, mat_40_1_700)
   fmt.println("bench_mat_37_500_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_38_1_600_mat_39_600_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_38_1_600, mat_39_600_1)
   fmt.println("bench_mat_38_1_600_mat_39_600_1", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_3_1_800)
   fmt.println("bench_mat_39_600_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_22_1_1)
   fmt.println("bench_mat_39_600_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_23_1_1)
   fmt.println("bench_mat_39_600_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_24_1_100)
   fmt.println("bench_mat_39_600_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_26_1_900)
   fmt.println("bench_mat_39_600_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_28_1_200)
   fmt.println("bench_mat_39_600_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_30_1_1000)
   fmt.println("bench_mat_39_600_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_32_1_300)
   fmt.println("bench_mat_39_600_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_34_1_400)
   fmt.println("bench_mat_39_600_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_36_1_500)
   fmt.println("bench_mat_39_600_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_38_1_600)
   fmt.println("bench_mat_39_600_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_39_600_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_39_600_1, mat_40_1_700)
   fmt.println("bench_mat_39_600_1_mat_40_1_700", time.since(start))
}


@(test)
bench_mat_40_1_700_mat_41_700_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_40_1_700, mat_41_700_1)
   fmt.println("bench_mat_40_1_700_mat_41_700_1", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_3_1_800:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_3_1_800)
   fmt.println("bench_mat_41_700_1_mat_3_1_800", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_22_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_22_1_1)
   fmt.println("bench_mat_41_700_1_mat_22_1_1", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_23_1_1:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_23_1_1)
   fmt.println("bench_mat_41_700_1_mat_23_1_1", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_24_1_100:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_24_1_100)
   fmt.println("bench_mat_41_700_1_mat_24_1_100", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_26_1_900:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_26_1_900)
   fmt.println("bench_mat_41_700_1_mat_26_1_900", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_28_1_200:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_28_1_200)
   fmt.println("bench_mat_41_700_1_mat_28_1_200", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_30_1_1000:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_30_1_1000)
   fmt.println("bench_mat_41_700_1_mat_30_1_1000", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_32_1_300:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_32_1_300)
   fmt.println("bench_mat_41_700_1_mat_32_1_300", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_34_1_400:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_34_1_400)
   fmt.println("bench_mat_41_700_1_mat_34_1_400", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_36_1_500:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_36_1_500)
   fmt.println("bench_mat_41_700_1_mat_36_1_500", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_38_1_600:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_38_1_600)
   fmt.println("bench_mat_41_700_1_mat_38_1_600", time.since(start))
}


@(test)
bench_mat_41_700_1_mat_40_1_700:: proc(^testing.T){
   start:=time.now()
   brokk.multiply(mat_41_700_1, mat_40_1_700)
   fmt.println("bench_mat_41_700_1_mat_40_1_700", time.since(start))
}

