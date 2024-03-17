## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

### OVERRIDE

## How to set up repository

```shell
$ git clone https://github.com/LucasMartinCalderon/CTFs-for-Smart-Contract-Security-Bootcamp.git
$ cd CTFs-for-Smart-Contract-Security-Bootcamp/ethernaut_with_foundry
$ git submodule update --init --recursive
$ foundryup
```

## How to check validity of CTF
```shell 
$ forge test --match-contract NAME_OF_LEVEL
```

## Example of test
```solidity
// SPDX-License-Identifier: Unlicense
pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;

import './utils/BaseTest.sol';
import 'src/levels/CHALLENGE.sol';
import 'src/levels/CHALLENGEFactory.sol';

import '@openzeppelin/contracts/math/SafeMath.sol';

contract TestCHALLENGE is BaseTest {
  CoinFlip private level;

  constructor() public {
    // SETUP LEVEL FACTORY
    levelFactory = new CHALLENGEFactory();
  }

  function setUp() public override {
    // Call the BaseTest setUp() function that will also create testsing accounts
    super.setUp();
  }

  function testRunLevel() public {
    runLevel();
  }

  function setupLevel() internal override {
    /** CODE YOUR SETUP HERE */

    levelAddress = payable(this.createLevelInstance(true));
    level = CHALLENGE(levelAddress);
  }

  function exploitLevel() internal override {
    /** CODE YOUR EXPLOIT HERE */

    vm.startPrank(player);

    // SOLVE THE CHALLENGE!

    vm.stopPrank();
  }
}

```

What you need to do is to

1. Replace `CHALLENGE` with the name of the Ethernaut challenge you are solving
2. Modify `setupLevel` if needed
3. Implement the logic to solve the challenge inside `setupLevel` between `startPrank` and `stopPrank`
4. Run the test!

