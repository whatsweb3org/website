// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";


contract DynamicSizeByteArray {
    function bytesToString() public pure returns(string memory) {
        bytes memory bstr = new bytes(10);
        return string(bstr);
    }

    function stringToBytes() public pure returns(bytes memory) {
        string memory message = "hello world";
        return bytes(message);
    }

    function stringNoIndexAccessAndNoLengthMember() public view {
        string memory str = "hello world";
        // uint len = str.length; // 不合法，不能获取长度
        // str[0]; // 不合法，不能进行下标访问
        uint len = bytes(str).length;
        bytes1 b = bytes(str)[0];
        console.log(len);
        console.logBytes1(b);
    }
}