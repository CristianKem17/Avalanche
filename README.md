# FunctionAndError Solidity Contract

This is a simple Solidity contract demonstrating the use of error handling mechanisms such as `require`, `revert`, and `assert`. The contract also includes a constructor to initialize state variables.

## Contract Details

This defines a smart contract named FunctionAndError

### State Variables

- `uint public num;`
  - This variable stores a number which will be used in the error handling functions.

- `address public admin;`
  - This variable stores the address of the admin.

### Constructor

The constructor initializes the state variables `num` and `admin`.

```solidity
constructor(address _admin, uint _value) {
    num = _value;
    admin = _admin;
}
```
## Function

RequireValue
This function checks if num is greater than 10. If not, it throws an error.

```solidity
function RequireValue() public view {
    require(num > 10, "Value must be greater than 10");
}
```
RevertValue
This function checks if num is greater than 1000. If yes, it reverts the transaction.

```solidity
function RevertValue() public view {
    if (num > 1000) {
        revert("Value cannot be greater than 1000");
    }
}
```
AssertValue
This function uses an assert statement to ensure num is equal to 0. If not, it throws an error.

```solidity
function AssertValue() public view {
    assert(num == 0);
}
```
This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain.

## Authors

Creator: Cristian Kem D. Morales
Facebook: https://www.facebook.com/AnxietyKem/


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
