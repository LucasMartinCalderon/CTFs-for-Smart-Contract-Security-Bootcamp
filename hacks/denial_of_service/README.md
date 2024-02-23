# Throne of Chaos CTF Challenge

## Overview

Welcome to the Throne of Chaos CTF Challenge, a quest set in a blockchain realm where participants must exploit a vulnerability in the ThroneOfChaos contract to become the eternal ruler of the digital kingdom.

## Objective

Uncover and exploit the vulnerability within the ThroneOfChaos contract to lock the throne and prevent any future claims. Will you rise as the eternal ruler, or will you fall trying?

## The Challenge

The Throne of Chaos is not just a seat of power—it's a test of cunning and wisdom. The throne's dark secret has kept it from being claimed forever. It's your task to discover this secret and exploit it to your advantage.

## Instructions for Remix IDE

1. **Deploy ThroneOfChaos:**
   - Copy the `ThroneOfChaos.sol` contract code into Remix and deploy it with some Ether.
2. **Deploy EternalRuler:**
   - Copy the `EternalRuler.sol` contract code into Remix.
   - Deploy `EternalRuler` using the deployed `ThroneOfChaos` contract address and send some Ether to claim the throne.
3. **Seize the Throne:**
   - Execute the `seizeControl` function in `EternalRuler` with an Ether value higher than the current tribute to claim the throne.

## Learning Questions

- What is the vulnerability in the ThroneOfChaos contract, and why does it exist?
- How does the EternalRuler contract exploit this vulnerability?
- Discuss the implications of contracts that can receive and send Ether without proper safeguards.

## Success Criteria

- You have successfully exploited the ThroneOfChaos contract to become the eternal ruler.
- You have gained a deeper understanding of contract vulnerabilities related to Ether transactions and fallback functions.

For more insights into smart contract security, follow: [![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)
