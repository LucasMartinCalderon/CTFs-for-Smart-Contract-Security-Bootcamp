// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title QuantumVault
 * @author Lucas Martin Calderon, Pentestify LTD
 * Scenario: In a technologically advanced era, the QuantumVault offers secure storage for quantum tokens.
 * This contract contains a vulnerability. Can you identify and exploit it?
 * Hint: The way funds are withdrawn seems sequential, but what if it's interrupted?
 */

contract QuantumVault {
    mapping(address => uint) public tokenBalances;

    event DepositMade(address indexed depositor, uint amount);
    event WithdrawalMade(address indexed withdrawer, uint amount);

    // Deposit tokens into the vault
    function depositTokens() public payable {
        require(msg.value > 0, "Deposit must be positive");
        tokenBalances[msg.sender] += msg.value;
        emit DepositMade(msg.sender, msg.value);
    }

    // Withdraw tokens from the vault
    function withdrawTokens() public {
        uint balance = tokenBalances[msg.sender];
        require(balance > 0, "Insufficient token balance");

        // How secure is calling external addresses during a withdrawal?
        (bool sent, ) = msg.sender.call{value: balance}("");
        require(sent, "Failed to send tokens");

        tokenBalances[msg.sender] = 0;
        emit WithdrawalMade(msg.sender, balance);
    }

    // Check the vault's balance
    function getVaultBalance() public view returns (uint) {
        return address(this).balance;
    }
}
