// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract McdoBurgers {

    function BurgerMcdo(uint Price_BurgerMcdo) public pure {
        require(Price_BurgerMcdo > 140, "Please add your payment, to proceed order");
    }

    function BigMac(uint Price_BigMac) public pure {
        if (Price_BigMac < 200) {
            revert("Please add your payment, to proceed order");
       }
    }

    function CheeseBurger(uint Price_CheeseBurger) public pure {
        assert(Price_CheeseBurger == 170);
    }
}