// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1; 
        while(i <= n) { //只改了这一行
            sum += i;
            i++; // 修改循环变量的值
        }
        return sum;
    }
}