# Time Manipulation Challenge

## Introduction

Welcome to the Time Manipulation Challenge! This Capture The Flag (CTF) exercise immerses you in the world of Ethereum smart contracts, highlighting a vulnerability related to block timestamp manipulation. You'll explore security considerations in smart contract development, especially the risks of relying on block timestamps.

## Objective

Your mission is to exploit a vulnerability in the `TimeCapsule` smart contract, which incorrectly uses `block.timestamp` for critical logic. This experience will teach you about the effects of miner-controlled variables and their potential for exploitation.

## Learning Outcomes

- Understand the vulnerability associated with block timestamp manipulation in Solidity smart contracts.
- Identify and exploit vulnerabilities in smart contracts through practical experience.
- Learn best practices in smart contract development to avoid common security issues.

## Instructions for Use with Remix IDE

### Setup

1. Open [Remix IDE](https://remix.ethereum.org) in your browser.
2. Create two new files: `TimeCapsule.sol` and `TimeCapsuleExploit.sol`.
3. Copy and paste the smart contract code provided into the respective files.

### Compile Contracts

1. Go to the "Solidity Compiler" tab in Remix IDE.
2. Choose the compiler version (at least 0.8.24).
3. Compile `TimeCapsule.sol` and then `TimeCapsuleExploit.sol`.

### Deploy Contracts

1. Switch to the "Deploy & Run Transactions" tab.
2. Use Metamask to connect to a test network (e.g., Rinkeby or Goerli).
3. Deploy `TimeCapsule.sol` with enough Ether for potential winnings.
4. Note the address of the deployed `TimeCapsule` contract.

### Execute the Attack

1. In the "Deploy & Run Transactions" tab, select `TimeCapsuleExploit.sol` from the compiled contracts.
2. Provide the deployed `TimeCapsule` contract's address as a parameter to the `TimeCapsuleExploit` constructor.
3. Deploy `TimeCapsuleExploit` with at least 1 Ether for the message deposit.
4. Use the `exploit` function in `TimeCapsuleExploit`, inputting the `TimeCapsule` contract's address.

## Learning Questions

- What makes relying on `block.timestamp` for critical contract logic risky?
- How can a miner influence the outcome of the `TimeCapsule` contract?
- Can you propose alternative mechanisms to achieve similar functionality without this vulnerability?

## Connect

Follow us on Twitter for more insights and challenges: [![Follow @lmc_security](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)

## Conclusion

Completing this challenge enhances your understanding of Solidity smart contract security. The blockchain landscape is constantly evolving, making it crucial to stay informed about vulnerabilities and mitigation strategies to be an effective smart contract developer.
