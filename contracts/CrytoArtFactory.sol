pragma solidity ^0.4.17;
import './zeppelin/ownership/Ownable.sol';

contract CrytoArtFactory is Ownable {
    uint uuidDigits = 16;
    uint uuidModulus = 10 ** uuidDigits;
    string defaultImageUrl = "http://image";
    event NewArtCreated(uint _artUuid, string _name, uint artId, address _sender);

    struct Art {
        string name;
        uint uuid;
        string imageUrl;
        address ownerAddress;
    }

    Art[] public arts;

    mapping (uint=>address) public artToOwner;
    mapping (address=>uint) public ownArtCount;

    function _createArt(string _name, uint _uuid) internal {
        uint id = arts.push(Art(_name, _uuid, defaultImageUrl));
        artToOwner[id] = msg.sender;
        if (ownArtCount[msg.sender] != 0) {
            ownArtCount[msg.sender] = 0;
        }
        ownArtCount[msg.sender]++;
        NewArtCreated(_uuid, _name, id, msg.sender);
    }

    function _generateRandomUuid(string _name) private view returns (uint) {
        uint rand = uint(keccak256(_name));
        return rand % uuidModulus;
    }

    function creatNewCrptoArt(string name) public {
        uint randUuid = _generateRandomUuid(name);
        _createArt(name, randUuid);
    }

    function _getAllCryptoArts() internal view returns (string[]) {
        string[] memory allArts = new string[](arts.length);
        for (uint i = 0; i < arts.length; i++) {
         allArts[i] = arts[i].imageUrl;
        }
        return allArts;
    }

    function getAllArtsCount() public view returns(uint) {
        return arts.length;
    }

    function getOwnerArtCount(address _owner) public view returns (uint) {
        return ownArtCount[_owner];
    }
}