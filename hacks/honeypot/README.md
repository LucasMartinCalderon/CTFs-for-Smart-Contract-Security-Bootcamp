# Galactic Bank and the Star Pirates: A Solidity CTF Challenge

## Overview

In the vast expanse of the Ethereum galaxy, the Galactic Bank has served as a beacon of commerce and stability. But beneath the surface, whispers of vulnerabilities have attracted the notorious Star Pirates, skilled hackers infamous for their cunning and greed. This Capture The Flag (CTF) challenge invites you to explore the realms of smart contract security, pitting you against the Galactic Bank's defenses to uncover and exploit a reentrancy vulnerability.

### Objectives

- Understand the concept of reentrancy vulnerabilities in Solidity smart contracts.
- Learn to identify and exploit weaknesses in smart contract code.
- Gain practical experience with Solidity development and smart contract security.

## Challenge Setup

### Prerequisites

- Basic understanding of Ethereum and smart contracts.
- Some familiarity with Solidity and the Ethereum Virtual Machine (EVM).
- Access to [Remix IDE](https://remix.ethereum.org/) for deploying and interacting with smart contracts.

### Deploy the Contracts

1. **GalacticBank.sol**: This contract simulates a futuristic bank with a reentrancy vulnerability in its withdrawal function.
2. **StarPirateAttack.sol**: This adversarial contract is designed to exploit the vulnerability in GalacticBank.sol.

#### Steps

1. Open Remix IDE and create a new file named `GalacticBank.sol`. Copy the provided GalacticBank contract code into this file.
2. Create another new file named `StarPirateAttack.sol`. Copy the provided StarPirateAttack contract code into this file.
3. Compile both contracts using Remix's Solidity compiler.
4. Deploy `GalacticBank.sol` onto a test network (e.g., Rinkeby or Goerli). Note the deployed contract address.
5. Deploy `StarPirateAttack.sol`, providing the address of the deployed `GalacticBank` contract as a constructor parameter.

### Execute the Hack

1. Interact with the `GalacticBank` contract to deposit some Ether.
2. Using the `StarPirateAttack` contract, initiate the attack by calling its `attack` function with some Ether.
3. Observe the transaction results and contract balances to verify if the exploit was successful.

## Learning Questions

- What is a reentrancy attack, and how can it affect smart contracts?
- How does the `StarPirateAttack` contract exploit the vulnerability in `GalacticBank`?
- What are some best practices for preventing reentrancy vulnerabilities in smart contracts?

## Further Exploration

- Modify the `GalacticBank` contract to prevent the reentrancy attack. Hint: Consider reordering transactions or using the `Checks-Effects-Interactions` pattern.
- Explore additional security mechanisms, such as reentrancy guards or the use of external security libraries.

## Connect

Stay updated with the latest in smart contract security and share your thoughts on this challenge:

"[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)"
