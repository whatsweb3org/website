// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function  getAgeStage(uint age) public pure returns (string memory) {
        if (age < 18) {
            return "teen";
        }
        return "unknown";
    }
}