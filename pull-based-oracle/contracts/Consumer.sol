// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import "./IOracle.sol";

contract Consumer {
    IOracle public oracle;

    constructor(address _oracleAddress) {
        oracle = IOracle(_oracleAddress);
    }

    function foo() external view {
        bytes32 key = keccak256(abi.encodePacked("BTC/USD"));
        (bool result, uint256 date, uint256 data) = oracle.getData(key);
        require(result == true, "could not get data");
        require(date >= block.timestamp + 2 minutes, "data too old to consume");
        // do something with price
    }
}
