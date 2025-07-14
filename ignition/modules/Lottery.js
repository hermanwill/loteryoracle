const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const LotteryModule = buildModule("LotteryModule", (deployer) => {
  const lottery = deployer.contract("lotery");

  return { lottery };
});

module.exports = LotteryModule;