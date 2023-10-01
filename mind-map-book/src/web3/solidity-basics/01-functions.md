# Solidity Basics - functions, return types

## Solidity Contracts

Solidity's code is encapsulated in **contracts**. A `contract` is the fundamental building block of Ethereum applications — all variables and functions belong to a contract, and this will be the starting point of all your projects.

An empty contract named `HelloWorld` would look like this:

```c++
contract HelloWorld {

}
```

## **Version Pragma**

All solidity source code should start with a "version pragma" — a declaration of the version of the Solidity compiler this code should use. This is to prevent issues with future compiler versions potentially introducing changes that would break your code.

```c++
pragma solidity >=0.5.0 <0.6.0;

contract HelloWorld {

}

```

## Functions in Solidity

```c++
function myFunction(string memory _name, uint _amount) public {

}
```

- We are making the function public
- The function is taking two parameters, _name and \_amount, it's convention (but not required) to start function parameter variable names with an underscore (`_`) in order to differentiate them from global variables.

there are two ways in which you can pass an argument to a Solidity function:

- By value, which means that the Solidity compiler creates a new copy of the parameter's value and passes it to your function. This allows your function to modify the value without worrying that the value of the initial parameter gets changed.
- By reference, which means that your function is called with a... reference to the original variable. Thus, if your function changes the value of the variable it receives, the value of the original variable gets changed.
- The `memory` is used to pass by refrence

### Private vs Public Functions

In Solidity, functions are `public` by default. This means anyone (or any other contract) can call your contract's function and execute its code.

we use the keyword `private` after the function name to make it private, i.e only other functions within our contract will be able to call this function. It's convention to start private function names with an underscore (`_`).

### Returning Values in Function

```c++
string greeting = "What's up dog";
function sayHello() public returns (string memory) {
	return greeting;
}
```

### Function Modifiers

1. **view Funtions**

   `function sayHello() public view returns (string memory) {`

   These are the functions that do not change or write any value, just view it.

2. **pure Functions**

   Solidity also contains **_pure_** functions, which means you're not even accessing any data in the app.

   ```c++
   function _multiply(uint a, uint b) private pure returns (uint) {
     return a * b;
   }
   ```

### Handeling Multiple Returns

```c++
function multipleReturns() internal returns(uint a, uint b, uint c) {
  return (1, 2, 3);
}

function processMultipleReturns() external {
  uint a;
  uint b;
  uint c;
  // This is how you do multiple assignment:
  (a, b, c) = multipleReturns();
}

// Or if we only cared about one of the values:
function getLastReturnValue() external {
  uint c;
  // We can just leave the other fields blank:
  (,,c) = multipleReturns();
}
```

## TypeCasting

```c++
uint8 a = 5;
uint b = 6;
// throws an error because a * b returns a uint, not uint8:
uint8 c = a * b;
// we have to typecast b as a uint8 to make it work:
uint8 c = a * uint8(b);
```

## Comments in Solidity

Just add double `//` anywhere and you're commenting

The standard in the Solidity community is to use a format called natspec, which looks like this:

```c++
contract Math {
  /// @notice Multiplies 2 numbers together
  /// @param x the first uint.
  /// @param y the second uint.
  /// @return z the product of (x * y)
  /// @dev This function does not currently check for overflows
  function multiply(uint x, uint y) returns (uint z) {
    // This is just a normal comment, and won't get picked up by natspec
    z = x * y;
  }
}
```

`@title` and `@author` are straightforward.

`@notice` explains to a **user** what the contract / function does. `@dev` is for explaining extra details to developers.

`@param` and `@return` are for describing what each parameter and return value of a function are for.
