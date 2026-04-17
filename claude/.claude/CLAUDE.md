# General Behavior

- If the intent or scope of a task is ambiguous, ask clarifying questions before proceeding
- Don't trust existing code blindly — read and understand it before modifying, and surface any issues you notice
- Prefer asking over assuming when approach or requirements are unclear

# Rust

- Write idiomatic Rust; consult the `rust-skills:coding-guidelines` skill for style questions
- **No panics in non-test code**: do not use `unwrap()`, `expect()`, `panic!()`, `todo!()`, or `unreachable!()` outside `#[cfg(test)]` / test modules — propagate errors with `Result` and `?` instead
- After editing any `.rs` file, run `cargo fmt` on the affected crate

@RTK.md

