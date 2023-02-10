// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    struct Book {
        string title; // 书名
        uint price;   // 价格
    }

    Book book1 = Book(
        {
            title: "my book title",
            price: 25
        }
    );
}