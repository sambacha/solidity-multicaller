    ERC20 methods interface:

    · totalSupply

    · balanceOf(address _owner) constant returns (uint256 balance)

    · transfer(address _to, uint256 _value) returns (bool success)

    · transferFrom(address _from, address _to, uint256 _value) returns (bool success)

    · approve(address _spender, uint256 _value) returns (bool success)

    · allowance(address *_owner*, address *_spender*) constant returns (uint256 remaining)

You can get the same using geth console and following command

```js
web3.sha3('balanceOf(address)').substring(0,10) // 0x70a08231
```

Following are the Keccak hash of some of the ERC20 methods

```ts
totalSupply:   '0x18160ddd'
balanceOf:     '0x70a08231'
transfer:      '0xa9059cbb'
transferFrom:  '0x23b872dd'
approve:       '0x095ea7b3'
allowance:     '0xdd62ed3e'
decimals:      '0x313ce567'
```
