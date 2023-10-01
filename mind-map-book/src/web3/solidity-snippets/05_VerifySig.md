```c
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract VerifySig {
    function verify(
        address _signer,
        string memory _message,
        bytes memory _sig
    ) external pure returns (bool) {
        //01. Hash the message
        bytes32 messageHash = getMessageHash(_message);
        //02. Prefix the message hash and hash it again, this will be signed offchain
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        //03. Recover the signer's public address and compare it with _signer.
        return recover(ethSignedMessageHash, _sig) == _signer;
    }

    function getMessageHash(string memory _message)
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(_message));
    }

    function getEthSignedMessageHash(bytes32 _messageHash)
        public
        pure
        returns (bytes32)
    {
        return
            keccak256(
                abi.encodePacked(
                    "\x19Ethereum Signed Message:\n32",
                    _messageHash
                )
            );
    }

    //Takes in the ethSignedMessage and Signature as parameters
    function recover(bytes32 _signedMessageHash, bytes memory _signature)
        public
        pure
        returns (address)
    {
        (bytes32 r, bytes32 s, uint8 v) = _splitSignature(_signature);
        return ecrecover(_signedMessageHash, v, r, s);
    }

    //Splits the signature into three parts as required by ecrecover
    function _splitSignature(bytes memory _signature)
        internal
        pure
        returns (
            bytes32 r,
            bytes32 s,
            uint8 v
        )
    {
        require(_signature.length == 65, "Invalid signature length");
        /*
            First 32 bytes stores the length of the signature

            add(sig, 32) = pointer of sig + 32
            effectively, skips first 32 bytes of signature

            mload(p) loads next 32 bytes starting at the memory address p into memory
        */
        assembly {
            r := mload(add(_signature, 32))
            s := mload(add(_signature, 64))
            v := byte(0, mload(add(_signature, 96)))
        }
    }
}
```
