// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract IfElse {
    function getAgeStage(uint8 age) public pure returns(string memory) {
        string memory ageStage;
        if (age < 18) {
            ageStage = "teen";
        } else if (age < 65) {
            ageStage = "adult";
        } else {
            ageStage = "elderly";
        }
        return ageStage;
    }
}