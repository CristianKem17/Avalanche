// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Lesson4Global {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    function isOwner(address _address) public view returns (bool) {
        return _address == owner;
    }

    function sendEther(address payable _recipient) public payable {
        require(msg.sender == owner, "Only the contract owner can send ether.");
        _recipient.transfer(msg.value);
    }

    function getCurrentBlock() public view returns (uint, uint, address) {
        return (block.number, block.timestamp, block.coinbase);
    }
}
