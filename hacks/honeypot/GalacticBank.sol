// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
GalacticBank is a high-tech financial institution handling interstellar transactions.
It rewards transactions with Galactic Credits (GC), but its withdraw function
is vulnerable to reentrancy attacks. Star Pirates may attempt to exploit this
to drain Ether and GC, but the bank has an undisclosed security measure.

1. The Intergalactic Council deploys GalacticSecurity.
2. The Council deploys GalacticBank with GalacticSecurity's address.
3. Users deposit Ether, earning GC rewards.
4. A Star Pirate discovers the reentrancy exploit and attempts to hack.
5. The hack may not go as planned due to hidden security measures...
*/

interface IGalacticSecurity {
  function log(address, uint256, string memory) external; 
}

contract GalacticBank {
    mapping(address => uint256) public etherBalances;
    mapping(address => uint256) public creditBalances;
    IGalacticSecurity security;

    constructor(IGalacticSecurity _security) {
        security = IGalacticSecurity(_security);
    }

    function deposit() public payable {
        etherBalances[msg.sender] += msg.value;
        // Reward the transaction with Galactic Credits (GC)
        creditBalances[msg.sender] += msg.value / 1000;
        security.log(msg.sender, msg.value, "Deposit");
    }

    function withdraw(uint256 _amount) public {
        require(_amount <= etherBalances[msg.sender], "Insufficient funds");
        (bool sent,) = msg.sender.call{value: _amount}("");
        require(sent, "Failed to send Ether");
        etherBalances[msg.sender] -= _amount;
        // Log the transaction
        security.log(msg.sender, _amount, "Withdraw");
    }
}

contract GalacticSecurity {
    // This contract will hint at additional security but is actually vulnerable
    event Log(address caller, uint256 amount, string action);

    function log(address _caller, uint256 _amount, string memory _action) public {
        emit Log(_caller, _amount, _action);
    }
}
