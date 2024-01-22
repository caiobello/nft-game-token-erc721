// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NftTokenGame is ERC721{

    struct Monstro{
        string name;
        uint level;
        string img;
    }

    Monstro[] public listaMonstro;
    address public gameOwner;

    constructor () ERC721 ("NftTokenGame", "NTG"){

        gameOwner = msg.sender;

    } 

    modifier onlyOwnerOf(uint _monsterId) {

        require(ownerOf(_monsterId) == msg.sender,"Apenas o dono pode batalhar com este Pokemon");
        _;

    }

    function battle(uint _attackingMonster, uint _defendingMonster) public onlyOwnerOf(_attackingMonster){
        Monstro storage attacker = listaMonstro[_attackingMonster];
        Monstro storage defender = listaMonstro[_defendingMonster];

         if (attacker.level >= defender.level) {
            attacker.level += 2;
            defender.level += 1;
        }else{
            attacker.level += 1;
            defender.level += 2;
        }
    }

    function createNewMonster(string memory _name, address _to, string memory _img) public {
        require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar novos Pokemons");
        uint id = listaMonstro.length;
        listaMonstro.push(Monstro(_name, 1,_img));
        _safeMint(_to, id);
    }

}