// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract BreakExample {

    function hasSpace(string memory input) public view returns (bool) {
        bool result;
        for (uint i = 0; i < bytes(input).length; i++) {
            if (bytes(input)[i] == " ") {
                result = true;
                break; // 跳出循环
            }
        }
        // do something
        console.log("result is: %s", result);
        return result;
    }

    function breakOnlyOneLoop() public view {
        for(uint i = 0; i < 10; i++) {
            for(uint j = 0; j < 10; j++) {
                break;
                console.log("this statement would never execute");
            }
            console.log("continue excuting this statement after the inner loop break");
        }
    }
}