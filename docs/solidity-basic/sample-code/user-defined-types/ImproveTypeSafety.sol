// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    type Weight is uint128;
    type Price  is uint128;
    
    Weight w = Weight.wrap(10);
    Price  p = Price.wrap(5);
    Weight wp = w+p; //编译错误
    Price  pw = p+w; //编译错误
}