# QuantumVault CTF Challenge

## Objective

Welcome to the QuantumVault CTF Challenge. In this futuristic scenario, you are tasked with exploiting a vulnerability in the QuantumVault, a contract designed to securely store quantum tokens. Your goal is to identify the vulnerability and exploit it to drain the QuantumVault of its funds.

## Story

In a world where quantum computing and blockchain technology have merged, the QuantumVault was created to offer unparalleled security for token storage. However, even the most advanced technologies have their weaknesses. A flaw in the QuantumVault's logic allows for a potential exploit. Can you uncover and exploit this vulnerability?

## Instructions

### Setting Up Remix IDE

1. Visit [Remix IDE](https://remix.ethereum.org).
2. Create a new file called `QuantumVault.sol` and copy-paste the QuantumVault contract code into this file.
3. Create another new file called `QuantumHacker.sol` and copy-paste the QuantumHacker contract code into this file.
4. Compile both contracts using the Solidity compiler (version 0.8.20 or compatible).

### Deploying the Contracts

1. Open the "Deploy & Run Transactions" plugin from the side panel.
2. Select the `QuantumVault` contract and deploy it. This will be the target of your hack.
3. Note the deployed contract's address.

### Executing the Hack

1. In the `QuantumHacker` contract deployment form, enter the QuantumVault's address as a constructor parameter.
2. Deploy the `QuantumHacker` contract.
3. Send at least 1 ether to the `QuantumHacker` contract using the `initiateHack` function to start the exploit.
4. Observe the `QuantumHacker` contract's balance increase as it drains funds from the QuantumVault.

### Learning Outcome

Through this challenge, you will learn about the reentrancy vulnerability, how it can be exploited, and the importance of secure coding practices in smart contract development. Reflect on the use of reentrancy guards and the checks-effects-interactions pattern to mitigate such vulnerabilities.

Good luck, and may the quantum force be with you!

[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)
