// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EtherVault
 * @dev A vault designed to secure Ether, with withdrawals only permitted to the vault's creator.
 * Unfortunately, the vault's security relies on tx.origin for authentication, a critical oversight
 * that might just be its Achilles' heel.
 * 
 * Author: Lucas Martin Calderon
 * Challenge: Can you exploit the vault's flawed security to make off with its riches?
 */
contract EtherVault {
    address public creator;

    event EtherDeposited(uint amount);
    event EtherWithdrawn(address to, uint amount);

    constructor() payable {
        creator = msg.sender;
    }

    function deposit() external payable {
        emit EtherDeposited(msg.value);
    }

    function withdraw(address payable _to, uint _amount) external {
        require(tx.origin == creator, "Unauthorized: caller is not the creator");
        require(address(this).balance >= _amount, "Insufficient balance");

        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send Ether");
        emit EtherWithdrawn(_to, _amount);
    }
}
