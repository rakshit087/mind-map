# ERC721 and Tokens

## Tokens on Etherium

A **_token_** on Ethereum is basically just a smart contract that follows some common rules — namely it implements a standard set of functions that all other token contracts share, such as `transferFrom(address _from, address _to, uint256 _tokenId)` and `balanceOf(address _owner)`.

Internally the smart contract usually has a mapping, `mapping(address => uint256) balances`, that keeps track of how much balance each address has.

## ERC721 (NFTs)

**_ERC721 tokens_** are **not** interchangeable since each one is assumed to be unique, and are not divisible. You can only trade them in whole units, and each one has a unique ID. So these are a perfect fit for making our zombies tradeable.

> _Note that using a standard like ERC721 has the benefit that we don't have to implement the auction or escrow logic within our contract that determines how players can trade / sell our zombies. If we conform to the spec, someone else could build an exchange platform for crypto-tradable ERC721 assets, and our ERC721 zombies would be usable on that platform. So there are clear benefits to using a token standard instead of rolling your own trading logic_

```rust
contract ERC721 {
  event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

  function balanceOf(address _owner) external view returns (uint256);
  function ownerOf(uint256 _tokenId) external view returns (address);
  function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
  function approve(address _approved, uint256 _tokenId) external payable;
}
```

# ERC720 Approval Flow

We don’t want to pull the ERC20 tokens from someone’s account with our smart contract, The `ERC20` standard comes with the concept of **Allowance**.

### **approve(address spender, uint256 amount)**

This allows a user to `approve` a different address to spend up to `amount` tokens on their behalf. i.e. This function provides an Allowance to the `spender`of up to `amount`

### **transferFrom(address from, address to, uint256 amount)**

Allows a user to transfer `amount`token from `from` to `to`. If the user calling the function is the same as the `from` address, tokens are removed from the user's balance. If the user is someone other than the `from`address, the `from` address must have in the past given the user allowance to spend `amount` tokens using the `approve`function.
