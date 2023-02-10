// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    address payable addr_pay = payable(0x8306300ffd616049FD7e4b0354a64Da835c1A81C);
    address addr = addr_pay; // **隐式类型转换**
}