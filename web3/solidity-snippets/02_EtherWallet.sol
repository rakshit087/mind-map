//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract EtherWallet {
    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external onlyOwner {
        require(address(this).balance >= _amount, "not enough funds");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
