// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo1() public payable {
        require(msg.value % 2 == 0, "Even value revertd.");
    }

    function foo2() public payable {
        if (msg.value % 2 == 0) {
            revert("Even value revertd.");
        }
    }
}