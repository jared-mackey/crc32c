defmodule Crc32c do
  use Rustler,
    otp_app: :crc32c,
    crate: "crc32crust"

  @doc """
  Calculate the CRC.

  Expect binary data.

  #### Example

      iex> Crc32c.calc(<<1, 2, 3, 4>>)
      691047668

  """
  def calc(_data), do: :erlang.nif_error(:nif_not_loaded)
end
