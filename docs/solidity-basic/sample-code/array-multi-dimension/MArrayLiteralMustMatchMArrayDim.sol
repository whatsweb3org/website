// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        uint[3][2] memory arr = [[uint(1), 2, 3], [uint(4)]]; //编译错误
    }
}