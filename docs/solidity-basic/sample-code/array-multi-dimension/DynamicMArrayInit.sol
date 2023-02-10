// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint[][]  storageArr;
    function initArray() public {
        uint n = 2;
        uint m = 3;
        for(uint i = 0; i < n; i++){
            storageArr.push(new uint[](m));
        }
    }
}