// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    struct Book {
        string title; // 书名
        uint price;   // 价格
        string[] author; // 作者
    }
}