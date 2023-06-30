# Methods in Structs

```jsx
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
		// We are implements area method for the Rectangle struct
    fn area(&self) -> u32 {
        self.width * self.height
    }
}

fn main() {
    let rect1 = Rectangle {
        width: 30,
        height: 50,
    };

    println!(
        "The area of the rectangle is {} square pixels.",
        rect1.area()
    );
}
```

- Everything within this `impl` block will be associated with the `Rectangle` type
- Methods must have a parameter named `self` of type `Self` for their first parameter.
- Note that we still need to use the `&` in front of the `self` shorthand to indicate that this method borrows the `Self` instance
- Methods can take ownership of `self`

# ********Assosiated Functions********

All functions defined within an `impl` block are called *associated functions* because they’re associated with the type named after the `impl`. We can define associated functions that don’t have `self` as their first parameter because they don’t need an instance of the type to work with.

```rust
impl Rectangle {
    fn square(size: u32) -> Self {
        Self {
            width: size,
            height: size,
        }
    }
}

fn main() {
	let sq = Rectangle::square(3);
}
```