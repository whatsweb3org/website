// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1; //init-statement被移动到这里了
        for(;;) { 
            if(i > n){ // 这个条件语句实现了test-statement的功能
                break;
            }
            sum += i;
            i++; // iteration-statement的i++被移到这里了
        }
        return sum;
    }
}