import os

import pandas as pd
from tqdm import tqdm

mappings={'s':1/1000000, 'ms':1/1000, 'µs': 1, 'ns': 1000}

timings=[]

for _ in tqdm(range(100)):
    out=os.popen('./benchmark.bin').read()
    out=out.split(' ')
    timings.append(dict(zip(('left_size', 'shared_size', 'right_size', 'time'), out)))

df=pd.DataFrame(timings)
df.time=df.time.str.strip()
df['magnitude']=df.time.str.replace(r'[0-9]*\.?[0-9]*', '', regex=True)
df.time=df.time.str.replace(r'[^\d\.]', '', regex=True)
df.time/=df.magnitude.map(mappings)
df.to_csv('timings.csv', index=False)
