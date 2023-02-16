//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// recieve vs fallback
/* 
    fallback runs when a function is called that does not exist
    recieve runs when ether is sent to the contract
    if call data is not empty, fallback is called
    else if both are defined, recieve takes precedence
    if recieve is not defined, fallback is called
*/

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

    function withdrawUsingCall(uint256 _amount) external onlyOwner {
        require(address(this).balance >= _amount, "not enough funds");
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "failed to send ether");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
