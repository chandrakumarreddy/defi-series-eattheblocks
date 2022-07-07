// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenOpenZeppelin1 is ERC20 {
    constructor() ERC20("TOKEN", "TEST TOKEN") {}
}

contract TokenOpenZeppelin2 is ERC20 {
    constructor() ERC20("TOKEN", "TEST TOKEN") {
        _mint(msg.sender, 100000);
    }
}

contract TokenOpenZeppelin3 is ERC20 {
    address public owner;

    constructor() ERC20("TOKEN", "TEST TOKEN") {
        owner = msg.sender;
    }

    function mint() external {
        require(msg.sender == owner, "not owner");
        _mint(owner, 100000);
    }
}

contract TokenOpenZeppelin4 is ERC20 {
    address public owner;

    constructor() ERC20("TOKEN", "TEST TOKEN") {
        owner = msg.sender;
    }

    function mint(address to) external {
        require(msg.sender == owner, "not owner");
        _mint(to, 100000);
    }
}

contract TokenOpenZeppelin5 is ERC20 {
    constructor() ERC20("TOKEN", "TEST TOKEN") {
        _mint(msg.sender, 100000);
    }

    function faucet(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
