// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public pure {
        uint[3][2] memory arr = [[uint(1), 2, 3], [uint(4), 5, 6]];
        arr[0][0] = 1;
        arr[1][1] = 2;
    }
}