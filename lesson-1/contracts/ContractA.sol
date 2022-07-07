// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IContractB is IERC20 {
    function deposit(uint256 amount) external;

    function withdraw(uint256 amount) external;
}

contract ContractA {
    IERC20 public token;
    IContractB public contractB;

    constructor(address _token, address _contractB) {
        token = IERC20(_token);
        contractB = IContractB(_contractB);
    }

    function deposit(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        token.approve(address(contractB), amount);
        contractB.deposit(amount);
    }

    function withdraw(uint256 amount) external {
        contractB.withdraw(amount);
        token.transfer(msg.sender, amount);
    }
}
