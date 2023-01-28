// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract StructExample {
    struct Book {
        string title; // 书名
        uint price;   // 价格
    }

    function initStruct() public pure {
        Book memory book1 = Book(
        {
        title: "my book title",
        price: 25
        }
        );

        Book memory book2 = Book("my book title", 25);
    }

    function accessMember() public view {
        Book memory book3;
        book3.title = "my book title"; // 给结构体成员赋值
        book3.price = 25; // 给结构体成员赋值

        console.log("title: %s", book3.title); // 获取结构体成员值
    }

    Book[] public lib;
    function addNewBook(Book memory book) public {
        lib.push(book);
    }

}