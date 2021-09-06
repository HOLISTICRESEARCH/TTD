// pragma solidity ^0.4.19;
pragma ton-solidity >= 0.35.0;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    //function _createZombie(string _name, uint _dna) private {
    function _createZombie(string _name, uint _dna) private view {    
        //uint id = uint(zombies.push(Zombie(_name, _dna)) - 1);
        uint id = zombies.length;
        //NewZombie(id, _name, _dna);
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        //uint rand = uint(keccak256(_str));
        uint rand = uint(sha256(_str));
        return rand % dnaModulus;
    }

    //function createRandomZombie(string _name) public {
    function createRandomZombie(string _name) public view {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}