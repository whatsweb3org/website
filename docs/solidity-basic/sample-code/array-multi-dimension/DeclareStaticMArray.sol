// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public {
        uint[3][5] memory arrMem;
        uint[3][5] storage arrStorage;
    }
}