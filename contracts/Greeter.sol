//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Greeter {
    string private greeting;
    // A lookup sake public var
    string public joke = "a joke";

    constructor(string memory _greeting) {
        console.log("Deploying a Greeter with greeting:", _greeting);
        greeting = _greeting;
    }

    function logo() public {
      uint256 blockValue = uint256(blockhash(block.number - 1)) / 3;
      // uint256 bh = uint256(blockhash(block.number));
      uint256 bh = block.number;
      // can some find another way of looggin instead of shitty log by varibale name
      console.log("Blockhash :  %s, Division: %s", bh, blockValue);
      // console.log("Blockhash :  %s", );
      // this did not work please make it work
      // console.log("BlockNumber '%s' & Blockhash: '%s', Division: %s", block.number, blockhash(block.number), blockValue);
    }


    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        greeting = _greeting;
    }
}
