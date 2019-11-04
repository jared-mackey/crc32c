# Crc32c

A native implementation of CRC32c using Rust.

The Rust implementation will try to use the SSE4.2 instruction if available. It will fallback to a software implementation if that instruction is not available at compile time.

## Installation

This package is built on top of `rustler`. See it's docs for more information about what is required to build packages that are using it.

```elixir
def deps do
  [
    {:crc32c, "~> 1.0.0"}
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
##### With input of 16 bytes #####
Name                  ips        average  deviation         median         99th %
crc32cer           5.07 M      197.31 ns  ±5063.12%           0 ns         990 ns
crc32c_rust        3.52 M      283.70 ns  ±3250.68%           0 ns         990 ns

Comparison:
crc32cer           5.07 M
crc32c_rust        3.52 M - 1.44x slower +86.39 ns
```

```
##### With input 1048576 bytes #####
Name                  ips        average  deviation         median         99th %
crc32c_rust        4.89 K      204.40 μs    ±16.20%      192.99 μs      323.99 μs
crc32cer           1.93 K      519.43 μs     ±6.66%      508.99 μs      666.99 μs

Comparison:
crc32c_rust        4.89 K
crc32cer           1.93 K - 2.54x slower +315.02 μs
```


