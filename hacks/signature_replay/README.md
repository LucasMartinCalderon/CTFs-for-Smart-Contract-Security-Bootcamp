# Mystic Gallery CTF Challenge

## Introduction

Welcome to the Mystic Gallery, an exclusive platform for digital artists to showcase their artworks. Unfortunately, a vulnerability in the gallery's approval process allows attackers to replay approval signatures, leading to unauthorized exhibitions. Your mission is to understand this vulnerability and demonstrate how it can be exploited.

## Objective

Identify and exploit the signature replay vulnerability in the Mystic Gallery smart contract. Your goal is to submit an unauthorized artwork by replaying a signature.

## Learning Outcomes

- Understand the concept of signature replay attacks in smart contracts.
- Learn about the importance of using nonces to prevent replay attacks.
- Develop skills in smart contract exploitation and security best practices.

## Setup and Execution

1. **Deploy the Vulnerable Contract**: Use Remix IDE to deploy `MysticGallery.sol` on a test network like Rinkeby or Goerli.
2. **Attempt an Artwork Submission**: Try to submit an artwork using the curator's signature.
3. **Deploy the Hacker's Solution**: Deploy `GalleryHack.sol` and use it to exploit the signature replay vulnerability.
4. **Reflect on Preventative Measures**: Consider how implementing a nonce could prevent this type of attack.

## Connect

Join the discussion and share your solutions on Twitter: "[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/cloudposse.svg?style=social&label=Follow%20%40lmc_security)](https://twitter.com/lmc_security)"

## Conclusion

This challenge highlights the importance of secure smart contract development practices. By exploring the signature replay vulnerability, you gain hands-on experience in both exploiting and mitigating such issues.
