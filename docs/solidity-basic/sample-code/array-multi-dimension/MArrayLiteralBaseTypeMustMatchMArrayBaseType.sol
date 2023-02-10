// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        // 编译报错，类型不匹配
        uint[3][2] memory arr = [[1, 2, 3], [uint(4), 5, 6]];
    }
}