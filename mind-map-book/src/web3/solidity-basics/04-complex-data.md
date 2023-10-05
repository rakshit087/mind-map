# Solidity Complex Data Types - Arrays, Structures, Enums

# Arrays in Solidity

There are two types of arrays in Solidity: **_fixed_** arrays and **_dynamic_** arrays:

```rust
*// Array with a fixed length of 2 elements:*
uint[2] fixedArray;
*// another fixed Array, can contain 5 strings:*
string[5] stringArray;
*// a dynamic Array - has no fixed size, can keep growing:*
uint[] dynamicArray;
//length of array
arr.length;
//adding to array
arr.push(1);
```

### **Public Arrays**

We can declare an array as `public`, and Solidity will automatically create a **_getter_** method for it. The syntax looks like:

```
Person[] public people;
```

Other contracts would then be able to read from, but not write to, this array.

## Structure in Solidity

```rust
struct Person {
  uint age;
  string name;
}
```

We can also create arrays os structs

### Arrays of Structures

We can create an array of Structure.

```rust
struct Person {
uint age;
string name;
}
Person[] public people;
```

We can create a new `Person` and add it to an array by

```rust
Person rakshit = Person(22,'Rakshit')
people.push(rakshit)
```

This can also be done in a single line

```rust
people.push(Person(22,'Rakshit'))
```

## Mappings in Solidity

A mapping is essentially a key-value store for storing and looking up data.

`mapping (uint => string) userIdToName;`

Here, the key is a `uint` and the value a `string`.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        // The default value for uint is 0
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Update the value at this address
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Reset the value to the default value.
        delete myMap[_addr];
    }
}
```

## Enums

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract Enum {
// Enum representing different possible shipping states
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
// Declare a variable of the type Status
// This can only contain one of the predefined values
    Status public status;
// Since enums are internally represented by uints
// This function will always return a uint
// Pending = 0
// Shipped = 1
// Accepted = 2
// Rejected = 3
// Canceled = 4
// Value higher than 4 cannot be returned
    function get() public view returns (Status) {
        return status;
    }
// Pass a uint for input to update the value
    function set(Status _status) public {
        status = _status;
    }
// Update value to a specific enum members
    function cancel() public {
        status = Status.Canceled;// Will set status = 4
    }
}

```
