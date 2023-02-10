// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint[] arr; //定义在storage位置的数组
    
    function pushPop() public {
        // 刚开始没有任何元素
        arr.push(); // 数组有一个元素：[0]
        arr.push(1000); //数组有两个元素：[0, 1000]
        arr.pop(); // 数组剩下一个元素： [0]
    }
}