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

    function darkSubmit(address payable _instance, uint eth, string memory code) public {
      // tEST .CALL consequnce
      // try calling greeter's lemmeknow with .call
      // (bool result,) = address(_instance).call{value:0}(abi.encodeWithSignature("lemmeknow()"));
      // console.log("dark result : %s", result);
      // Now try receive on King
      (bool result,) = address(_instance).call{value:eth, gas:100000}(abi.encodeWithSignature(code));
      console.log("dark result : %s", result);

    }

    function vcard(address payable _instance, address _player, uint eth, string memory code) public returns (bool) {
        _player;
        King instance = King(_instance);
        (bool result,) = address(instance).call{value:eth, gas:1000000}("");
        console.log("card result : %s", result);
        (bool result1,) = _instance.call{value:eth, gas:1000000}("");
        console.log("card result1 : %s", result1);

        !result;
        return instance._king() != address(this);
  }
  
  receive() external payable {

  }

  // recieve receive receive
}