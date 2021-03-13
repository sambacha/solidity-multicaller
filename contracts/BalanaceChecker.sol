// SPDX-License-Identifier: MIT
/// @title BalanceChecker MultiCall
/// @summary Batch ERC20 Balance Request
pragma solidity =0.4.26;

// @dev ERC20 contract interface - just the balanceOf interface
contract Token {
    function balanceOf(address) public view returns (uint256);
}
contract BalanceChecker {
    function() public payable {
        revert("BalanceChecker does not accept payments");
    }
    function tokenBalance(address user, address token) public view returns (uint256) {
        uint256 tokenCode;
        assembly {
            tokenCode := extcodesize(token)
        }
    // @dev is it a contract and does it implement balanceOf
        if (tokenCode > 0 && token.call(bytes4(0x70a08231), user)) {
            return Token(token).balanceOf(user);
        } else {
            return 0;
        }
    }
    function balances(address[] users, address[] tokens) external view returns (uint256[]) {
        uint256[] memory addrBalances = new uint256[](tokens.length * users.length);
        for (uint256 i = 0; i < users.length; i++) {
            for (uint256 j = 0; j < tokens.length; j++) {
                uint256 addrIdx = j + tokens.length * i;
                if (tokens[j] != address(0x0)) {
                    addrBalances[addrIdx] = tokenBalance(users[i], tokens[j]);
                } else {
                    addrBalances[addrIdx] = users[i].balance;
                    // @note ETH balance
                }
            }
        }
        return addrBalances;
    }
}
