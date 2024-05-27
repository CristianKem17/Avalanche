const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const myContract = await hre.ethers.getContractAt("MyContract", deployer.address);

  await myContract.performTransaction(1, deployer.address, 100);
  await myContract.updateStatus("Processing");
  await myContract.sendNotification("Transaction completed!");

  myContract.on("NewTransaction", (transactionId, sender, amount, event) => {
    console.log(`New transaction: ${transactionId}, Sender: ${sender}, Amount: ${amount}`);
  });

  myContract.on("UpdateStatus", (status, event) => {
    console.log(`Status updated: ${status}`);
  });

  myContract.on("Notification", (message, event) => {
    console.log(`Notification: ${message}`);
  });
}

main()
 .then(() => process.exit(0))
 .catch((error) => {
    console.error(error);
    process.exit(1);
  });
