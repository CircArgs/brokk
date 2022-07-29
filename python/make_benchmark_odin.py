import regex as re
from data import mats


def format_matrix(m):
    return re.sub(r'((?<=\d)\s+(?=\d))|((?<=})\s+(?={))', ', ', '[][]f32'+str(m).replace('[', '{').replace(']', '}'))



root = "../benchmark/odin/"


def write_data(s):
    with open(f"{root}data.odin", "a") as f:
        f.write(s + "\n")


def write_bench(s):
    with open(f"{root}benchmark.odin", "a") as f:
        f.write(s + "\n")


data_header = """
package benchmark
// this file generated automatically from python
import brokk "../../src"
""".strip()
write_data(data_header)

bench_header = """
package benchmark
// this file generated automatically from python
import "core:fmt"
import "core:time"
import "core:testing"
import brokk "../../src"
""".strip()

write_bench(bench_header)


def format_bench(left, right):
    name=f'bench_{left}_{right}'
    return f"""
@(test)
{name}:: proc(^testing.T){{
   start:=time.now()
   brokk.multiply({left}, {right})
   fmt.println("{name}", time.since(start))
}}
"""

names = []
for i, m in enumerate(mats):
    if len(m.shape)!=2:
        continue
    name = f"mat_{i}_"+'_'.join(map(str, m.shape))
    names.append((name, m.shape))
    write_data(name + "_" + "::" + format_matrix(m))
    write_data(name + ":=" + f"brokk.new_matrix({name}_)")

for left, lshape in names:
    for right, rshape in names:
        if lshape[1] != rshape[0]:
            continue
        write_bench(format_bench(left, right))
