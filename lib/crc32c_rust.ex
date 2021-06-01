defmodule Crc32c do
  use Rustler,
    otp_app: :crc32c,
    crate: "crc32crust"

  def calc(_data), do: :erlang.nif_error(:nif_not_loaded)
end
