# Common Concepts in Rust 2

## Functions in Rust

```rust
fn main() {
    add(2, 3);
}

fn add(x: i32, y: i32) {
    println!("The sum of x and y is {}", x + y);
}
```

- it does not matter where you define your functions in the file, above main / below main.
- each parameter must have type.

# Expressions vs Statements

- **Statements** are instructions that perform some action and do not return a value.
- **Expressions** evaluate to a resultant value

```rust
fn main() {
    // statement
    let x = 5;

    // expression
    let y = {
        let z = 3;
        z + 1
    };

    println!("x is {}", x);
    println!("y is {}", y);
}

```

Note that z+1 does not have a `;`

# Returning value in Function

```rust
fn main() {
    let x = plus_one(5);

    println!("The value of x is: {x}");
}

fn plus_one(x: i32) -> i32 {
    x + 1
}
```

Note that we defined the type of return by `->`