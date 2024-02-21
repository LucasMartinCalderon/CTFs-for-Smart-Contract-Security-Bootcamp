# Quantum Realm CTF Challenge

## Overview

Dive into the depths of Ethereum smart contract vulnerabilities with the Quantum Realm CTF Challenge. This challenge is designed to test your skills in identifying and exploiting a delegatecall vulnerability, similar to what was illustrated in the HackMe contract.

## Objectives

- Understand and exploit the delegatecall vulnerability.
- Learn how to secure smart contracts against such vulnerabilities.

## Story

The Quantum Realm, a place of immense power, is guarded by the Quantum Gate. However, a vulnerability in the gate's mechanism allows for the guardian to be changed through a cunning exploit. Your mission is to take control of the Quantum Gate and access the Quantum Realm.

## Instructions for Remix IDE

1. **Deploy QuantumLib:**
   - Copy the `QuantumLib` contract code into Remix and deploy it.

2. **Deploy QuantumGate:**
   - Copy the `QuantumGate` contract code into Remix, making sure to include the address of the deployed `QuantumLib` as a constructor parameter.
   
3. **Exploit the Vulnerability:**
   - Deploy the `QuantumHacker` contract with the address of the deployed `QuantumGate`.
   - Execute the `attack` function to change the guardian of the Quantum Realm.

## Learning Questions

- How does the delegatecall vulnerability work, and why is it dangerous?
- What steps can be taken to prevent such vulnerabilities in smart contracts?
- Reflect on the importance of understanding low-level mechanisms like delegatecall in contract security.

## Success Criteria

- Successfully exploiting the QuantumGate to become the guardian.
- Gaining a deeper understanding of smart contract vulnerabilities and their mitigations.


[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)
