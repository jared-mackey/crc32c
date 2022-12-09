defmodule Crc32c do
  @moduledoc """
  the crc32c algorithm. It uses a rust nif.
  """
  alias Crc32c.Impl

  @doc """
  Calculate the CRC.

  Expect binary data.

  #### Examples

      iex> Crc32c.calc(<<1, 2, 3, 4>>)
      {:ok, 691047668}

      iex> Crc32c.calc(5)
      {:error, :not_binary_data}
  """
  @spec calc(binary()) :: {:ok, integer()} | {:error, :not_binary_data}
  def calc(data) when is_binary(data), do: {:ok, Impl.calc(data)}

  def calc(_data) do
    {:error, :not_binary_data}
  end

  @doc """
  Calculate the CRC. It raises an Argument error if data is not binary

  Expect binary data.

  #### Examples

      iex> Crc32c.calc!(<<1, 2, 3, 4>>)
      691047668
  """
  @spec calc!(binary()) :: integer() | no_return()
  def calc!(data), do: Impl.calc(data)
end
