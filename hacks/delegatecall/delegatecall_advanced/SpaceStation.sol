// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SpaceStation
 * @notice A contract for managing a space station's resources.
 * @dev Contains a vulnerability similar to the described delegatecall exploit.
 * The goal is to subtly introduce the delegatecall vulnerability in a space-themed scenario.
 * Can you identify and exploit the vulnerability to take over the space station?
 * @author Lucas Martin Calderon
 */

contract ResourceControl {
    uint public oxygenLevel;
    
    function adjustOxygenLevel(uint _level) public {
        oxygenLevel = _level;
    }
}

contract SpaceStation {
    address public controlModule;
    address public commander;
    uint public oxygenLevel;

    constructor(address _controlModule) {
        controlModule = _controlModule;
        commander = msg.sender;
    }

    function adjustOxygenLevel(uint _level) public {
        controlModule.delegatecall(abi.encodeWithSignature("adjustOxygenLevel(uint256)", _level));
    }
}
