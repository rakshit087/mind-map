//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MultiSigWallet {
    event Deposit(address indexed sender, uint256 amount);
    event Submit(uint256 indexed txnId);
    event Approve(address indexed owner, uint256 indexed txnId);
    event Revoke(address indexed owner, uint256 indexed txnId);
    event Execute(uint256 indexed txnId);

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint256 public required;

    struct Transaction {
        address to;
        uint256 value;
        bytes data;
        bool executed;
    }

    Transaction[] public transactions;

    mapping(uint256 => mapping(address => bool)) public approved;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner");
        _;
    }

    modifier txnExists(uint256 _txnId) {
        require(_txnId < transactions.length, "txn does not exists");
        _;
    }

    modifier notApproved(uint256 _txnId) {
        require(!approved[_txnId][msg.sender], "txn already approved");
        _;
    }

    modifier notExecuted(uint256 _txnId) {
        require(!transactions[_txnId].executed, "txn already executed");
        _;
    }

    constructor(address[] memory _owners, uint256 _required) {
        require(_owners.length > 0, "owners required");
        require(
            _required > 0 && _required <= owners.length,
            "invalid required number"
        );

        for (uint256 i = 0; i < owners.length; i++) {
            address owner = _owners[i];

            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner is not unique");

            isOwner[owner] = true;
            owners.push(owner);
        }

        required = _required;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function submit(
        address _to,
        uint256 _value,
        bytes calldata _data
    ) external onlyOwner {
        transactions.push(
            Transaction({to: _to, value: _value, data: _data, executed: false})
        );
        emit Submit(transactions.length - 1);
    }

    function approve(uint256 _txnId)
        external
        onlyOwner
        txnExists(_txnId)
        notApproved(_txnId)
        notExecuted(_txnId)
    {
        approved[_txnId][msg.sender] = true;
        emit Approve(msg.sender, _txnId);
    }

    function _getApprovedCount(uint256 _txnId)
        private
        view
        returns (uint256 count)
    {
        for (uint256 i = 0; i < owners.length; i++) {
            if (approved[_txnId][owners[i]]) {
                count += 1;
            }
        }
    }

    function execute(uint256 _txnId)
        external
        txnExists(_txnId)
        notExecuted(_txnId)
    {
        require(_getApprovedCount(_txnId) >= required, "not enough approvals");
        Transaction storage txn = transactions[_txnId];
        txn.executed = true;
        (bool success, ) = txn.to.call{value: txn.value}(txn.data);
        require(success, "transaction failed");
        emit Execute(_txnId);
    }

    function revoke(uint256 _txId)
        external
        onlyOwner
        txnExists(_txId)
        notExecuted(_txId)
    {
        require(approved[_txId][msg.sender], "tx not approved");
        approved[_txId][msg.sender] = false;
        emit Revoke(msg.sender, _txId);
    }
}
