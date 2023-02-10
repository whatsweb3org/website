// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    string str = "hello world";
    uint len = str.length; // 不合法，不能获取长度
    bytes1 b = str[0]; // 不合法，不能进行下标访问
}