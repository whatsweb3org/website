// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1; 
    
        do {
            sum += i;
            i++; // 修改循环变量的值
        } while(i <= n); // 检查是否还满足循环条件
        
        return sum;
    }
}