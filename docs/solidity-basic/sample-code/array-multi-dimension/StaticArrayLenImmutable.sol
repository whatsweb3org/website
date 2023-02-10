// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint[][3] storageArr;
    function invalidPush() public {
        uint k = 2;
        storageArr.push(new uint[](k)); // 编译错误
    }
}