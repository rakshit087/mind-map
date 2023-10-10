# Transferring Eth

# To Accounts

To transfer ETH to any account we use the `call` function which returns a `bool` value indicating if the transfer was successful or not.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SendEth {
	function sendEth(address payable _to) public payable {
		uint amountToSend = msg.value;
		(bool success, bytes memory data) = _to.call{value: msg.value}("");
		require(success == true, "Failed to send ETH");
	}
}
```

# To Smart Contracts

if you are writing a contract that you want to be able to receive ETH transfers directly, you must have at least one of the functions below

- `receive() external payable`
- `fallback() external payable`

`receive()` is called if `msg.data` is an empty value, and `fallback()` is used otherwise.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ReceiveEther {
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
```
