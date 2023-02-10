// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint count;
    function GetCount() public view returns(uint) {
        return count;
    }
}