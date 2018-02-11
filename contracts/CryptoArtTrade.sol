pragma solidity ^0.4.17;

import './CrytoArtFactory.sol';

contract CryptoArtTrade is CrytoArtFactory {
    mapping (uint=>uint) public cryptoartPrices;

    function setCryptoArtPrice(uint _cryptoArtId, uint _artPrice) public {
        cryptoartPrices[_cryptoArtId] = _artPrice;
    }

    function buyCryptoArt(uint _cryptoArtId) external payable {
        uint price = cryptoartPrices[_cryptoArtId];
        require(msg.value == price);
        _setCryptoArtOwner(_cryptoArtId, msg.sender);
    }

    function _setCryptoArtOwner(uint _cryptoartId, address newOwner ) internal {
        artToOwner[_cryptoartId] = newOwner;
    }

    function getCryptoArtPrice(uint _cryptoArtId) public view returns (uint ) {
        return cryptoartPrices[_cryptoArtId];
    }
}