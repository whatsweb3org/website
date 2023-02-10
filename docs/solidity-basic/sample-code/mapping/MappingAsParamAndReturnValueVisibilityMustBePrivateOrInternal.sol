// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    // 编译错误，映射类型作为入参和返回值时，函数可见性必须是 private 或 internal
    function invalidDeclaration(mapping(address => uint) storage myMap) public {} 
    
    // 编译错误，映射类型作为入参和返回值时，函数可见性必须是 private 或 internal
    function invalidDeclaration(mapping(address => uint) storage myMap) external {}
    
    // 合法
    function validDeclaration(mapping(address => uint) storage myMap) private {} 
    
    // 合法
    function validDeclaration(mapping(address => uint) storage myMap) internal {}
}