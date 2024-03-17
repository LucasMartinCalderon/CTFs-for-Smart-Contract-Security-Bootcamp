// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Intro} from "../src/levels/Intro.sol";
import {TestBaseSetUp} from "./utils/TestBaseSetUp.sol";


abstract contract TestIntro is TestBaseSetUp {
    Intro public intro;

    function setUp() public override {
        super.setUp();
    }

    function checkLevel() internal view override {
        assertTrue(intro.getCleared() == true, "Intro level not cleared");
    }

    function setUpLevels() internal {
        intro = new Intro("password");
    }
}