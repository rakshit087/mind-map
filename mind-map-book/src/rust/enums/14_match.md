# match Statement

`match` allows us to compare a value against a series of patterns and then execute code based on which pattern matches.

```rust
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter,
}

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => 1, //If Coin enum is of type Penny, return 1
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter => 25,
    }
}
```

# Matching with Options Enum

```rust
fn plus_one(x: Option<i32>) -> Option<i32> { //The plus one takes in an Option enum, ie value can be None
        match x {
            None => None,
            Some(i) => Some(i + 1), //If value is not null, return value+1
        }
    }
```

# Exhaustive Property

The match expression is exhaustive in nature. ie match expression must cover all the valid cases.

We can make a default case by:

```rust
let dice_roll = 9;
    match dice_roll {
        3 => add_fancy_hat(),
        7 => remove_fancy_hat(),
        _ => reroll(), //if the dice_roll is neither 3 nor 7
    }
```

If we want to use the value for the default match we can do:

```rust
match dice_roll {
        3 => add_fancy_hat(),
        7 => remove_fancy_hat(),
        other => move_player(other),
    }
```