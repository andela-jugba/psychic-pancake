var v  = artifacts.require("./CrytoArtFactory.sol");
var cryptoarTrade = artifacts.require("./CryptoArtTrade.sol");


module.exports = function(deployer) {
    deployer.deploy(v);
    deployer.link(v, cryptoarTrade)
    deployer.deploy(cryptoarTrade);

};