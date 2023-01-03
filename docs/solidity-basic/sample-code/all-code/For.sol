// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract ForLoop {
    function sum1(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i;
        for(i = 1; i <= n; i++) {
            sum += i;
        }
        return sum;
    }

    function sum2(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        for(uint16 i = 1; i <= n; i++) { //你可以在init_statement里面定义并初始化变量i
            sum += i;
        }
        return sum;
    }

    function sum3(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1; //init_statement1被移动到这里了
        for(; i <= n; i++) { //你可以将init_statement移到for循环之前
            sum += i;
        }
        return sum;
    }

    function sum4(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1; //init_statement被移动到这里了
        for(; i <= n;) { //你可以不写init_statement， 也不写test_statement
            sum += i;
            i++; // iteration_statement的i++被移到这里了
        }
        return sum;
    }

    function sum5(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i = 1; //init_statement被移动到这里了
        for(;;) { //你可以init_statement, test_statement，iteration_statement都不写，全部逻辑实现在代码块里面
            if(i > n){ // 这个条件语句实现了test_statement的功能
                break;
            }
            sum += i;
            i++; // iteration_statement的i++被移到这里了
        }
        return sum;
    }
}