// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract AddrConversion {
    function implicitConvert() public view {
        address payable addr_pay = payable(0x8306300ffd616049FD7e4b0354a64Da835c1A81C);
        address addr = addr_pay; // implicit conversion
        console.log("addr:%s", addr);
    }

    function explicitConvert() public view {
        address addr = 0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990;
        address payable addr_pay = payable(addr); // explicit conversion
        console.log("addr_pay:%s", addr_pay);
    }
}