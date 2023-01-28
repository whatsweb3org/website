// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Integer {
    function arithmeticOperator() public view {
        uint8 a = 5;
        uint8 b = 2;
        uint8 res;
        res = a+b;
        console.log("a+b=%s", res);
        res = a-b;
        console.log("a-b=%s", res);
        res = a*b;
        console.log("a*b=%s", res);
        res = a/b;
        console.log("a/b=%s", res);
        res = a%b;
        console.log("a%b=%s", res);
        res = a**b;
        console.log("a**b=%s", res);
        res = a<<b;
        console.log("a<<b=%s", res);
        res = a>>b;
        console.log("a>>b=%s", res);
    }

    function compareOperator() public view {
        uint8 a = 5;
        uint8 b = 2;
        bool res;
        res = a<=b;
        console.log("a<=b : %s", res);
        res = a<b;
        console.log("a<b : %s", res);
        res = a==b;
        console.log("a==b : %s", res);
        res = a!=b;
        console.log("a!=b : %s", res);
        res = a>=b;
        console.log("a>=b : %s", res);
        res = a>b;
        console.log("a>b : %s", res);
    }

    function bitOperator() public view {
        uint8 a = 5;
        uint8 b = 2;
        uint8 res;
        res = a&b;
        console.log("a&b =%s", res);
        res = a|b;
        console.log("a|b =%s", res);
        res = a^b;
        console.log("a^b =%s", res);
        res = ~a;
        console.log("~a  =%s", res);
    }

    function overflow() public view {
        uint8 a = 126;
        a = a+1;
        console.log("a=%s", a);
    }
}