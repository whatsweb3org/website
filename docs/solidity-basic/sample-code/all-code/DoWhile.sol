// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract DoWhile {
    function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1;

        do {
            sum += i;
            i++; // 修改循环变量的值
        } while(i <= n);

        return sum;
    }
}

