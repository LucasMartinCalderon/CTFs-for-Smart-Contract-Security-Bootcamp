# The Enchanted Library CTF Challenge

## Story

In the mystical world of Etheria, there exists an ancient Enchanted Library, guarded by powerful spells to prevent magical beings from accessing its most forbidden spell. You, a clever spell thief, have discovered a loophole in the library's defenses. Can you bypass the magical aura detection to access the forbidden spell?

## Objectives

- Understand the "Bypass Contract Size Check" vulnerability in Solidity smart contracts.
- Learn how to deploy and interact with smart contracts using Remix IDE.
- Exploit the vulnerability to access the forbidden spell in the Enchanted Library.

## Learning Outcomes

- Comprehend how smart contracts check for external contract interactions.
- Explore the limitations of using `extcodesize` for security checks.
- Develop skills in smart contract exploitation.

## Instructions for Remix IDE

1. Open Remix IDE and create two files: `EnchantedLibrary.sol` and `SpellThief.sol`.
2. Compile both contracts using the Solidity compiler.
3. Deploy `EnchantedLibrary.sol` on a test network (e.g., Rinkeby or Goerli).
4. With the address of the deployed `EnchantedLibrary`, deploy `SpellThief.sol` to exploit the vulnerability.
5. Verify if the forbidden spell has been accessed by checking the `forbiddenSpellAccessed` variable in `EnchantedLibrary`.

## Questions to Ponder

- Why does the `hasMagicalAura` check fail to detect the `SpellThief` contract during its creation?
- Can you think of other ways to secure the `accessForbiddenSpell` function against unauthorized access?
- What are the implications of relying solely on `extcodesize` for security measures in smart contracts?

## Connect

[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)
