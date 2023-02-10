// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function splitEther(address payable addr1, address payable addr2) public payable {
        if (msg.value % 2 == 0) { // 检查传入的ether是不是偶数
            revert("Even value revertd.");
        } 
        addr1.transfer(msg.value / 2);
        addr2.transfer(msg.value / 2);
    }
}