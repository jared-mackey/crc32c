# Crc32c

A native implementation of CRC32c using Rust.

The Rust implementation will try to use the SSE4.2 instruction if available. It will fallback to a software implementation if that instruction is not available at compile time.

## Installation

This package is built on top of `rustler`. See it's docs for more information about what is required to build packages that are using it.

```elixir
def deps do
  [
    {:crc32c, "~> 1"}
  ]
end
```

## Usage

```elixir
<<1,2,3,4>>
|> Crc32c.calc()
|> IO.inspect()
```

## Benchmarks

A comparison with the `crc32cer` package.

```
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Number of Available Cores: 12
Available memory: 16 GB
Elixir 1.9.1
Erlang 22.0.7

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
memory time: 0 ns
parallel: 1
inputs: 10000 bytes, 100000 bytes, 1000000 bytes
Estimated total run time: 42 s

Benchmarking crc32c with input 10000 bytes...
Benchmarking crc32c with input 100000 bytes...
Benchmarking crc32c with input 1000000 bytes...
Benchmarking crc32cer with input 10000 bytes...
Benchmarking crc32cer with input 100000 bytes...
Benchmarking crc32cer with input 1000000 bytes...

##### With input 10000 bytes #####
Name               ips        average  deviation         median         99th %
crc32c        414.82 K        2.41 μs   ±325.94%        1.99 μs        4.99 μs
crc32cer      197.03 K        5.08 μs   ±155.31%        4.99 μs        5.99 μs

Comparison:
crc32c        414.82 K
crc32cer      197.03 K - 2.11x slower +2.66 μs

##### With input 100000 bytes #####
Name               ips        average  deviation         median         99th %
crc32c         54.63 K       18.30 μs    ±25.35%       16.99 μs       32.99 μs
crc32cer       20.39 K       49.05 μs     ±9.18%       48.99 μs       55.99 μs

Comparison:
crc32c         54.63 K
crc32cer       20.39 K - 2.68x slower +30.75 μs

##### With input 1000000 bytes #####
Name               ips        average  deviation         median         99th %
crc32c          5.80 K      172.50 μs     ±4.78%      167.99 μs      203.99 μs
crc32cer        2.02 K      495.62 μs     ±6.44%      485.99 μs      644.99 μs

Comparison:
crc32c          5.80 K
crc32cer        2.02 K - 2.87x slower +323.12 μs
```
