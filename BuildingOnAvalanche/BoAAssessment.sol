// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, ERC20Burnable, Ownable {

    enum Item { HealthPotion, ManaPotion, Antidote }
    string[] private itemNames = ["HealthPotion", "ManaPotion", "Antidote"];
    uint256[] private itemPrices = [100, 200, 300]; // Prices in tokens without decimals

    // Mapping to store the inventory of each player
    mapping(address => mapping(Item => uint256)) private playerInventory;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    // Mint new tokens and distribute them as rewards (onlyOwner)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Transferring tokens (ERC20 transfer function already handles this)
    function transferTokens(address to, uint256 amount) public {
        transfer(to, amount);
    }

    // Redeem tokens for items in the in-game store
    function redeemItem(uint256 itemId) public {
        require(itemId >= 0 && itemId < itemNames.length, "Invalid item ID");
        uint256 itemPrice = itemPrices[itemId];
        require(balanceOf(msg.sender) >= itemPrice, "Not enough tokens to redeem item");

        _burn(msg.sender, itemPrice);
        // Add the item to the player's inventory
        playerInventory[msg.sender][Item(itemId)] += 1;
    }

    // Checking token balance
    function checkBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    // Function to show the name of a specific item by index
    function getItemName(uint256 index) public view returns (string memory) {
        require(index >= 0 && index < itemNames.length, "Invalid item index");
        return itemNames[index];
    }

    // Function to show available item prices
    function showItemPrices() public view returns (uint256[] memory) {
        return itemPrices;
    }

    // Function to check the player's inventory
    function checkInventory() public view returns (uint256[] memory) {
        uint256[] memory inventory = new uint256[](itemNames.length);
        for (uint256 i = 0; i < itemNames.length; i++) {
            inventory[i] = playerInventory[msg.sender][Item(i)];
        }
        return inventory;
    }
}
