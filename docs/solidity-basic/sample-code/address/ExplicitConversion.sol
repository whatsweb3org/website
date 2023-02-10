// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    address addr = 0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990;
    address payable addr_pay = payable(addr); // **显式类型转换**
}