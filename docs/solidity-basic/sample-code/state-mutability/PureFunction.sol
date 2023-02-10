// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function add(uint lhs, uint rhs) public pure returns(uint) {
        return lhs + rhs;
    }
}