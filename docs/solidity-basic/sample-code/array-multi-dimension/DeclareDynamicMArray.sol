// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        uint[][] memory arrMem; // 行列数任意的动态多维数组
        uint[][3] memory arrMem2; // 行为3，列任意的动态多维数组
        uint[][] storage arrStorage; // 行列数任意的动态多维数组
    }
}