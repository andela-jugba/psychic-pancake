var CrytoArtFactory = artifacts.require("./CrytoArtFactory.sol");

contract('CryptoArts', function(accounts){
    let createArt;

    it("It should create new crypto art item", function() {
        CrytoArtFactory.deployed().then(function(deployed){
            let cryptoartInstance = deployed;
            createArt = cryptoartInstance.NewArtCreated(function(err, results){
                assert.equal(results.args._name, "Art 002", "Should log correct art creation");
            });
           return cryptoartInstance;
        }).then(function(artinstance){
            artinstance.creatNewCrptoArt("Art 001", {from: accounts[0]});
            return artinstance;
        }).then(function(artinstance){
            return artinstance.ownArtCount.call(accounts[0], {from: accounts[0]});
        }).then(function(count){
            assert.equal(count, 1, "It should be one")
        })
    } )
});