// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title OracleOfFates
 * @dev A mystical artifact that rewards those who can guess its secret number.
 * The secret is thought to be unpredictable, generated from the ether itself.
 * But is there a curse of predictability lying beneath its arcane algorithms?
 * 
 * To claim the Oracle's treasure, one must guess the secret number it conceives
 * at the moment of the trial. Many have tried, yet the Oracle's riches remain
 * unclaimed. Will you be the one to unveil the mystery and break the curse?
 * 
 * Author: Lucas Martin Calderon
 * Challenge: Can you decipher the Oracle's secret and claim its hidden treasures?
 */
contract OracleOfFates {
    uint public constant REWARD = 1 ether;

    constructor() payable {}

    function divineSecret(uint _guess) public {
        uint secret = uint(
            keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))
        );

        if (_guess == secret) {
            (bool sent, ) = msg.sender.call{value: REWARD}("");
            require(sent, "The Oracle refuses to relinquish its treasure.");
        }
    }
}
