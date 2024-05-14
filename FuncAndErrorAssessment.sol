// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract FunctionAndError {
    uint public num;
    address public admin;

    constructor(address _admin, uint _value) {
        num = _value;
        admin = _admin;
    }

    function RequireValue() public view {
        require(num > 10, "Value must be greater than 10");
    }

    function RevertValue() public view {
       if (num > 1000) {
            revert("Value cannot be greater than 1000");
       }
    }

    function AssertValue() public view {
        assert(num == 0);
    }
}