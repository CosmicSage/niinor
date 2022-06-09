//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Greeter {
    string private greeting;

    constructor(string memory _greeting) {
        console.log("Deploying a Greeter with greeting:", _greeting);
        greeting = _greeting;
    }

    function loggerOfHash() public view returns (uint256) {
      return uint256(blockhash(10807125 - 1));
      // return uint256(blockhash(10795226));
      // return [blockhash(10795226), blockhash(1079522623211), blockhash(107952263214), blockhash(1079522236), blockhash(10795223456), blockhash(107952262134), blockhash(107952253246), blockhash(1079522653462), blockhash(1073123324395226), blockhash(21310795226), blockhash(10795222341266), blockhash(10795226453), blockhash(107952263121)];
    }

    function loggerOfNumbers() public view returns (uint) {
      // return block.number - 1;
      // return block.number - 22; /*Error: call revert exception; VM Exception while processing transaction: reverted with panic code 17 [ See: https://links.ethers.org/v5-errors-CALL_EXCEPTION ] (method="loggerOfNumbers()", data="0x4e487b710000000000000000000000000000000000000000000000000000000000000011", errorArgs=[{"type":"BigNumber","hex":"0x11"}], errorName="Panic", errorSignature="Panic(uint256)", reason=null, code=CALL_EXCEPTION, version=abi/5.6.2)*/
      return block.number;
      // return [blockhash(10795226), blockhash(1079522623211), blockhash(107952263214), blockhash(1079522236), blockhash(10795223456), blockhash(107952262134), blockhash(107952253246), blockhash(1079522653462), blockhash(1073123324395226), blockhash(21310795226), blockhash(10795222341266), blockhash(10795226453), blockhash(107952263121)];
    }

    function loggerOfNumbers1() public view returns (rational_const) {
      // return block.number - 1;
      // return block.number - 22; /*Error: call revert exception; VM Exception while processing transaction: reverted with panic code 17 [ See: https://links.ethers.org/v5-errors-CALL_EXCEPTION ] (method="loggerOfNumbers()", data="0x4e487b710000000000000000000000000000000000000000000000000000000000000011", errorArgs=[{"type":"BigNumber","hex":"0x11"}], errorName="Panic", errorSignature="Panic(uint256)", reason=null, code=CALL_EXCEPTION, version=abi/5.6.2)*/
      return 100 / 3;
      // return [blockhash(10795226), blockhash(1079522623211), blockhash(107952263214), blockhash(1079522236), blockhash(10795223456), blockhash(107952262134), blockhash(107952253246), blockhash(1079522653462), blockhash(1073123324395226), blockhash(21310795226), blockhash(10795222341266), blockhash(10795226453), blockhash(107952263121)];
    }

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        console.log("Changing greeting from '%s' to '%s'", greeting, _greeting);
        greeting = _greeting;
    }
}
