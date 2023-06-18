# What is Ownership?

*Ownership* is a set of rules that govern how a Rust program manages memory.

**Rules of ownership:**

- Each value in Rust has an *owner*.
- There can only be one owner at a time.
- When the owner goes out of scope, the value will be dropped.

Let’s take a look at this:

```rust
let x = 5;
let y = x;
```

In this particular example, since x and y both are both simple data types and their size is fixed, both are pushed in stack. Therefore, when we bind the value of x to y, it copies the value of x to y.

Now take a look at this example:

```rust
let s1 = String::from("hello");
let s2 = s1;
println!("{}, world!", s1);
```

Here, when we try to compile this, it will give an error.  

- String is a non fixed datatype, therefore it’s value is stored in heap, while reference in the stack.
- after the line `let s2 = s1;`, Rust considers `s1` as no longer valid. Thus s1 is dropped.
- here s2 takes the ownership of “hello”.
- Technically this process is known as a move. In this example, we would say that `s1` was *moved* into `s2`.

If we wanted to make a copy of s1 to s2 we would use: