// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint128 a = 1;
    uint128 b = a + 2.5 + 0.5 ; //编译报错
}