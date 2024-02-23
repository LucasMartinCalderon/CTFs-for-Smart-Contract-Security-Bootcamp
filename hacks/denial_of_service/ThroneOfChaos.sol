// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ThroneOfChaos
 * @dev Become the ruler by sending more Ether than the current ruler. 
 * Beware, the throne holds a dark secret that could end its legacy.
 * 
 * The Throne of Chaos challenges adventurers to claim its power, but 
 * only the wise and cunning can uncover its vulnerability.
 * 
 * Author: Lucas Martin Calderon
 * Challenge: Can you exploit the throne's curse and become the eternal ruler?
 */
contract ThroneOfChaos {
    address public ruler;
    uint public tribute;

    constructor() payable {}

    function claimThrone() external payable {
        require(msg.value > tribute, "Your tribute is too low.");

        (bool sent, ) = ruler.call{value: tribute}("");
        require(sent, "Failed to dethrone the current ruler.");

        tribute = msg.value;
        ruler = msg.sender;
    }
}
