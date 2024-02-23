# The Deceptive Oracle CTF Challenge

## Overview
Welcome to "The Deceptive Oracle" challenge, where you will explore vulnerabilities in smart contract interactions within the Ethereum blockchain. This CTF challenges you to exploit the TrustedOracle's design flaw, using a malicious contract to manipulate its outcomes.

## Objective
Demonstrate how the TrustedOracle can be deceived into spreading false data by interacting with the DeceptiveOracle contract.

## Instructions for Remix IDE
1. **Deploy the TrustedOracle Contract**:
   - Compile and deploy `TrustedOracle.sol`, providing the address of a legitimate `IDataRetriever` contract.
   
2. **Deploy the DeceptiveOracle Contract**:
   - Compile and deploy `DeceptiveOracle.sol`. This contract will serve as your tool to manipulate the TrustedOracle.

3. **Execute the Attack**:
   - Call the `attack` function on your `DeceptiveOracle` contract, passing in the address of the deployed `TrustedOracle`.
   - Observe how the `TrustedOracle` is tricked into emitting false data.

## Learning Questions
- What is the vulnerability exploited in this challenge, and how does it affect the integrity of smart contracts?
- How can smart contracts ensure the authenticity of the addresses they interact with?
- Discuss the implications of unchecked external calls in smart contract development.

## Success Criteria
- Successfully manipulating the TrustedOracle to emit false data.
- Gaining a deeper understanding of smart contract vulnerabilities related to external interactions.
- Learning best practices to safeguard against such vulnerabilities.

Connect with us for more insights and discussions on smart contract security: "[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)"
