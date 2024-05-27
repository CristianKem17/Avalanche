// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DamageCalculation {
    uint256 public myAttackDamage;
    uint256 public enemyDefence;
    uint256 public enemyDamageTaken;
    uint256 public enemyHealth;
    uint256 public enemyCurrentHealth;

    // Function to set the attack damage
    function setAttackDamage(uint256 _attackDamage) public {
        myAttackDamage = _attackDamage;
    }

    // Function to set the enemy defence
    function setEnemyDefence(uint256 _defence) public {
        enemyDefence = _defence;
    }

    // Function to set the enemy health
    function setEnemyHealth(uint256 _health) public {
        enemyHealth = _health;
    }

    // Function to calculate the damage taken by the enemy
    function calculateDamage() public {
        // Ensure that enemy defence does not exceed attack damage to prevent underflow
        if (enemyDefence >= myAttackDamage) {
            enemyDamageTaken = 0;
        } else {
            enemyDamageTaken = myAttackDamage - enemyDefence;
        }
    }

    // Function to calculate the enemy's current health after taking damage
    function calculateCurrentHealth() public {
        if (enemyHealth <= enemyDamageTaken) {
            enemyCurrentHealth = 0; // Ensure health doesn't go below 0
        } else {
            enemyCurrentHealth = enemyHealth - enemyDamageTaken;
        }

        // Check if the enemy is defeated
        require(enemyCurrentHealth > 0, "The Dragon has been Slain");
    }
}