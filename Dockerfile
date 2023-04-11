FROM node:16.16 AS builder

WORKDIR /app
RUN apt-get update 

RUN npm install hardhat

RUN echo "/** @type import('hardhat/config').HardhatUserConfig */ \
module.exports = { \
  solidity: \"0.8.18\", \
  networks: { \
    hardhat: { \
      chainId: +(process.env.CHAIN_ID), \
      mining: { \
        auto: false, \
        interval: 1000 \
      }, \
      accounts: { \
        mnemonic: process.env.MNEMONIC, \
        count: 50 \
      } \
    } \
  } \
};" > hardhat.config.js