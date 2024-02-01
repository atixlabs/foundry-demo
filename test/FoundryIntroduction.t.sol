// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {FoundryIntroduction} from "../src/FoundryIntroduction.sol";
import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract FoundryIntroductionTest is StdInvariant, Test {
    FoundryIntroduction exampleContract;

    function setUp() public {
        exampleContract = new FoundryIntroduction();
        targetContract(address(exampleContract));
    }

    // Help: use `assert([condition])` to test a condition
    function testIsAlwaysZeroUnit() public {
        // Example implementation of Unit Test
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    // Implement a fuzz test that checks if `shouldAlwaysBeZero` variable is 0
    // after calling the doStuff() function.
    // Hint: Foundry interprets tests that receive params as fuzz tests.
    function testIsAlwaysZeroFuzz() public {
        // Implementation
    }

    function testIsAlwaysZeroUnitManyCalls() public {
        // How could we test the second condition of the doStuff() function?
    }

    // Fix the next function to make it an invariant test.
    // What happens when you turn it into an invariant test?
    function testAlwaysReturnsZero() public {
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }
}
