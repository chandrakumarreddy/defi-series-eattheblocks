// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20 {
    constructor() ERC20("Wrapped Etherreum", "WETH") {}

    function deposit() external payable {
        _mint(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "not enough balance");
        _burn(msg.sender, amount);
        msg.sender.call{value: amount};
    }
}
