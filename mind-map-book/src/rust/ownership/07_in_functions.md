# Ownership in Functions

The mechanics of passing a value to a function are similar to those when assigning a value to a variable. Passing a variable to a function will move or copy, just as assignment does.

```rust
fn main() {
    let s = String::from("hello");  // s comes into scope
    takes_ownership(s);             // s's value moves into the function...
}

fn takes_ownership(some_string: String) {
    println!("{}", some_string);
}
```

Similarly if a function returns something, it gives back ownership,

```rust
fn main() {
    let s1 = gives_ownership();         // gives_ownership moves its return
} 

fn gives_ownership() -> String {             
    let some_string = String::from("yours");
    some_string //we are returning some_string
}
```

Finally a function can do both, giving and taking of ownership

```rust
fn main() {
    let s1 = String::from("hello");
    let (s2, len) = calculate_length(s1);
    println!("The length of '{}' is {}.", s2, len);
}

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String
    (s, length)
}
```

Here we are returning both the string that was passed in as a argument and the length, thus, we are transferring the ownership of s1 to s2.The mechanics of passing a value to a function are similar to those when assigning a value to a variable. Passing a variable to a function will move or copy, just as assignment does.

```rust
fn main() {
    let s = String::from("hello");  // s comes into scope
    takes_ownership(s);             // s's value moves into the function...
}

fn takes_ownership(some_string: String) {
    println!("{}", some_string);
}
```

Similarly if a function returns something, it gives back ownership,

```rust
fn main() {
    let s1 = gives_ownership();         // gives_ownership moves its return
} 

fn gives_ownership() -> String {             
    let some_string = String::from("yours");
    some_string //we are returning some_string
}
```

Finally a function can do both, giving and taking of ownership

```rust
fn main() {
    let s1 = String::from("hello");
    let (s2, len) = calculate_length(s1);
    println!("The length of '{}' is {}.", s2, len);
}

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String
    (s, length)
}
```

Here we are returning both the string that was passed in as a argument and the length, thus, we are transferring the ownership of s1 to s2.