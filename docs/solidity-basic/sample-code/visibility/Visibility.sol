// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

// 主合约可以访问自己内部可见性为 private, internal, public 的变量和函数
contract MainContract {
    uint varPrivate;
    uint varInternal;
    uint varPublic;

    function funcPrivate() private {}
    function funcInternal() internal {}
    function funcExternal() external {}
    function funcPublic() public {}
}


contract ChildContract is MainContract {
    function funcChild() private {
        funcInternal(); // 子合约可以访问主合约中可见性为internal，public的函数
        funcPublic(); // 子合约可以访问主合约中可见性为internal，public的函数
    }
}


contract ThirdPartyContract {
      function funcThirdParty(address mainContractAddress) private {
            MainContract(mainContractAddress).funcExternal(); // 第三方合约可以访问主合约中可见性为external，public的函数
            MainContract(mainContractAddress).funcPublic(); // 第三方合约可以访问主合约中可见性为external，public的函数
      }
}
