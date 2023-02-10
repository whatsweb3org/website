// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    function sumToN(uint16 n) public pure returns(uint16) {
        uint16 sum = 0;
        uint16 i;
        for(i = 1; i <= n; i++) { // init-statement是 i=1 ; test-statement是 i<=n ; iteration-statement是 i++
            sum += i;
        }
        return sum;
    }
}