# Slices

*Slices* let you reference a contiguous sequence of elements in a collection rather than the whole collection. A slice is a kind of reference, so it does not have ownership.

A *string slice* is a reference to part of a `String`, and it looks like this:

```rust
let s = String::from("hello world");
let hello = &s[0..5];
let world = &s[6..11];
```

function that takes in a `String` and return the first word of it:

```rust
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
}
```

Things to note:

- for returning the string slice, we use `&str`.