# The Shapeshifter's Gambit CTF Challenge

## Introduction

Welcome to the Etheric Consortium, where magic and governance intertwine through the power of the Ethereum blockchain. This CTF challenge invites you to explore a vulnerability known as the "Same Address Smart Contract" exploit, cloaked within a tale of mystical intrigue.

## Objective

Your quest is to uncover and exploit the shapeshifter's gambit, demonstrating how an approved DAO proposal can be replaced by a malicious one without the DAO's knowledge.

## Instructions for Remix IDE

1. **Setup**: Open Remix IDE and create two files: `EthericConsortiumDAO.sol` and `ShapeshifterGambit.sol`.
2. **Compile**: Use the Solidity compiler to compile both contracts.
3. **Deploy**: Deploy `EthericConsortiumDAO.sol` on a test network. Note the deployed address.
4. **Approve Proposal**: Use the DAO contract to approve an `ArtifactProposal`.
5. **Exploit**: Follow the steps in `ShapeshifterGambit.sol` to deploy a mimic artifact to the same address as the approved proposal.
6. **Enact Proposal**: Execute the proposal from the DAO and observe the outcome.

## Learning Questions

- How does the `CREATE2` opcode facilitate predictable contract deployment?
- What implications does the ability to deploy contracts to the same address have for contract immutability and trust?
- Reflect on the security measures that could prevent such an exploit.

## Connect

"[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)"
