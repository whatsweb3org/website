// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint immutable n;
    
    function f() public {
        n = 5; // 不合法， 不能在函数初始化 immutable 变量 
    }
}