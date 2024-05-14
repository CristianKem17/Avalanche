// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract ByMyself{
  
  address public Me;

  constructor(){
    Me = msg.sender;
  }
  modifier OnlyMe(){
    require(Me == msg.sender, "Only me can access");
    _;
  }

}
