# Control Flow

# If-Else

```rust
if {condition1} {
    // Code to execute if condition1 is true
} else if {condition2} {
    // Code to execute if condition2 is true
} else {
    // Code to execute if all conditions are false
}

```

## If as Expression

In Rust, the `if` statement can also be used as an expression. This means that the `if` statement can return a value that can be used in other parts of the program. Here is an example:

```rust
let x = 5;
let y = if x == 5 { 10 } else { 15 };
```

# While Loop

```rust
fn main() {
    let mut number = 3;
    while number != 0 {
        println!("{number}!");
        number -= 1;
    }
    println!("LIFTOFF!!!");
}
```

# For Loop

```rust
fn main() {
    let a = [10, 20, 30, 40, 50];

    for element in a {
        println!("the value is: {element}");
    }
		// for loop through a range
		for number in (1..4).rev() {
        println!("{number}!");
    }
}
```

# Loop loop

The `loop` keyword in Rust is used to create an infinite loop. This means that the loop will continue to run until it is explicitly broken out of using the `break` keyword.

The `loop` keyword can also be used as an expression. This means that the loop can return a value that can be used in other parts of the program. Here is an example:

```rust
let mut counter = 0;
let result = loop {
    counter += 1;
    if counter == 10 {
        break counter * 2;
    }
};
```

This code creates an infinite loop using the `loop` keyword. The loop increments the `counter` variable until it reaches a value of 10, at which point it breaks out of the loop and returns the value of `counter * 2` as the result.