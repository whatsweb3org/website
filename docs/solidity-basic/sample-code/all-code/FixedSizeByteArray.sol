// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract FixedSizeByteArray {
    function compareOperator() public view {
        bytes1 a = 'a';
        bytes1 b = 'b';
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
        bytes1 a = 'a';
        bytes1 b = 'b';
        bytes1 res;

        console.log("a :");
        console.logBytes1(a);
        console.log("b :");
        console.logBytes1(b);

        res = a&b;
        console.log("a&b :");
        console.logBytes1(res);
        res = a|b;
        console.log("a|b :");
        console.logBytes1(res);
        res = a^b;
        console.log("a^b :");
        console.logBytes1(res);
        res = ~a;
        console.log("~a  :");
        console.logBytes1(res);
    }

    function indexAccess() public view {
        bytes3 s = 'abc';
        console.log("s[1]=");
        console.logBytes1(s[1]);
    }
}