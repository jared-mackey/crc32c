extern crate crc32c;

use rustler::{Encoder, Env, Error, Term, Binary};

rustler::rustler_export_nifs! {
    "Elixir.Crc32c",
    [
        ("calc", 1, calc)
    ],
    None

}

fn calc<'a>(env: Env<'a>, args: &[Term<'a>]) -> Result<Term<'a>, Error> {
    let payload = Binary::from_term(args[0])?;
    let crc = crc32c::crc32c(payload.as_slice());

    Ok(crc.encode(env))
}

