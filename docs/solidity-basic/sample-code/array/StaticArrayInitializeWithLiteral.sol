// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        //必须使用uint(1000)显式地将「数组字面值」第一个元素的类型转换成uint
        uint[3] memory nftArr = [uint(1000), 1001, 1002];
    }
}