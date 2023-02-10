// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint[][] storageArr = [[uint(1), 2], [uint(3), 4]]; // 动态数组只有在storage位置才能用数组字面值初始化
}