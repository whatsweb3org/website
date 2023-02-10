// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        uint size = 2;
        uint[size][size] memory array; // 非法，size 是变量，不能用来指定数组大小
    }
}