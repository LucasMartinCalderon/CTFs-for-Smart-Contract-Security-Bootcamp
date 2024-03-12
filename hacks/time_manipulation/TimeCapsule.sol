// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
The TimeCapsule contract allows users to store messages that will be revealed only after a certain block timestamp is reached. 
A user must send a minimum of 1 Ether along with their message. If the current block timestamp is an exact multiple of the target reveal time (e.g., every 10 minutes), the sender wins all the Ether in the contract.

However, this contract has a vulnerability related to the manipulation of the block timestamp by miners, which can be exploited. Consider how the integrity of the reveal time can be compromised and the implications of relying on block.timestamp for critical logic.

Challenge: Think about what could happen if a miner, with the power to influence the timestamp of a block, decided to participate.
*/

contract TimeCapsule {
    struct Message {
        address sender;
        string message;
        uint256 revealTime;
    }

    Message[] public messages;
    uint256 public minimumDeposit = 1 ether;

    function storeMessage(string calldata _message, uint256 _revealTime) external payable {
        require(msg.value >= minimumDeposit, "Insufficient Ether sent.");
        require(block.timestamp < _revealTime, "Reveal time must be in the future.");

        messages.push(Message(msg.sender, _message, _revealTime));
    }

    function revealMessages() external {
        require(messages.length > 0, "No messages to reveal.");
        for(uint i = 0; i < messages.length; i++) {
            if(block.timestamp >= messages[i].revealTime && block.timestamp % 10 minutes == 0) {
                (bool sent,) = messages[i].sender.call{value: address(this).balance}("");
                require(sent, "Failed to send Ether");
                break; // Ensure only one winner per reveal attempt
            }
        }
    }
}
