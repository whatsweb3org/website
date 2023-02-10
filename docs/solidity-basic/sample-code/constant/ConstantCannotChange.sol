// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint constant ratio = 3;
    
    constructor() {
        ratio = 0; // 不合法
    }
    
    function f() public {
        ratio = 0; // 不合法
    }
}