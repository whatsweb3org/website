// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract UserDefinedValueType {
type Weight is uint128;
type Price  is uint128;

    // function operatorCompileError() public pure {
    //     Weight w1 = Weight.wrap(10);
    //     Weight w2 = Weight.wrap(20);
    //     Weight sum = w1+w2; //编译错误
    // }

    // function typeSafety() public pure {
    //     Weight w = Weight.wrap(10);
    //     Price p = Price.wrap(5);
    //     Weight wp = w+p; //编译错误
    //     Price pw = p+w;  //编译错误
    // }

    // 自定义加法操作
    function add(Weight lhs, Weight rhs) public pure returns(Weight) {
        return Weight.wrap(Weight.unwrap(lhs) + Weight.unwrap(rhs));
    }
}