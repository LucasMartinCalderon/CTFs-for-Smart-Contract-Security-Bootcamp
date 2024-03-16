// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Intro} from "../src/Intro.sol";

contract IntroTest is Test {
    Intro public intro;

    function setUp() public {
        intro = new Intro("password");
    }

    function exploitCTF() internal override {
        
    }
}