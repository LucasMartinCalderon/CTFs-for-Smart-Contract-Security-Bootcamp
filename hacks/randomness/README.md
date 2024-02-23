# The Curse of the Predictable Oracle CTF Challenge

## Overview

Embark on a quest to break the Curse of the Predictable Oracle. This challenge will test your wits and your skills in smart contract security, as you attempt to claim the Oracle's hidden treasures by exploiting a vulnerability in its secret-keeping algorithm.

## Objective

Your mission is to understand and exploit the vulnerability in the OracleOfFates contract to guess the secret number it generates and claim the ether it guards.

## The Challenge

The Oracle of Fates, a mystical artifact from ancient times, has a flaw in its design: the predictability of its secret number generation. Can you decipher the Oracle's secret and lift the curse that has protected its treasure for centuries?

## Instructions for Remix IDE

1. **Deploy OracleOfFates:**
   - Copy the `OracleOfFates.sol` contract code into Remix and deploy it with at least 1 ether.
2. **Deploy CurseBreaker:**
   - Copy the `CurseBreaker.sol` contract code into Remix.
   - Deploy `CurseBreaker` using the deployed `OracleOfFates` contract address.
3. **Claim the Treasure:**
   - Execute the `breakCurse` function in `CurseBreaker` to attempt to claim the Oracle's treasure.

## Learning Questions

- What is the vulnerability in the OracleOfFates contract, and why does it exist?
- How does the CurseBreaker contract exploit this vulnerability?
- Discuss the implications of using block properties (`blockhash`, `block.timestamp`) for generating random numbers in smart contracts.

## Success Criteria

- Successfully exploiting the OracleOfFates contract to transfer its ether to CurseBreaker.
- Gaining a deeper understanding of smart contract vulnerabilities related to pseudo-random number generation.

Follow for more adventures in smart contract security: [![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)
