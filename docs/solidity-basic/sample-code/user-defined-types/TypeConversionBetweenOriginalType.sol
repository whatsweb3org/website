// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    type Weight is uint128;
    type Price  is uint128;
    
    Weight w = Weight.wrap(100);
    uint128 u = Weight.unwrap(w);
}