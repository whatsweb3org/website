// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    struct Book {
        string title; // 书名
        uint price;   // 价格
    }
    
    Book[] public lib; // Book数组，状态变量
    function addNewBook(Book memory book) public {
        lib.push(book);
    }
}