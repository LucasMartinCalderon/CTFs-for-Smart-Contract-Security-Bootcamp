# SpaceStation Takeover CTF Challenge

## Overview

Welcome to the SpaceStation Takeover Challenge! This CTF is designed to introduce you to the intricacies of the delegatecall vulnerability within Solidity smart contracts, using a space exploration theme.

## Objective

Your mission, should you choose to accept it, is to exploit the delegatecall vulnerability in the SpaceStation contract to become the new commander of the station.

## Story

In the vast expanse of space, the control of a space station is crucial for galactic dominance. A vulnerability in the space station's resource management system allows an astute hacker to take over. Can you become the new commander?

## Instructions for Remix IDE

1. **Deploy ResourceControl:**
   - Copy the `ResourceControl` contract code into Remix and deploy it.
2. **Deploy SpaceStation:**
   - With the address of `ResourceControl`, deploy the `SpaceStation` contract.
3. **Deploy SpacePirate:**
   - Deploy `SpacePirate` with the address of `SpaceStation`.
4. **Hijack the Station:**
   - Execute the `hijackStation` function in `SpacePirate` to take over `SpaceStation`.

## Learning Questions

- What is the delegatecall vulnerability, and why is it dangerous?
- How does the storage layout play a crucial role in the exploitation?
- Reflect on the steps needed to secure smart contracts against such vulnerabilities.

## Success Criteria

- You have successfully taken over the space station.
- You understand the delegatecall vulnerability and how to mitigate it in your smart contracts.

Connect with me for more insights and discussions on Solidity security:
[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)
