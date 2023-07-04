# Defining Enums

Enums gives us a way of saying a value is one of a possible set of values.

```jsx
enum IpAddrKind {
    V4,
    V6,
}
```

Now, if a var is IpAddrKind Enum, it can be either V4 or V6.

To use this we use:

```rust
let four = IpAddrKind::V4;
let six = IpAddrKind::V6;
```

We can also put data inside each Enum variant.

```rust
enum IpAddr {
        V4(u8, u8, u8, u8),
        V6(String),
    }
let home = IpAddr::V4(127, 0, 0, 1);
let loopback = IpAddr::V6(String::from("::1"));
```

# Impl with Enum

We can associate functions with Enums, just like in the case of Structs.

```rust
enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}
impl Message {
        fn call(&self) {
            // method body would be defined here
        }
    }

    let m = Message::Write(String::from("hello"));
    m.call();
```