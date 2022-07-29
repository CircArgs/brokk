rm odin_bench.txt
odin test benchmark/odin/ | grep ^bench_* > odin_bench.txt
