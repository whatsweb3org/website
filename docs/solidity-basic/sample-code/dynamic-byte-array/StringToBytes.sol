// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public pure {
        string memory message = "hello world";
        bytes memory bstr = bytes(message); //使用bytes()函数转换
    }
}