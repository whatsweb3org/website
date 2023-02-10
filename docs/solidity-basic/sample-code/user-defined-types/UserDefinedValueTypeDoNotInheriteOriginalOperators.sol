// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    type Weight is uint128;
    type Price  is uint128;
    
    Weight w1 = Weight.wrap(10);
    Weight w2 = Weight.wrap(20);
    Weight sum = w1+w2; // 编译器报错
}