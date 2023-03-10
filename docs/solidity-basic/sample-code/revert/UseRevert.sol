// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    error CustomError(string arg1, string arg2);

    // 使用方式一
    function foo1() public pure {
        revert CustomError("hello", "world");
    }

    function foo2() public pure {
        // 使用方式二
        revert("My Error string");
    }
}