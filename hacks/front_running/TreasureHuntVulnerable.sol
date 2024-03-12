// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
TreasureHunt is a game where participants find the secret phrase that hashes to a specific value.
However, this game is vulnerable to front-running attacks.
*/

contract TreasureHuntVulnerable {
    bytes32 public constant targetHash = 0x...; // The hash of the secret phrase
    uint public prize;
    bool public solved;

    event TreasureClaimed(address winner);

    constructor() payable {
        prize = msg.value;
        solved = false;
    }

    function claimTreasure(string memory _secret) public {
        require(!solved, "Treasure has already been claimed.");
        require(keccak256(abi.encodePacked(_secret)) == targetHash, "Incorrect secret.");

        (bool sent, ) = msg.sender.call{value: prize}("");
        require(sent, "Failed to send Ether.");
        solved = true;
        emit TreasureClaimed(msg.sender);
    }
}
