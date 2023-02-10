// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    error CustomError(string arg1, string arg2);

    function foo() public {
        // 使用方式一
        revert CustomError("hello", "world");
        
        // 使用方式二
        revert("My Error string");
    }
}