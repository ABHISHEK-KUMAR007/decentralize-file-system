//import "hardhat-faucet";
//import "hardhat-faucet"
require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks:{
    hardhat:{
      chainId:1337,
    },
    
  },
  path:{
    artifacts:"./client/src/artifacts"
  }
};
