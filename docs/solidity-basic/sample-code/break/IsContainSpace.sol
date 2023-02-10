// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ExampleContract {
    function hasSpace(string memory input) public view returns (bool) {
        bool result;
        for (uint i = 0; i < bytes(input).length; i++) {
            if (bytes(input)[i] == " ") { // 检查当前字符是否是空格
                result = true;
                break; // 如果当前字符是空格，跳出循环
            }
        }
        // do something
        console.log("result is: %s", result);
        return result;
    }
}