import React, { useState } from "react";

const DamageCalculator = () => {
  const [myAttackDamage, setMyAttackDamage] = useState(0);
  const [enemyDefence, setEnemyDefence] = useState(0);
  const [enemyHealth, setEnemyHealth] = useState(0);
  const [enemyDamageTaken, setEnemyDamageTaken] = useState(0);
  const [enemyCurrentHealth, setEnemyCurrentHealth] = useState(0);

  const handleSetAttackDamage = () => {
    // Logic to set attack damage
    // Placeholder function for demonstration
  };

  const handleSetEnemyDefence = () => {
    // Logic to set enemy defence
    // Placeholder function for demonstration
  };

  const handleSetEnemyHealth = () => {
    // Logic to set enemy health
    // Placeholder function for demonstration
  };

  const handleCalculateDamage = () => {
    // Logic to calculate damage
    const damageTaken = Math.max(0, myAttackDamage - enemyDefence);
    setEnemyDamageTaken(damageTaken);
  };

  const handleCalculateCurrentHealth = () => {
    // Logic to calculate current health
    const currentHealth = Math.max(0, enemyHealth - enemyDamageTaken);
    setEnemyCurrentHealth(currentHealth);

    if (currentHealth === 0) {
      alert("The Dragon has been Slain");
    }
  };

  return (
    <div className="container" >
      <h1>Me Vs Dragon</h1>
      <div>
        <label>
          My Attack Damage:
          <input type="number" value={myAttackDamage} onChange={(e) => setMyAttackDamage(Number(e.target.value))} />
        </label>
        <button onClick={handleSetAttackDamage}>Set Attack Damage</button>
      </div>
      <div>
        <label>
          Dragon's Defence:
          <input type="number" value={enemyDefence} onChange={(e) => setEnemyDefence(Number(e.target.value))} />
        </label>
        <button onClick={handleSetEnemyDefence}>Set Dragon's Defence</button>
      </div>
      <div>
        <label>
          Dragon's Health:
          <input type="number" value={enemyHealth} onChange={(e) => setEnemyHealth(Number(e.target.value))} />
        </label>
        <button onClick={handleSetEnemyHealth}>Set Dragon's Health</button>
      </div>
      <div>
        <button onClick={handleCalculateDamage}>Calculate Damage</button>
      </div>
      <div>
        <button onClick={handleCalculateCurrentHealth}>Calculate Current Health</button>
      </div>
      <div>
        <h2>Results</h2>
        <p>Dragon's Damage Taken: {enemyDamageTaken}</p>
        <p>Dragon's Current Health: {enemyCurrentHealth}</p>
      </div>
      <style jsx>
        {`
        .container{
          text-align: center;
        }
        `}
      </style>
    </div>
  );
};

export default DamageCalculator;
