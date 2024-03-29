const Oracle = artifacts.require("Oracle");
const Consumer = artifacts.require("Consumer");

module.exports = async function (deployer, _network, addresses) {
  const [admin, reporter] = addresses;
  await deployer.deploy(Oracle, admin);
  const oracle = await Oracle.deployed();
  oracle.updateReporter(reporter, true);
  await deployer.deploy(Consumer, oracle.address);
};
