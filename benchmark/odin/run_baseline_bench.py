import os

import pandas as pd
from tqdm import tqdm

mappings={'s':1/1000000, 'ms':1/1000, 'µs': 1, 'ns': 1000}

timings=[]

for _ in tqdm(range(10)):
    out=os.popen('./baseline.bin').read()
    out=out.split(' ')
    timings.append(dict(zip(('left_size', 'shared_size', 'right_size', 'time'), out)))

df=pd.DataFrame(timings)
df.time=df.time.str.strip()
df['magnitude']=df.time.str.replace(r'[0-9]*\.?[0-9]*', '', regex=True)
df.time=df.time.str.replace(r'[^\d\.]', '', regex=True).astype(float)
df.time/=df.magnitude.map(mappings)
df.to_csv('baseline_timings.csv', index=False)
