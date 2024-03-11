// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/utils/Strings.sol";

contract GalacticHiddenLogger {
    function log(address _caller, uint256 _amount, string calldata _action) public view {
        if(keccak256(abi.encodePacked(_action)) == keccak256(abi.encodePacked("Withdraw"))) {
            revert(string(abi.encodePacked("It is a trap! The address of the hacked hacker is: ", Strings.toHexString(uint160(msg.sender), 20))));
        }
    }
}
