```c
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract TestCall {
    function callMe(string memory _msg, uint256 _num)
        public
        pure
        returns (string memory, uint256)
    {
        return (_msg, _num);
    }
}

contract Call {
    function callCallMe(address _addr) external returns (bytes memory) {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("callMe(string,uint256)", "hello", 123)
        );
        require(success, "call failed");
        return data;
    }
}
```
