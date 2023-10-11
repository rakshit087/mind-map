# Solidity OOPS

## Inheritance

```rust
contract Doge {
  function catchphrase() public returns (string memory) {
    return "So Wow CryptoDoge";
  }
}

contract BabyDoge is Doge {
  function anotherCatchphrase() public returns (string memory) {
    return "Such Moon BabyDoge";
  }
}
```

`BabyDoge` **_inherits_** from `Doge`. That means if you compile and deploy `BabyDoge`, it will have access to both `catchphrase()` and `anotherCatchphrase()` (and any other public functions we may define on `Doge`).

This can be used for logical inheritance (such as with a subclass, a `Cat` is an `Animal`). But it can also be used simply for organizing your code by grouping similar logic together into different contracts.

## Import Statement

When you have multiple files and you want to import one file into another, Solidity uses the `import` keyword

## **Internal and External**

In addition to `public` and `private`, Solidity has two more types of visibility for functions: `internal` and `external`.

1. `internal` is the same as `private`, except that it's also accessible to contracts that inherit from this contract.
2. `external` is similar to `public`, except that these functions can ONLY be called outside the contract — they can't be called by other functions inside that contract.

```rust
contract Sandwich {
  uint private sandwichesEaten = 0;

  function eat() internal {
    sandwichesEaten++;
  }
}

contract BLT is Sandwich {
  uint private baconSandwichesEaten = 0;

  function eatWithBacon() public returns (string memory) {
    baconSandwichesEaten++;
    // We can call this here because it's internal
    eat();
  }
}
```

## Interacting with other contracts

For our contract to talk to another contract on the blockchain that we don't own, first we need to define an **_interface_**.

For example let's say there was a public contract

```rust
contract LuckyNumber {
  mapping(address => uint) numbers;

  function setNum(uint _num) public {
    numbers[msg.sender] = _num;
  }

  function getNum(address _myAddress) public view returns (uint) {
    return numbers[_myAddress];
  }
}
```

This would be a simple contract where anyone could store their lucky number, and it will be associated with their Ethereum address. Then anyone else could look up that person's lucky number using their address.

Now lets define our own function in an external funtion

First we'd have to define an **_interface_** of the `LuckyNumber` contract:

```rust
contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}
```

**Using an interface**

We can use it in a contract as follows

```rust
contract MyContract {
  address NumberInterfaceAddress = 0xab38...
  // ^ The address of the FavoriteNumber contract on Ethereum
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
  // Now `numberContract` is pointing to the other contract

  function someFunction() public {
    // Now we can call `getNum` from that contract:
    uint num = numberContract.getNum(msg.sender);
    // ...and do something with `num` here
  }
}
```

## Multiple Inheritance

```rust
contract SatoshiNakamoto is NickSzabo, HalFinney {
  // Omg, the secrets of the universe revealed!
}
```

## Constructors

`constructor()` is a **_constructor_**, which is an optional special function that has the same name as the contract. It will get executed only one time, when the contract is first created.
