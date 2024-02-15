// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {FoundryIntroduction} from "../src/FoundryIntroduction.sol";
import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import 'forge-std/console.sol';

contract FoundryIntroductionTest is StdInvariant, Test {
    FoundryIntroduction exampleContract;
    address account = vm.addr(1);

    function setUp() public {
        exampleContract = new FoundryIntroduction();
        targetContract(address(exampleContract));
    }

    // Fix the next function to make it an invariant test.
    // What happens when you turn it into an invariant test?
    function invariant_testAlwaysReturnsZero() public {
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function test_WhoIsTheSender() public {
        exampleContract.doStuff(7);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        console.log(msg.sender);
    }

    function test_WhoIsTheSenderNow() public {
        vm.startPrank(account, account);
        exampleContract.doStuff(7);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        console.log(msg.sender);
    }

    function test_WhatTxOrigin() public {
        exampleContract.doStuff(3);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        console.log(tx.origin);
    }

    function test_SendersBalance() public {
        vm.startPrank(account);
        exampleContract.doStuff(73);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        vm.deal(account, msg.sender.balance - 504030201);
        console.log(account.balance);
    }

    function test_BlockNumber() public {
        exampleContract.doStuff(73);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        console.log(block.number);
    }

    function test_ChainId() public {
        exampleContract.doStuff(73);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        console.log(block.chainid);
    }

    function test_Coinbase() public {
        exampleContract.doStuff(73);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        vm.coinbase(vm.addr(2));
        console.log(block.coinbase);
    }

    function test_Timestamp() public {
        vm.startPrank(account);
        exampleContract.doStuff(73);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
        vm.warp(block.timestamp + 2023);
        console.log(block.timestamp);
    }
}
