// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        uint[3] memory nftArr = [uint(1000), 1001];  //编译错误，长度不匹配
    }
}