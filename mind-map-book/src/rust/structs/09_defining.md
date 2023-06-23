# Defining Structs

## Defining a Struct

```rust
struct User {
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}
```

## Creating Instance of our Struct

```rust
fn main() {
    let user1 = User {
        active: true,
        username: String::from("someusername123"),
        email: String::from("someone@example.com"),
        sign_in_count: 1,
    };
}
```

To access the specific value from a struct, we use dot notation.

```rust
user1.email = String::from("anotheremail@example.com");
```

Note that the entire instance must be mutable; Rust doesn’t allow us to mark only certain fields as mutable.

## Returning Struct in a funtion

```rust
fn build_user(email: String, username: String) -> User {
    User {
        active: true,
        username,
        email,
        sign_in_count: 1,
    }
}
```

Note we are using *field init shorthand* syntax, since the parameter names and the struct field names are exactly the same