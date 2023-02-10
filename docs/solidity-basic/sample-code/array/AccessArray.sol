// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function accessStaticArray() public pure {
        uint[3] memory nftArr1 = [uint(1000), 1001, 1002];
        nftArr1[0] = 2000;
        nftArr1[1] = 2001;
        nftArr1[2] = 2002;
    }
    
    function accessDynamicArray() public pure {
        uint n = 3;
        uint[] memory nftArr2 = new uint[](n);
        nftArr2[0] = 1000;
        nftArr2[1] = 1001;
        nftArr2[2] = 1002;
    }
}