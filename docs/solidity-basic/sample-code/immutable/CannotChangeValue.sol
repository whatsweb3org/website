// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint immutable n = 0; // 初始化为0
    
    function f() public {
        n = 5; // 不合法，immutable 变量不能更改
    }
}