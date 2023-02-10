// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function get_balance() public view returns(uint256) {
         return address(this).balance; //获取地址账户余额
    }
    
    function get_code() public view returns(bytes memory) {
        return address(this).code; //获取合约代码
    }
    
    function get_codehash() public view returns(bytes32) {
        return address(this).codehash; //获取合约代码的hash值
    }
}