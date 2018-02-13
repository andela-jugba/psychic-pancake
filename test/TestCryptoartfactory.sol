pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/CrytoArtFactory.sol";

contract TestCryptoartfactory {
    CrytoArtFactory crytoArtFactory = CrytoArtFactory(DeployedAddresses.CrytoArtFactory());

    function testGetCryptoArtCount() {
        crytoArtFactory.creatNewCrptoArt("Art 002");
        crytoArtFactory.creatNewCrptoArt("Art 003");
        uint expected = 2;

        Assert.equal(crytoArtFactory.getAllArtsCount(), expected, "It should have a length of one");
    
    }
}