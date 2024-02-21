// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title QuantumGate
 * @notice This contract represents the Quantum Gate that guards the access to the Quantum Realm.
 * @dev This contract contains a vulnerability similar to the delegatecall exploit shown in HackMe.
 * @author Lucas Martin Calderon
 * Can you uncover the vulnerability that allows changing the guardian of the Quantum Realm?
 * 
 * Instructions:
 * 1. Deploy QuantumLib with the correct access code.
 * 2. Deploy QuantumGate with the address of QuantumLib.
 * 3. Discover the method to change the guardian by exploiting the vulnerability.
 */

contract QuantumLib {
    address public guardian;

    function changeGuardian() public {
        guardian = msg.sender;
    }
}

contract QuantumGate {
    address public guardian = msg.sender;
    QuantumLib public quantumLib;

    constructor(QuantumLib _quantumLib) {
        quantumLib = QuantumLib(_quantumLib);
    }

    fallback() external payable {
        address(quantumLib).delegatecall(msg.data);
    }
}
