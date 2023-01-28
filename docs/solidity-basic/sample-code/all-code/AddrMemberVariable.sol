// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract AddrMemberVariable {
    constructor() payable {}

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function getCode() public view returns(bytes memory) {
        return address(this).code;
    }

    function getCodehash() public view returns(bytes32) {
        return address(this).codehash;
    }
}