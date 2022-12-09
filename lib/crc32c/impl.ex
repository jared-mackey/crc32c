defmodule Crc32c.Impl do
  @moduledoc false

  use Rustler,
    otp_app: :crc32c,
    crate: :crc32crust

  def calc(_data), do: :erlang.nif_error(:nif_not_loaded)
end
