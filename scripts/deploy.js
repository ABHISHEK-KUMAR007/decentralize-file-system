const hre = require("hardhat");

async function main() {
  const Upload = await hre.ethers.getContractFactory("Upload");
  //const Upload = await hre.ethers.deployContract("Lock")
  //const upload=await Upload.deploy("hellow world");
  const upload = await Upload.deployed();

  //await upload.waitForDeployment();
 // await upload.deployed();

  console.log("Library deployed to:", upload.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
