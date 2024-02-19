// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Advanced Space Poacher
 * Objective: Exploit the storage layout of the Advanced Space Zoo to uncover the secret feeding schedules.
 * @author Lucas Martin Calderon, Pentestify LTD
 * Reflection: How does understanding Solidity's storage layout help in accessing supposedly inaccessible data?
 * Challenge: Use your knowledge of Ethereum storage to construct and execute a direct storage access.
 */


contract AdvancedSpacePoacher {
    address public spaceZooAddress;

    constructor(address _spaceZooAddress) {
        spaceZooAddress = _spaceZooAddress;
    }

    function getFeedingScheduleSlot(string memory species) public pure returns (uint256) {
        // Advanced Challenge: How does the encoding of keys affect their storage location?
        return uint256(keccak256(abi.encodePacked(keccak256(abi.encodePacked(species)), uint256(1))));
    }

    function readFeedingSchedule(string memory species) public view returns (bytes32) {
        uint256 slot = getFeedingScheduleSlot(species);
        bytes32 value;
        assembly {
            value := sload(slot)
        }
        return value;
    }
}
