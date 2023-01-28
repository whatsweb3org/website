// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract StringLiteral {
    function stringLiteralDefinition() public view {
        string memory s1 = "This is a string"; // double quote
        string memory s2 = 'This is a string'; // single quote
        console.log("s1=%s", s1);
        console.log("s2=%s", s2);
    }

    function stringLiteralConversion() public view {
        bytes1 b1 = "b";
        bytes2 b2 = "b2";
        bytes3 b3 = "b3";
        bytes32 b32 = "b32";
        string memory str = "string";
        console.log("b1:");
        console.logBytes1(b1);
        console.log("b2:");
        console.logBytes2(b2);
        console.log("b3:");
        console.logBytes3(b3);
        console.log("b32:");
        console.logBytes32(b32);
        console.log("str=%s", str);
    }
}