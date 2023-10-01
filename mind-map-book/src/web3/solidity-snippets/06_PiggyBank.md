```c
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract PiggyBank {
    address public owner = msg.sender;

    receive() external payable {}

    function withdraw() external {
        require(msg.sender == owner);
        //selfdestruct - destroys the contract and send the stored eth to the arg
        selfdestruct(payable(msg.sender));
    }
}
```
