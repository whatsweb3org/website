// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    // operator: !
    function not(bool b) public pure returns(bool) {
        return !b;
    }

    // operator: &&
    function and(bool b1, bool b2) public pure returns(bool) {
        return b1 && b2;
    }

    // operator: ||
    function or(bool b1, bool b2) public pure returns(bool) {
        return b1 || b2;
    }

    // operator: ==
    function equal(bool b1, bool b2) public pure returns(bool) {
        return b1 == b2;
    }

    // operator: !=
    function notEqual(bool b1, bool b2) public pure returns(bool) {
        return b1 != b2;
    }
}