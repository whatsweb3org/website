// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    uint[][3] storageArr;
    function validPush() public {
        storageArr[0].push(999); // 合法
    }
}