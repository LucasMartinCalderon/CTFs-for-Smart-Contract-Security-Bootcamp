// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Advanced Space Zoo Contract
 * @author Lucas Martin Calderon, Pentestify LTD
 * Objective: Uncover the secret feeding schedules of the galaxy's most mystical creatures.
 * Challenge: The feeding schedules are stored securely. Or so we thought. Can you access them?
 * 
 * Hint 1: Solidity's storage is linear and predictable. How does this impact the privacy of stored data?
 * Hint 2: Consider how mappings and dynamic arrays are stored in Solidity. What does this mean for "private" data?
 * Hint 3: The keccak256 hash function plays a crucial role in how Solidity manages storage. Can you leverage this?
 */

contract AdvancedSpaceZoo {
    uint public totalAnimals = 4;
    address public zooKeeper = msg.sender;

    mapping(bytes32 => bytes32) private feedingSchedules;

    constructor() {
        feedingSchedules[keccak256(abi.encodePacked("SpaceWhale"))] = keccak256(abi.encodePacked("Midnight"));
        feedingSchedules[keccak256(abi.encodePacked("QuantumTiger"))] = keccak256(abi.encodePacked("Dawn"));
        feedingSchedules[keccak256(abi.encodePacked("GalacticPeacock"))] = keccak256(abi.encodePacked("Afternoon"));
        feedingSchedules[keccak256(abi.encodePacked("VoidBear"))] = keccak256(abi.encodePacked("Twilight"));
    }

    function addAnimal(bytes32 species, bytes32 feedingSchedule) public {
        require(msg.sender == zooKeeper, "Only the ZooKeeper can add new animals.");
        feedingSchedules[species] = feedingSchedule;
        totalAnimals++;
    }

    // Educational helper function to illustrate the calculation for storage locations
    function calculateStorageLocation(string memory key) public pure returns (bytes32) {
        // Question: How does this calculation influence your approach to uncovering private data?
        return keccak256(abi.encodePacked(key));
    }
}
