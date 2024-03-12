# Secure Treasure Hunt Challenge

## Overview

Embark on a secure digital treasure hunt where your wit and blockchain prowess can earn you Ether! This challenge involves understanding and implementing a commit-reveal scheme to secure submissions against front-running attacks.

## Objective

Learn to prevent front-running through a practical exercise: a treasure hunt that requires players to commit their guesses in a way that keeps them hidden until the reveal phase. 

## How It Works

1. **Commit Phase**: Participants submit a hash of their guess and a secret phrase, committing their guess to the blockchain.
2. **Reveal Phase**: After all commits are made, participants reveal their guesses. The contract verifies the information, and the first correct guess wins the prize.

## Getting Started

### Deploy the Contract

- Open [Remix IDE](https://remix.ethereum.org).
- Paste the `SecureTreasureHunt` contract code and compile it.
- Deploy the contract on a test network, funding it with some ETH for the prize.

### Participate in the Hunt

1. **Commit Your Guess**: Call `commitSolution` with the hash of your guess and a secret.
2. **Wait for the Commit Phase to End**: The commit phase duration is set by the contract owner.
3. **Reveal Your Guess**: Call `revealSolution` with your original guess and secret.

## Learn and Reflect

- Explore how the commit-reveal pattern prevents malicious actors from stealing your guess.
- Discuss the implications of this pattern for real-world applications, such as auctions or voting systems.

## Conclusion

By participating in the Secure Treasure Hunt, you gain hands-on experience with smart contract security concepts, learning how to safeguard against common vulnerabilities in a fun and engaging way.

## Connect with Us

Stay updated on new challenges and share your solutions with us on Twitter: [![Twitter Follow](https://img.shields.io/twitter/follow/lmc_security?style=social)](https://twitter.com/lmc_security)
