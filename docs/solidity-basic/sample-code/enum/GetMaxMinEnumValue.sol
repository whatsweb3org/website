// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
     enum ActionChoices { 
        GoLeft,     // 底层表示为 0 
        GoRight,    // 底层表示为 1
        GoUp,       // 底层表示为 2
        GoDown      // 底层表示为 3
    }

    function foo() public {
        type(ActionChoices).max; // ActionChoices.GoDown ，也就是3
        type(ActionChoices).min; // ActionChoices.GoLeft ， 也就是0
    }
}