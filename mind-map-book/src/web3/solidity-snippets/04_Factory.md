```c
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Account {
    address public owner;
    address public bank;

    constructor(address _owner) payable {
        owner = _owner;
        bank = msg.sender;
    }
}

contract AccountFactory {
    address[] public accounts;

    function createAccount() external payable {
        address newAccount = address(new Account{value: msg.value}(msg.sender));
        accounts.push(newAccount);
    }
}
```
