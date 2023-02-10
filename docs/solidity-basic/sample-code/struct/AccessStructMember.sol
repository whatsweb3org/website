// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ExampleContract {
    function foo() public {
        Book memory book3;
        book3.title = "my book title"; // 给结构体成员赋值
        book3.price = 25; // 给结构体成员赋值
        
        console.log("title: %s", book3.title); // 获取结构体成员值
    }
}