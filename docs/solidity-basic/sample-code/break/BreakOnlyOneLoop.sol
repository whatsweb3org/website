// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ExampleContract {
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