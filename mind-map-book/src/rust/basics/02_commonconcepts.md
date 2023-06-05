# Common Concepts in Rust

## Declaring a Variable

```rust
fn main() {
    let mut x = 200;
    x = x + 5;
    print!("Value of x is {}", x);
}
```

The above Rust code declares a mutable variable `x` and initializes it to the value `200`. The `mut` keyword is used to indicate that the variable is mutable and can be modified later in the code.

Rust, by default, makes all variables immutable. This means that once a value is assigned to a variable, it cannot be modified. By using the `mut` keyword, we can declare a variable as mutable, which allows us to change its value later in the code.

## Declaring a constants

```rust
fn main() {
    const AGE_LIMIT: u32 = 18;
    print!("{}", AGE_LIMIT);
}
```

## Constants vs Immutable Variable

In Rust, constants (const) and immutable variables (let) are similar as they both represent values that can't be changed once defined. However, there are some differences:

| Constants | Immutable Variable |
| --- | --- |
| Declared with const, must have a known type at compile-time, and can be used in constant expressions. | Declared with let, evaluated at runtime, and used in non-constant expressions. |
|  Type known at compile-time, assigned constant expressions evaluated at compile-time. | Type determined at runtime, initial value from runtime calculations. |
| : Embedded into the compiled binary, not stored in memory at runtime. | Stored in memory, have addresses. |
| Global scope, immutable. | Scoped visibility, immutable by default, shadowable. |

# Data Types in Rust

## Scaler Datatype

In Rust, scalar types represent single values. There are four primary scalar types:

1. Integer Types: Integer types represent whole numbers without fractional parts. Rust provides various integer types with different ranges and memory sizes. Here's an example:

```rust
let a: u8 = 255;    // Unsigned 8-bit integer, range: 0 to 255
let b: i32 = -42;   // Signed 32-bit integer
```

1.  Floating-Point Types: Floating-point types represent numbers with fractional parts. Rust has two floating-point types: **`f32`** (single precision) and **`f64`** (double precision). Here's an example:

```rust
let c: f32 = 3.14;   // 32-bit floating-point number
let d: f64 = 2.718;  // 64-bit floating-point number
```

1. Boolean Type: The boolean type (**`bool`**) represents either true or false. It is useful for logical conditions and branching. Here's an example:

```rust
let is_rust_fun: bool = true;
let is_python_fun = false;  // Type inference: bool
```

## Compound Types

Can group multiple values to one.

1. Tuples
    - have fixed length.
    - each position of tuple has a type.
    
    ```rust
    fn main() {
        // tuples
        let tup: (i32, u32, i16) = (1, 2, 3);
        let (x, y, z) = tup;
        println!("{}", x);
    		let index_value = tup.1;
    }
    ```
    
2. Array
    - Uniform in nature.
    - Fixed length.
    
    ```rust
    fn main() {
        let a = [1, 2, 3];
        let b: [i32; 5] = [1, 2, 3, 4, 5]; // array of type i32 and size 5
        let c = [0; 5]; // [0, 0 , 0, 0, 0]
        let index_value = b[2]; // gives 3
    }
    ```