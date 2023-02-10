// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        uint[3] memory arr1 = [uint(1000), 1001, 1002];
        uint[] memory arr2 = new uint[](3);
        uint arr1Len = arr1.length; // 3
        uint arr2Len = arr2.length; // 3
    }
}