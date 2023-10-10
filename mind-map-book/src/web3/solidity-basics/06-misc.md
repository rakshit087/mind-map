# Solidity Intermediate

## Hashing in Solidity

Ethereum has the hash function `keccak256` built in, which is a version of SHA3. A hash function basically maps an input into a random 256-bit hexadecimal number. A slight change in the input will cause a large change in the hash.

Also important, `keccak256` expects a single parameter of type `bytes`. This means that we have to "pack" any parameters before calling `keccak256`:

`keccak256(abi.encodePacked("aaaab"));`

## Events

**_Events_** are a way for your contract to communicate that something happened on the blockchain to your app front-end, which can be 'listening' for certain events and take action when they happen.x

```rust
// declare the event
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public returns (uint) {
  uint result = _x + _y;
  // fire an event to let the app know the function was called:
  emit IntegersAdded(_x, _y, result);
  return result;
}

```

## **Addresses**

The Ethereum blockchain is made up of **_accounts_**,

An account has a balance of **\*Ether** and you can send and receive Ether payments to other accounts.\* Each account has an `address`, which is a unique identifier that points to that account, and it looks like this:

`0x0cE446255506E92DF41614C46F1d6df9Cc969183`

## **msg.sender**

In Solidity, there are certain global variables that are available to all functions. One of these is `msg.sender`, which refers to the `address` of the person (or smart contract) who called the current function.

_Note: In Solidity, function execution always needs to start with an external caller. A contract will just sit on the blockchain doing nothing until someone calls one of its functions. So there will always be a `msg.sender`._

```rust
mapping (address => uint) favoriteNumber;

function setMyNumber(uint _myNumber) public {
  // Update our `favoriteNumber` mapping to store `_myNumber` under `msg.sender`
  favoriteNumber[msg.sender] = _myNumber;
  // ^ The syntax for storing data in a mapping is just like with arrays
}

function whatIsMyNumber() public view returns (uint) {
  // Retrieve the value stored in the sender's address
  // Will be `0` if the sender hasn't called `setMyNumber` yet
  return favoriteNumber[msg.sender];
}
```

## **Storage vs Memory (Data location)**

**_Storage_** refers to variables stored permanently on the blockchain. **_Memory_** variables are temporary, and are erased between external function calls to your contract.

State variables (variables declared outside of functions) are by default `storage` and written permanently to the blockchain, while variables declared inside functions are `memory` and will disappear when the function call ends.

there are times when you do need to use these keywords, namely when dealing with **_structs_** and **_arrays_** within functions

```rust
contract SandwichFactory {
  struct Sandwich {
    string name;
    string status;
  }

  Sandwich[] sandwiches;

  function eatSandwich(uint _index) public {
    // Sandwich mySandwich = sandwiches[_index];

    // ^ Seems pretty straightforward, but solidity will give you a warning
    // telling you that you should explicitly declare `storage` or `memory` here.

    // So instead, you should declare with the `storage` keyword, like:
    Sandwich storage mySandwich = sandwiches[_index];
    // ...in which case `mySandwich` is a pointer to `sandwiches[_index]`
    // in storage, and...
    mySandwich.status = "Eaten!";
    // ...this will permanently change `sandwiches[_index]` on the blockchain.

    // If you just want a copy, you can use `memory`:
    Sandwich memory anotherSandwich = sandwiches[_index + 1];
    // ...in which case `anotherSandwich` will simply be a copy of the
    // data in memory, and...
    anotherSandwich.status = "Eaten!";
    // ...will just modify the temporary variable and have no effect
    // on `sandwiches[_index + 1]`. But you can do this:
    sandwiches[_index + 1] = anotherSandwich;
    // ...if you want to copy the changes back into blockchain storage.
  }
}
```
