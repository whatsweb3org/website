// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Array {
    function defineStaticArray() public pure returns(uint[3] memory) {
        uint[3] memory nft;
        nft[0] = 1000;
        nft[1] = 1001;
        nft[2] = 1002;
        return nft;
    }

    uint[] globalNFT;
    function defineStorageDynamicArray() public {
        uint[] storage nft = globalNFT;
        nft.push(1000);
    }

    function defineMemoryDynamicArray() public pure returns(uint[] memory) {
        uint n = 3;
        uint[] memory nft = new uint[](n);
        nft[0] = 1000;
        nft[1] = 1001;
        nft[2] = 1002;
        return nft;
    }

    function initStaticArray() public view {
        uint[3] memory nft = [uint(1000), 1001, 1002];
        console.log(nft[0], nft[1], nft[2]);
    }

    // uint[] storageArr = [uint(1), 2];

    function assignmentBetweenStaticAndDynamicArray() public view {
        // uint[2] memory staticArr = [uint(1), 2];
        // uint[] memory dynamicArr = staticArr; // 编译错误

        // uint[] memory dynamicArr = new uint[](2);
        // uint[2] memory staticArr = dynamicArr; // 编译错误
    }
}