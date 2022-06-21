// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

// Writing an interface so function calls get executed in the same block for right predictions
interface ICoinFlip {
// Just one function
function flip(bool _guess) external returns (bool);
function consecutiveWins() external returns(uint256);
}

contract CallFlip {
    address public _CoinFlipLocation = 0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9;
    uint256 lastHash;
    uint public i = 0;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function flip() payable  external {
        // while(i < 10) {
        //     console.log("Iterator is %s", i);
        //     i++;

        // }
        while(i < 10) {
            // Trying interface Call
            // Simple lookup/read on remote/external contract
            uint256 wins = ICoinFlip(_CoinFlipLocation).consecutiveWins();
            console.log("Wins is %s", wins);
            i++;
        }
        

        // while(i < 10) {
        //     uint256 blockvalue = uint256(blockhash(block.number - 1));
        //     if (lastHash != blockvalue) {
        //         lastHash = blockvalue;
        //         uint256 flipo = blockvalue / FACTOR;
        //         bool prediction = flipo == 1 ? true : false;
        //         ICoinFlip(_CoinFlipLocation).flip(prediction);
        //         // if prediction goes wrong reset counter
        //         if (ICoinFlip(_CoinFlipLocation).consecutiveWins() == 0) {
        //             i = 0;
        //         }
        //         else {
        //             i++;
        //         }
        //     }
        // }

        // calling the FLIP by the interface
        // for (uint256 i = 0; i < 10; i++) {
        //     blockhash(blockNumber);
            
        // }
        
    }
}