// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    string str = "hello world";
    uint len = bytes(str).length; // 合法
    bytes1 b = bytes(str)[0]; // 合法
}