// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract DataType {
    function referenceType() public view {
        bytes memory bts1 = "btc";
        bytes memory bts2 = bts1;

        console.log("bts1: %s", string(bts1));
        console.log("bts2: %s", string(bts2));

        bts2[0] = 'e'; //这里只改了bts2[0]的值，但是你会发现bts1[0]的值也会跟着变动

        console.log("bts1: %s", string(bts1));
        console.log("bts2: %s", string(bts2));
    }
}