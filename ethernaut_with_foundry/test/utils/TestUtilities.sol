// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";


contract TestUtilities is Test {
    address internal nextUser = address(uint160(uint256(keccak256(abi.encodePacked("user address"))))); 

    // To be used in the main test file to get the next user address
    function getNextUserAddress() view external returns(address payable) {
        return payable(nextUser);
    }

    // To be used in the main test file to create new users with number of users, initial funds and labels for each user
    function createUsers(uint256 _numUsers, uint256 _initialFunds, string[] memory _userLabels) public returns(address payable[] memory) {
        address payable[] memory users = new address payable[](_numUsers); 
        for(uint256 i = 0; i < _numUsers; i++) {
            users[i] = this.getNextUserAddress();
            vm.deal(users[i], _initialFunds);
            if(_userLabels.length > 0) {
                vm.label(users[i], _userLabels[i]);
            }
        }
        return users;
    }

    // To be used in the main test file to create new users with number of users and custom initial funds with empty labels
    function createUsers(uint256 _numUsers, uint256 _intialFunds) public returns(address payable[] memory) {
        string[] memory a; 
        return createUsers(_numUsers, _intialFunds, a);
    }

    // To be used in the main test file to create new users with number of users and default initial funds of 100 with empty labels
    function createUsers(uint256 _numUsers) public returns(address payable[] memory) {
        string[] memory a; 
        return createUsers(_numUsers, 100, a);
    }

    // Using Foundry's default VM to mine blocks in the test environment to simulate time passing
    function mineBlocks(uint256 _numBlocks) public {
        uint256 targetBlock = block.number + _numBlocks;
        vm.roll(targetBlock);
    }

    // Using Foundry's default VM to mine seconds in the test environment to simulate time passing
    function timeMine(uint256 _numSeconds) external {
        uint256 targetTimestamp = block.timestamp + _numSeconds;
        vm.warp(targetTimestamp);
    }
}

