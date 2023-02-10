// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        uint[] memory arr = new uint[](3);
        arr.push(1); //编译错误，只有 storage 上的动态数组才能调用 push 函数
        arr.pop(); // 编译错误，只有 storage 上的动态数组才能调用 pop 函数
    }
}