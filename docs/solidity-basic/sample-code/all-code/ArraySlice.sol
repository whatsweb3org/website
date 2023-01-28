// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract ArraySlice {
    // function arraySliceAsIntermediateValue() public view {
    //     uint[5] memory arr = [uint(0), 1, 2, 3, 4];
    //     uint[3] memory arrSlice = arr[1:4]; // 编译错误
    // }


    function extracFourBytes(string calldata payload) public view {
        string memory leading4Bytes = string(payload[:4]);
        console.log("leading 4 bytes: %s", leading4Bytes);
    }
}