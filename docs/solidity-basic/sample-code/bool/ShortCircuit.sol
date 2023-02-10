// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint256 public zeroCount = 0;
    
    function isEven(uint256 num) private pure returns(bool) {
        return num%2 == 0;
    }

    // isZero函数有副作用，会改变状态变量zeroCount的值
    function isZero(uint256 num) private returns(bool) {
        if(num == 0) {
            zeroCount += 1; // 函数副作用，会改变zeroCount的值
        }
        return num == 0;
    }
}