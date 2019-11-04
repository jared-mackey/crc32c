defmodule Crc32c.MixProject do
  use Mix.Project

  def project do
    [
      app: :crc32c,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.21.0"}
    ]
  end

  defp rustler_crates() do
    mode =
      case Mix.env() do
        :prod -> :release
        :bench -> :release
        _ -> :debug
      end

    [
      crc32crust: [path: "native/crc32crust", mode: mode]
    ]
  end
end
