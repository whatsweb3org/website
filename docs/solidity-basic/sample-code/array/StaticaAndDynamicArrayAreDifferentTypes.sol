// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo1() public {
        uint[2] memory staticArr = [uint(1), 2];
        uint[] memory dynamicArr = staticArr; // 编译错误，静态数组和动态数组是不同的类型
    }
    
    function foo2() public {
        uint[] memory dynamicArr = new uint[](2); 
        uint[2] memory staticArr = dynamicArr; // 编译错误，静态数组和动态数组是不同的类型
    }
}