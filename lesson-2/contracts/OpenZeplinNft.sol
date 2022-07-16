// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract OpenZeplin is ERC721 {
    constructor() ERC721("TOKEN NAME", "TOKEN TICKER") {}
}

contract OpenZeplin1 is ERC721 {
    constructor() ERC721("TOKEN NAME", "TOKEN TICKER") {
        _mint(msg.sender, 0);
    }
}

contract OpenZeplin2 is ERC721 {
    address public owner;

    constructor() ERC721("TOKEN NAME", "TOKEN TICKER") {}

    function mint(uint8 _tokenId) external {
        require(msg.sender == owner, "not owner");
        _mint(owner, _tokenId);
    }
}

contract OpenZeplin3 is ERC721 {
    constructor() ERC721("TOKEN NAME", "TOKEN TICKER") {}

    function mint(uint8 _tokenId) external {
        _mint(msg.sender, _tokenId);
    }
}
