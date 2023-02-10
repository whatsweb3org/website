// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function foo() public pure {
        uint[3] memory nftMem;
        uint[3] storage nftStorage;
    }
}