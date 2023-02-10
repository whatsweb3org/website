// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    // 将权限检查抽取出来成为一个修饰器
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    // 添加 onlyOwner 修饰器来对调用者进行限制
    // 只有 owner 才有权限调用这个函数
    function mint() external onlyOwner { 
        // Function code goes here
    }

    // 添加 onlyOwner 修饰器来对调用者进行限制
    // 只有 owner 才有权限调用这个函数
    function changeOwner() external onlyOwner {
        // Function code goes here
    }

    // 添加 onlyOwner 修饰器来对调用者进行限制
    // 只有 owner 才有权限调用这个函数
    function pause() external onlyOwner {
        // Function code goes here
    }
}