// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    struct Book {
        string title; // 书名
        uint price;   // 价格
    }

    Book book2 = Book("my book title", 25);
}