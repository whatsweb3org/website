// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        // 编译报错，类型不匹配
        uint[3] memory nftArr = [1000, 1001, 1002];
    }
}