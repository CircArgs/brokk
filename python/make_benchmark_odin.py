from data import mats


def format_matrix(m):
    return "[][]f32" + str(m).replace('\n', ', ').replace('[', '{').replace(']', '}')


root = "../benchmark/odin/"


def write_data(s):
    with open(f"{root}data.odin", "a") as f:
        f.write(s + "\n")


def write_bench(s):
    with open(f"{root}benchmark.odin", "a") as f:
        f.write(s + "\n")


data_header = """
package data
// this file generated automatically from python
import "../src"
brokk::src
""".strip()
write_data(data_header)

bench_header = """
package benchmark
// this file generated automatically from python
import "../../src"
brokk::src
""".strip()

write_bench(bench_header)


def format_bench(left, right):
    return f"""
@(test)
bench_{left}_{right} :: proc(){{
   brokk.multiply(data.{left}, data.{right})
}}
"""

names = []
for i, m in enumerate(mats):
    if len(m.shape)!=2:
        continue
    name = f"mat_{i}_"+'_'.join(map(str, m.shape))
    names.append((name, m.shape))
    write_data(name + "_" + "::" + format_matrix(m))
    write_data(name + "::" + f"brokk.new_matrix({name}_)")

for left, lshape in names:
    for right, rshape in names:
        if lshape[1] != rshape[0]:
            continue
        write_bench(format_bench(left, right))
