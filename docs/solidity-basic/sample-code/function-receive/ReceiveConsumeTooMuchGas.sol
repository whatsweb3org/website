// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    // 用send,transfer函数转账到该合约都会被 revert
    // 原因是消耗的 Gas 超过了 2300
    uint a;
    receive() external payable {
        a += 1;
    }
}