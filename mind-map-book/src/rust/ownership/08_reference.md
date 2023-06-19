# Passing values by Reference

A *reference* is like a pointer in that it’s an address we can follow to access the data stored at that address; that data is owned by some other variable. Unlike a pointer, a reference is guaranteed to point to a valid value of a particular type for the life of that reference.

```rust
fn main() {
    let s1 = String::from("hello");
    let len = calculate_length(&s1);
    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
```

Now keep in mind, the references by default are not mutable

## Mutable Reference

```rust
fn main() {
    let mut s = String::from("hello");
    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
```

Some important stuff:

- **a single scope can only have one mutable reference of the same owner.** This restriction is to avoid data races.
- Similarly, we cannot have immutable and mutable references to the same owner in the scope.
- We can have multiple mutable reference to the same owner.

## How Rust prevents Dangling References

a *dangling pointer*—a pointer that references a location in memory that may have been given to someone else—by freeing some memory while preserving a pointer to that memory.

When we try to create a Dangline references in Rust:

```rust
fn main() {
    let reference_to_nothing = dangle();
}

fn dangle() -> &String {
    let s = String::from("hello");
    &s
}
```

This will give an error. 

Why an error?

```rust
fn dangle() -> &String { // dangle returns a reference to a String
    let s = String::from("hello"); // s is a new String
    &s // we return a reference to the String, s
} // Here, s goes out of scope, and is dropped. Its memory goes away.
  // Danger!
```

The solution here is to return the `String` directly:

```rust

fn no_dangle() -> String {
    let s = String::from("hello");
    s
}
```

This works without any problems. Ownership is moved out, and nothing is deallocated.

### [The Rules of References](https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html#the-rules-of-references)

Let’s recap what we’ve discussed about references:

- At any given time, you can have *either* one mutable reference *or* any number of immutable references.
- References must always be valid.