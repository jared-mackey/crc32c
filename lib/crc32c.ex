defmodule Crc32c do
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
  @spec calc(binary()) :: {:ok, non_neg_integer()} | {:error, :not_binary_data}
  def calc(data) when is_binary(data), do: {:ok, Impl.calc(data)}

  def calc(_data) do
    {:error, :not_binary_data}
  end

  @spec calc(binary()) :: non_neg_integer() | no_return()
  def calc!(data), do: Impl.calc(data)
end
