## Developer Notes

Check the token balance of a wallet in a token contract <br>
    Returns the balance of the token for user. Avoids possible errors:  <br>
    - return 0 on non-contract address   <br>
    - returns 0 if the contract doesn't implement balanceOf  <br>


Check the token balances of a wallet for multiple tokens.  <br>
    Pass 0x0 as a "token" address to get ETH balance.  <br>
    Possible error throws:  <br>
    - extremely large arrays for user and or tokens (gas cost too high)   <br>
 

Returns a one-dimensional that's user.length * tokens.length long. The  <br>
array is ordered by all of the 0th users token balances, then the 1th  <br>
user, and so on.  <br>



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
