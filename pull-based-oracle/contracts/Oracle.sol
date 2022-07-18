// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Oracle {
    struct Data {
        uint256 date;
        uint256 payload;
    }
    address public owner;
    mapping(address => bool) public reporters;
    mapping(bytes32 => Data) public data;

    constructor(address _owner) {
        owner = _owner;
    }

    function updateReporter(address reporter, bool isReporter) external {
        require(msg.sender == owner, "not owner");
        reporters[reporter] = isReporter;
    }

    function updateData(bytes32 key, uint256 value) external {
        require(reporters[msg.sender] == true, "not reporter");
        data[key] = Data(block.timestamp, value);
    }

    function getData(bytes32 key)
        external
        view
        returns (
            bool result,
            uint256 date,
            uint256 payload
        )
    {
        if (data[key].date == 0) {
            return (false, 0, 0);
        }
        return (true, data[key].date, data[key].payload);
    }
}
