// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        for(uint16 i = 1; i <= n; i++) { //你可以在init-statement里面定义并初始化变量i
            sum += i;
        }
        return sum;
    }
}