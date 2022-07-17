// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CollateralBackedToken is ERC20 {
    ERC20 public collateral;
    uint8 public price = 1;

    constructor(address _tokenAddreess) ERC20("CollateralBackedToken", "CBT") {
        collateral = ERC20(_tokenAddreess);
    }

    function deposit(uint8 collateralAmount) external {
        collateral.transferFrom(msg.sender, address(this), collateralAmount);
        _mint(msg.sender, collateralAmount * price);
    }

    function withdraw(uint8 amount) external {
        require(balanceOf(msg.sender) >= amount, "not enough balance");
        _burn(msg.sender, amount);
        collateral.transfer(msg.sender, amount / price);
    }
}
