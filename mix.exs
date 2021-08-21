defmodule Crc32c.MixProject do
  use Mix.Project

  def project do
    [
      name: "CRC32c",
      app: :crc32c,
      version: "1.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: Mix.compilers(),
      description: description(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: []
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.22"}
    ]
  end

  defp description() do
    "A CRC32c NIF implementation that uses SSE4.2 for ultimate speed."
  end

  defp package() do
    [
      name: "crc32c",
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* native),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/mackeyja92/crc32c/"}
    ]
  end
end
