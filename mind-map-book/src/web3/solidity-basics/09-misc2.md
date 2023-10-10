# Solidity Advanced

## **Ownable Contracts**

After you deploy a contract to Ethereum, it’s **_immutable_**, which means that it can never be modified or updated again. Thus, it often makes sense to have functions that will allow us to update key portions of the DApp.

However, if such a function exists, anyone would be able to update our smart contracts. Thus we have a concept of Contract Ownership — meaning contract will have an owner (you) who has special privileges.

### **OpenZeppelin's `Ownable` contract**

OpenZeppelin is a library of secure and community-vetted smart contracts that we can use in your own DApps.

The `Ownable` contract of OpenZepplin's does the following:

1. When a contract is created, its constructor sets the `owner` to `msg.sender` (the person who deployed it)
2. It adds an `onlyOwner` modifier, which can restrict access to certain functions to only the `owner`
3. It allows you to transfer the contract to a new `owner`

To use the OpenZepplin's Contract, we can use the following [https://docs.openzeppelin.com/contracts/4.x/https://docs.openzeppelin.com/contracts/4.x/](https://docs.openzeppelin.com/contracts/4.x/)

Now once we use it, we can import the contracts and use them

## onlyOwner() Modifier

A function modifier looks just like a function, but uses the keyword `modifier` instead of the keyword `function`. And it can't be called directly like a function can — instead we can attach the modifier's name at the end of a function definition to change that function's behavior.

```rust
modifier onlyOwner() {
    require(isOwner());
    _;
  }

function renounceOwnership() public onlyOwner {
    emit OwnershipTransferred(_owner, address(0));
    _owner = address(0);
  }
```

the `onlyOwner` modifier on the `renounceOwnership` function. When you call `renounceOwnership`, the code inside `onlyOwner` executes **first**. Then when it hits the `_;` statement in `onlyOwner`, it goes back and executes the code inside `renounceOwnership`.

## Gas

In Solidity, your users have to pay every time they execute a function on your DApp using a currency called **_gas_**. Users buy gas with Ether (the currency on Ethereum), so your users have to spend ETH in order to execute functions on your DApp.

How much gas is required to execute a function depends on how complex that function's logic is. Each individual operation has a **_gas cost_** based roughly on how much computing resources will be required to perform that operation (e.g. writing to storage is much more expensive than adding two integers). The total **_gas cost_** of your function is the sum of the gas costs of all its individual operations.

**Struct packing to save gas**

Solidity reserves 256 bits of storage regardless of the `uint` size. For example, using `uint8` instead of `uint` (`uint256`) won't save you any gas.

But there's an exception to this: inside `struct`s.

If you have multiple `uint`s inside a struct, using a smaller-sized `uint` when possible will allow Solidity to pack these variables together to take up less storage. For example:

```rust

struct NormalStruct {
  uint a;
  uint b;
  uint c;
}

struct MiniMe {
  uint32 a;
  uint32 b;
  uint c;
}

// `mini` will cost less gas than `normal` because of struct packing
NormalStruct normal = NormalStruct(10, 20, 30);
MiniMe mini = MiniMe(10, 20, 30);
```

## Time Units

Solidity provides some native units for dealing with time.

The variable `now` will return the current unix timestamp of the latest block (the number of seconds that have passed since January 1st 1970). The unix time as I write this is `1515527488`.

> _Note: Unix time is traditionally stored in a 32-bit number. This will lead to the "Year 2038" problem, when 32-bit unix timestamps will overflow and break a lot of legacy systems. So if we wanted our DApp to keep running 20 years from now, we could use a 64-bit number instead — but our users would have to spend more gas to use our DApp in the meantime. Design decisions!_

Solidity also contains the time units `seconds`, `minutes`, `hours`, `days`, `weeks` and `years`. These will convert to a `uint` of the number of seconds in that length of time. So `1 minutes` is `60`, `1 hours` is `3600` (60 seconds x 60 minutes), `1 days` is `86400` (24 hours x 60 minutes x 60 seconds), etc.

```rust
uint lastUpdated;

// Set `lastUpdated` to `now`
function updateTimestamp() public {
  lastUpdated = now;
}

// Will return `true` if 5 minutes have passed since `updateTimestamp` was
// called, `false` if 5 minutes have not passed
function fiveMinutesHavePassed() public view returns (bool) {
  return (now >= (lastUpdated + 5 minutes));
}
```

## **Passing structs as arguments**

You can pass a storage pointer to a struct as an argument to a `private` or `internal` function.

```rust
function _doStuff(Zombie storage _zombie) internal {
  // do stuff with _zombie
}
```

## **Function modifiers with arguments**

```rust
// A mapping to store a user's age:mapping (uint => uint) public age;

// Modifier that requires this user to be older than a certain age:
modifier olderThan(uint _age, uint _userId) {
  require(age[_userId] >= _age);
  _;
}

// Must be older than 16 to drive a car (in the US, at least).// We can call the `olderThan` modifier with arguments like so:
function driveCar(uint _userId) public olderThan(16, _userId) {
// Some function logic
}
```

## **Saving Gas With 'View' Functions**

`view` functions don't cost any gas when they're called externally by a user.

This is because `view` functions don't actually change anything on the blockchain – they only read the data.

> _Note: If a `view` function is called internally from another function in the same contract that is **not** a `view` function, it will still cost gas. This is because the other function creates a transaction on Ethereum, and will still need to be verified from every node. So `view` functions are only free when they're called externally._

```rust
function getZombiesByOwner(address _owner) external view returns(uint[] memory) {
    // Start here
  }
```

## Storage is expensive

In order to keep costs down, you want to avoid writing data to storage except when absolutely necessary. Sometimes this involves seemingly inefficient programming logic — like rebuilding an array in `memory` every time a function is called instead of simply saving that array in a variable for quick lookups.

## **The `payable` Modifier**

`payable` functions are a special type of function that can receive Ether.

```rust
contract OnlineStore {
  function buySomething() external payable {
    // Check to make sure 0.001 ether was sent to the function call:
    require(msg.value == 0.001 ether);
    // If so, some logic to transfer the digital item to the caller of the function:
    transferThing(msg.sender);
  }
}
```

Here, `msg.value` is a way to see how much Ether was sent to the contract, and `ether` is a built-in unit.

## Withdraws

After you send Ether to a contract, it gets stored in the contract's Ethereum account, and it will be trapped there — unless you add a function to withdraw the Ether from the contract.

```rust
contract GetPaid is Ownable {
  function withdraw() external onlyOwner {
    address payable _owner = address(uint160(owner()));
    _owner.transfer(address(this).balance);
  }
}
```

It is important to note that you cannot transfer Ether to an address unless that address is of type `address payable`. But the `_owner` variable is of type `uint160`, meaning that we must explicitly cast it to `address payable`.
