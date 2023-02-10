// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public pure {
        bytes memory bstr = new bytes(10);
        string memory message = string(bstr); // 使用string()函数转换
    }
}