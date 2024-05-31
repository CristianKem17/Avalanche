// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract KemToken is ERC20 {
    address public owner;

    constructor() ERC20("KemToken", "KTK") {
        owner = msg.sender;
        _mint(owner, 1000 * (10 ** decimals())); // Initial minting of 1000 tokens to the owner
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Function to mint tokens, only the owner can call this
    function mintedToken(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens, any user can burn their own tokens
    function burnedToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    //Custom transfer function
    function transferToken(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
}
