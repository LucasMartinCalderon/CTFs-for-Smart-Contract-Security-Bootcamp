// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title EnchantedLibrary
 * @dev This contract represents a magical library containing ancient spells. Only non-magical beings can access the forbidden spell.
 */
contract EnchantedLibrary {
    // This function checks if the caller is a magical being by looking for a magical aura (code size).
    function hasMagicalAura(address being) public view returns (bool) {
        uint256 auraSize;
        assembly {
            auraSize := extcodesize(being)
        }
        return auraSize > 0;
    }

    bool public forbiddenSpellAccessed = false;

    // Access the forbidden spell. Requires that the caller is not a magical being.
    function accessForbiddenSpell() external {
        require(!hasMagicalAura(msg.sender), "Magical beings are not allowed");
        forbiddenSpellAccessed = true;
    }
}

