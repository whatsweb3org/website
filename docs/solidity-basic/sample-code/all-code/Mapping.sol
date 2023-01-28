// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract MappingExample {
    struct AirDrop {
        address to;
        uint amount;
    }

    AirDrop[] airDrop;

    function getAirDropAmount(address addr) public view returns(uint) {
        for(uint i = 0; i < airDrop.length; i++) {
            if(airDrop[i].to == addr) {
                return airDrop[i].amount;
            }
        }
        return 0;
    }


    // mapping(address => uint) myMap;
    // function invalidDeclaration(mapping(address => uint) storage myMap) public {} // 编译错误
    // function invalidDeclaration(mapping(address => uint) storage myMap) external {} // 编译错误
    // function validDeclaration(mapping(address => uint) storage myMap) private {} // 合法
    // function validDeclaration(mapping(address => uint) storage myMap) internal {} // 合法


    struct Book {
        uint isbn;
        string title; // 书名
        uint price;   // 价格
    }

    mapping(uint => Book) lib;
}