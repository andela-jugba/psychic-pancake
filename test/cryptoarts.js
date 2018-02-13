var CrytoArtFactory = artifacts.require("./CrytoArtFactory.sol");

contract('CryptoArts', function(accounts){
    let createArt;
    beforeEach(function(){
        CrytoArtFactory.deployed().then(function(deployed){
            let cryptoartInstance = deployed;
        })
    })
    it("It should create new crypto art item", function() {
        CrytoArtFactory.deployed().then(function(deployed){
            let cryptoartInstance = deployed;
            createArt = cryptoartInstance.NewArtCreated();
            // createArt.watch(function(err, results){
            //     console.log(results);
            //     return 0;
            // })
           return cryptoartInstance;
        }).then(function(artinstance){
            artinstance.creatNewCrptoArt("Art 001", {from: accounts[0]});
            return artinstance;
        }).then(function(artinstance){
            return artinstance.ownArtCount(accounts[0], {from: accounts[0]});
        }).then(function(count){
            assert.equal(count, 1, "It should be one")
        })
    } )

    it("It should getAllArtsCount", () => {
        CrytoArtFactory.deployed().then((deployed) => {
            let cryptoartInstance = deployed;
            return cryptoartInstance;
        }).then((cryptoartInstance) => {
            cryptoartInstance.creatNewCrptoArt("Art 002", {from: accounts[0]});
            return cryptoartInstance;
        }).then((cryptoartInstance) => {
            return cryptoartInstance.getAllArtsCount.call();
        }).then((count) => {
            assert.equal(count, 2, "The number of arts should be correct"); 
        })
    })
});