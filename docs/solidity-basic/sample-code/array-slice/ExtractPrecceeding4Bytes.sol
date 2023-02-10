// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ExampleContract {
    // 如果输入"abcdef"，将会输出"abcd"
    function extracFourBytes(string calldata payload) public view {
        string memory leading4Bytes = string(payload[:4]);
        console.log("leading 4 bytes: %s", leading4Bytes);
    }
}