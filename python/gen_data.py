from itertools import combinations_with_replacement

import numpy as np

dims = {int(i) for i in np.linspace(1, 1000, 11)}


def write_data(s):
    with open("data.py", "a") as f:
        f.write(s + "\n")


write_data("import numpy as np")

write_data("mats=[")

for rows, cols in combinations_with_replacement(dims, 2):
    write_data("np." + repr(np.random.rand(rows, cols)) + ",")
    write_data("np." + repr(np.random.rand(cols, rows)) + ",")

write_data("]")
