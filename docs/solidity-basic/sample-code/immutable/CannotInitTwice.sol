// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint immutable n = 0;
    
    constructor () {
        n = 5; // 不合法，已经在声明时初始化过了
    }
}