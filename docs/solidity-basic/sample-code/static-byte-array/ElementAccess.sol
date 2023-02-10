// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract ExampleContract {
   function foo() public {
        bytes3 s = 'abc';
        bytes1 ch = s[1]; // ch的值为0x62，也就是'b'的ascii值
        console.log("ch=");
        console.logBytes1(ch);
   }
}