// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    event NewTransaction(uint indexed transactionId, address indexed sender, uint amount);
    event UpdateStatus(string status);
    event Notification(string message);

    function performTransaction(uint _transactionId, address _sender, uint _amount) public {
        
        emit NewTransaction(_transactionId, _sender, _amount);
    }

    function updateStatus(string memory _status) public {
        
        emit UpdateStatus(_status);
    }

    function sendNotification(string memory _message) public {
        
        emit Notification(_message);
    }
}

