// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function mint() external view {
        require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }

    function changeOwner() external view {
        require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }

    function pause() external view {
        require(msg.sender == owner, "Only the owner can call this function.");
        // Function code goes here
    }
}