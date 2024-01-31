// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {FoundryIntroduction} from "../../src/FoundryIntroduction.sol";
import {Test} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

// TO RUN THESE TESTS GO TO foundry.toml AND REMOVE THE no_match_test LINE FROM THE FILE

contract FoundryIntroductionTest is StdInvariant, Test {
    FoundryIntroduction exampleContract;

    function setUp() public {
        exampleContract = new FoundryIntroduction();
        targetContract(address(exampleContract));
    }

    function testSolutionIsAlwaysZeroUnit() public {
        // Example implementation of Unit Test
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    // This test will fail because when `randomData` equals 2, the invariant will be broken.
    // Fuzz tests pass if and only if all runs pass
    function testSolutionIsAlwaysZeroFuzz(uint256 randomData) public {
        // Example implementation of Fuzz Test
        exampleContract.doStuff(randomData);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    // This test will fail because when data is 7, it sets the `hiddenValue` to to 7,
    // which in the next doStuff() call will break the invariant.
    function testSolutionIsAlwaysZeroUnitManyCalls() public {
        // Example implementation of Unit Test for Second Condition.
        uint256 data = 7;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);

        data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    // This test will fail because the invariant test runs random functions with random inputs.
    // In this case, it will run the only function in the contract with values that will break the invariant.
    function invariant_testSolutionAlwaysReturnsZero() public view {
        // Example implementation of an Invariant Test
        // Notice the function's name prefix `invariant_`
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }
}
