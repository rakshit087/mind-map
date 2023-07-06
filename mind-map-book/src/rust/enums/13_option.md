# Option Enum

Rust does not have nulls, but it does have an enum that can encode the concept of a value being present or absent. This enum is `Option<T>`

Defined as:

```rust
enum Option<T> {
    None,
    Some(T), //Here T is a generic
}
```

- Option Enum can be used in the code without ever explicitly bringing it to scope.

To use Option Enum:

```rust
let some_number = Some(5); //Here we are giving some_number a value (5)
let some_char = Some('e');
let absent_number: Option<i32> = None; // Here we don't have a value for absent_number
```