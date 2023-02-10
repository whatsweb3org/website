// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint[5] storageArr = [uint(0), 1, 2, 3, 4];
    function foo() public {
        uint[3] storage s1 = storageArr[1:4]; // 编译错误，不能对 storage 位置的数组进行切片

        uint[5] memory memArr = [uint(0), 1, 2, 3, 4];
        uint[3] memory s2 = memArr[1:4]; // 编译错误，不能对 memory 位置的数组进行切片
    }
}