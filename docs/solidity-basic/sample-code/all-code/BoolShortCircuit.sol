// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract BoolShortCircuit {
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

    function andShorCircuit() public returns(bool) {
        // 下面的示例中，isEven(1)为false，所以，有副作用的函数isZero(0)不会执行
        // 因此，不会影响到zeroCount的值
        return isEven(1) && isZero(0);
    }

    function orShorCircuit() public returns(bool) {
        // 下面的示例中，isEven(2)为true，所以，有副作用的函数isZero(0)不会执行
        // 因此，不会影响到zeroCount的值
        return isEven(2) || isZero(0);
    }

    function sideEffect() public {
        // isEven(2)为true, 所以会继续执行副作用函数isZero(0)，于是zeroCount会增加1
        if(isEven(2) && isZero(0)) {
            console.log("success, please check whether the zeroCount variable is increased.");
        }
    }
}