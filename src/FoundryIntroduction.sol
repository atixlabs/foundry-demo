// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoundryIntroduction {
    uint256 public shouldAlwaysBeZero = 0;

    uint256 private hiddenValue = 0;

    function doStuff(uint256 data) public {
        if (hiddenValue == 7 && data == 3) {
            shouldAlwaysBeZero = 1;
        }
        hiddenValue = data;
    }
}
