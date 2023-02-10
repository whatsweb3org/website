// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    struct Book {
        uint isbn;
        string title; // 书名
        uint price;   // 价格
    }
    
    mapping(uint => Book) lib; // 从 ISBN 到 Book 的映射关系
}