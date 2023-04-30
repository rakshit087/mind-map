# Hello World!

Rust is a modern programming language that focuses on performance, reliability, and safety. 

- Rustc is the Rust compiler, which is used to compile Rust code into executable files.
- Cargo is the Rust package manager, which helps manage dependencies and build and test Rust projects.

To create a new cargo project, first, make sure you have Rust installed on your machine. Then, open your terminal or command prompt and run the following command:

```bash
cargo new hello_world
```

This will create a new cargo project called "hello_world" in your current directory.

Next, navigate into the "hello_world" directory by running:

```
cd hello_world

```

Inside the "src" directory of your new project, you'll find a file called "[main.rs](http://main.rs/)". This is where you'll write your Rust code.

To print "hello, world!" in Rust, you can use the following code:

```rust
fn main() {
    println!("Hello, world!");
}
```

This code defines a function called "main" and uses the "println!" macro to print "Hello, world!" to the console.

To build and run your Rust project, run the following command from within the "hello_world" directory:

```
cargo build
```

This will compile your project and execute the resulting executable. You should see "Hello, world!" printed to the console.

Congratulations, you've just created and run your first Rust program using cargo!