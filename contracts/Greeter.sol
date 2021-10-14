//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "hardhat/console.sol";

contract Greeter is ERC721URIStorage {
    string private _name;

    using Counters for Counters.Counter; 
    Counters.Counter private _tokenIds;

    constructor(string memory name, string memory symbol)
        ERC721(name, symbol)
    {
        console.log("name", name);
        console.log("symbol", symbol);
        console.log("msg.sender", msg.sender);
        _name = name;
    }

    function mint(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function getName() public view returns (string memory) {
        return _name;
    }

    function setName(string memory name) public {
        console.log("Seting name from '%s' to '%s'", _name, name);
        _name = name;
    }
}