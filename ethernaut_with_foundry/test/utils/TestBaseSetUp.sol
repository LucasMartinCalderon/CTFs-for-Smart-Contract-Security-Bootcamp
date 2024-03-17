// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol"; 
import {Vm} from "forge-std/Vm.sol";
import "./TestUtilities.sol";
import "../../src/Ethernaut.sol";

abstract contract TestBaseSetUp is Test {
    Ethernaut public ethernaut;
    TestUtilities public utils;

    address payable[] internal users; 
    address payable internal owner; 
    address payable internal player; 
    uint256 private userCount; 
    uint256 private userInitialFunds = 100 ether; 
    string[] private userLabels;  
    Level internal levelFactory; 
    address payable internal levelAddress; 

    constructor() {
        userCount = 2; 
        userInitialFunds = 5 ether; 
        userLabels = new string[](userCount);
        userLabels[0] = "Owner";
        userLabels[1] = "Player";
    }

    function setUp() public virtual {
        require(address(levelFactory) != address(0), "please set up levelFactory");

        ethernaut = new Ethernaut();
        utils = new TestUtilities();
        ethernaut.registerLevel(levelFactory);

        if(userCount > 0) {
            users = utils.createUsers(userCount, userInitialFunds, userLabels);
            owner = users[0];
            player = users[1];
        }
    }

    function createLevelInstance(bool _fromPlayer) external payable returns(address) {
        require(address(levelFactory) != address(0), "please set up levelFactory");
        require(address(ethernaut) != address(0), "please set up ethernaut");
        require(address(utils) != address(0), "please set up utils");

        if(_fromPlayer) {
            vm.prank(player);
        } 

        return ethernaut.createLevelInstance{value: msg.value}(levelFactory);
    }

    function runLevel() public {
        // set up the exploit
        setUpLevel(); 

        // run the exploit
        exploitLevel();

        // check if the exploit was successful
        checkLevel();
    }

    function setUpLevel() virtual internal;
    function exploitLevel() virtual internal;
    function checkLevel() virtual internal {
        // check if the level was successful
        vm.startPrank(player);
        // check if the level was successful
        bool success = ethernaut.submitLevelInstance(payable(levelAddress));
        assertTrue(success, "Solution is not solving the level");

        vm.stopPrank();
    }
}

