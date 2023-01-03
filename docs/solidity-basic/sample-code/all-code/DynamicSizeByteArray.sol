// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

contract DynamicSizeByteArray {
    function bytesToString() public pure returns(string memory) {
        bytes memory bstr = new bytes(10);
        return string(bstr);
    }

    function stringToBytes() public pure returns(bytes memory) {
        string memory message = "hello world";
        return bytes(message);
    }
}