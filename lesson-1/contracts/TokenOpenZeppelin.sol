// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenOpenZeplin is ERC20 {
    constructor() ERC20("TOKEN", "TOKEN TICKER") {}
}

contract TokenOpenZeplin1 is ERC20 {
    constructor() ERC20("TOKEN", "TOKEN TICKER") {
        _mint(msg.sender, 10000);
    }
}

contract TokenOpenZeplin2 is ERC20 {
    address private owner;

    constructor() ERC20("TOKEN", "TOKEN TICKER") {
        owner = msg.sender;
    }

    function mint() external {
        require(msg.sender == owner, "not owner");
        _mint(owner, 10000);
    }
}

contract TokenOpenZeplin3 is ERC20 {
    constructor() ERC20("TOKEN", "TOKEN TICKER") {}

    function mint() external {
        _mint(msg.sender, 10000);
    }
}
