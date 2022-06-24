// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "hardhat/console.sol";

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  function pwn() public {
    string memory mango = "hey I was called Congratualtions";
    console.log("Message from pwn: %s", mango);
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  bytes public lol;
  bytes public c;
  bytes public d;
  address public temp;

  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    string memory kiwi = "Hey fallback called upon";
    console.log("Mesage from fallback: %s", kiwi);
    string memory majesty = string(msg.data);
    // Trying abi.encodeWithSignature(signatureString, arg);
    c = abi.encodeWithSignature("pwn()");
    // trying encodewitselctor
    d = abi.encodeWithSelector(delegate.pwn.selector);
    lol = msg.data;
    temp = address(delegate);
    temp.delegatecall(c);
    // console.log("This is passed to delegate call: %s", majesty);
    // (bool result,) = address(delegate).delegatecall(msg.data);
    // if (result) {
    //   this;
    // }
  }
}
