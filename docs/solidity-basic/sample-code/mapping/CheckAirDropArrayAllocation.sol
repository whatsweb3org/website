// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract ExampleContract {
    struct AirDrop {
        address to;
        uint amount;
    }

    AirDrop[] airDrop;
    function getAirDropAmount(address addr) public view returns(uint) {
        for(uint i = 0; i < airDrop.length; i++) {
            if(airDrop[i].to == addr) {
                return airDrop[i].amount;
            }
        }
        return 0;
    }
}