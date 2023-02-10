// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    type Weight is uint128;
    type Price  is uint128;

    function add(Weight lhs, Weight rhs) public pure returns(Weight) {
      return Weight.wrap(Weight.unwrap(lhs) + Weight.unwrap(rhs));
    }
}