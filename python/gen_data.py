from itertools import combinations_with_replacement

import numpy as np

dims={int(i) for i in np.linspace(1, 1000, 101)}

def write_data(s):
    with open('data.py', 'a') as f:
        f.write(s+'\n')

write_data('import numpy as np')

write_data('mats=[')

for rows, cols in combinations_with_replacement(dims, 2):
    write_data('np.'+repr(np.random.rand(5, 4))+',')

write_data(']')
