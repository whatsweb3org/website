// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    //必须使用uint(1)和uint(4)显式地将「数组字面值」第一个元素的类型转换成uint
    uint[3][2] memory arr = [[uint(1), 2, 3], [uint(4), 5, 6]];
}