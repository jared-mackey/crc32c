extern crate crc32c;

use rustler::{NifResult, Binary};

rustler::init!("Elixir.Crc32c", [calc]);

#[rustler::nif]
fn calc<'a>(payload: Binary<'a>) -> NifResult<u32> {
    let res = crc32c::crc32c(payload.as_slice());

    Ok(res)
}
