// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract FunctionExample {
    function f1() public {}
    function f2() public pure {}
    function f3() public view {}
    function f4(uint a) public pure {}
    function f5(uint a) public pure returns(uint) {}
    function f6(uint a, uint b, uint c) public pure returns(uint, uint, uint) {}
    //function f7(uint a) external onlyOwner {} // onlyOwner 修饰器需要事先定义
}