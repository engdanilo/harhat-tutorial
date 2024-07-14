const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const TokenModule = buildModule("TokenModule", (m) => {
  const token = m.contract("Token");

  return { token };
});

module.exports = TokenModule;

// FOi criado o contrato 0x2B24cFacB5D652072Ad942F2Bf67b82Ac2105adf