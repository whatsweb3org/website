// SPDX-License-Identifier: GPL-3.0
    
    pragma solidity ^0.8.17;

	import "hardhat/console.sol";
    
    contract ExampleContract {
    	function overflow() public view {
    	    uint8 a = 255;
    	    a = a+1; //整型溢出，整个transaction revert
    	    console.log("a=%s", a);
    	}
    }