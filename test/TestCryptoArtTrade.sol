pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CryptoArtTrade.sol";

contract TestCryptoArtTrade {
    CryptoArtTrade cryptoArtTrade = CryptoArtTrade(DeployedAddresses.CryptoArtTrade());

    function testSetCryptoArtPrices() {
        cryptoArtTrade.creatNewCrptoArt("Art 001");
        cryptoArtTrade.setCryptoArtPrice(0, 1);
        uint expected = cryptoArtTrade.getCryptoArtPrice(0);
        Assert.equal(1, expected, "Should be equal");
    }
}