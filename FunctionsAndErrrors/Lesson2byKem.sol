// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract PureViewPay {
   function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

   function CurrentTimeStamp() public view returns (uint256) {
        return block.timestamp;
    }

  receive() external payable {}
}
      