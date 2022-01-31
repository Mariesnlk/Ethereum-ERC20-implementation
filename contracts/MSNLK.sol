// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MSNLK is ERC20 {
    //using SafeMath for uint256;

    event Received(address sender, uint256 tokens);

    constructor(uint256 initialSupply) ERC20("Synelnyk", "MSNLK") {
        _mint(msg.sender, initialSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return 16;
    }

    // increase balance ** 10, who call the contract with any transaction
    receive() external payable {
        require(msg.value != 0, "Error: not received ether");
        //uint256 amount = msg.value.mul(10);
        uint256 amount = msg.value**10;
        _mint(msg.sender, amount);
        
        emit Received(msg.sender, msg.value);
    }
}
