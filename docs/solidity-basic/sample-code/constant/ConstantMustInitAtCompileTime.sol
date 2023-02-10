// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint a = 3;
    uint constant ratio = a; // 不合法，不能用普通变量给 `constant` 赋值

    uint constant b; // 不合法，必须在声明时就赋值
}