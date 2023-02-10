// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract RationalLiteral {
    function rational() public view {
        uint256 d1 = 123;
        console.log("d1=%s", d1);
        uint256 d2 = .1+1.9;
        console.log("d2=%s", d2);
        uint256 h = 0xff;
        console.log("h=%s", h);
        int256 s1 = 2e10;
        console.log("s1:");
        console.logInt(s1);
        int256 s2 = -2e10;
        console.log("s2:");
        console.logInt(s2);
    }

    function literalPrecision() public view {
        uint256 p = (2**800 + 1) - 2**800;
        console.log("p=%s", p);

        // compile error
        // uint128 a = 1;
        // uint128 b = 2.5 + a + 0.5;

        // compile error
        // uint128 a = 1;
        // uint128 b = a + 2.5 + 0.5 ;

        uint128 a = 1;
        uint128 b = 2.5 + 0.5 + a;
        console.log("b=%s", b);
    }
}