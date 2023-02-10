// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ExampleContract {
    function printOddNumbers() public {
        for (uint i = 1; i <= 10; i++) {
            if (i%2 == 0) { // 如果是偶数，跳过本次循环
                continue;
            }
            console.log(i); // 如果是奇数，就打印输出
        }
    }
}