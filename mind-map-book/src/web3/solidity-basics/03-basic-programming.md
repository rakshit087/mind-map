# Basic Programming - Operations, require, assert, if-else, loops

## Maths Operations

- Addition: `x + y`
- Subtraction: `x - y`,
- Multiplication: `x * y`
- Division: `x / y`
- Modulus / remainder: `x % y`
- To the power of: `x ** y`

## If Statements in Solidity

```rust
if (2 == 2) {
    eat();
  }
```

## Assert in Solidity

`assert` is similar to `require`, where it will throw an error if false. The difference between `assert` and `require` is that `require` will refund the user the rest of their gas when a function fails, whereas `assert` will not. So most of the time you want to use `require` in your code; `assert` is typically used when something has gone horribly wrong with the code (like a `uint` overflow).

```rust
function add(uint256 a, uint256 b) internal pure returns (uint256) {
  uint256 c = a + b;
  assert(c >= a);
  return c;
}
```

## Require in Solidity

`require` makes it so that the function will throw an error and stop executing if some condition is not true.

```rust
function sayHiToVitalik(string memory _name) public returns (string memory) {
  // Compares if _name equals "Vitalik". Throws an error and exits if not true.
  // (Side note: Solidity doesn't have native string comparison, so we
  // compare their keccak256 hashes to see if the strings are equal)
  require(_name == "Vitalik");
  // If it's true, proceed with the function:
  return "Hi!";
}
```

## For Loops

```rust
function getEvens() pure external returns(uint[] memory) {
  uint[] memory evens = new uint[](5);
  // Keep track of the index in the new array:
  uint counter = 0;
  // Iterate 1 through 10 with a for loop:
  for (uint i = 1; i <= 10; i++) {
    // If `i` is even...
    if (i % 2 == 0) {
      // Add it to our array
      evens[counter] = i;
      // Increment counter to the next empty index in `evens`:
      counter++;
    }
  }
  return evens;
}
```
