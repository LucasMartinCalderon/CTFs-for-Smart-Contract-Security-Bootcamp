// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0;
pragma experimental ABIEncoderV2;

import "forge-std/Test.sol"; 
import "./TestUtilities.sol";
import "../../src/Ethernaut.sol";

abstract contract TestBaseSetUp is Test {
    Ethernaut public ethernaut;
    TestUtilities public utils;

    function setUp() public {
        ethernaut = new Ethernaut();
        utils = new TestUtilities();
    }
}

