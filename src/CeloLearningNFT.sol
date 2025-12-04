// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract

// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.24;

/**
 * @title CeloLearningNFT
 * @dev A simple ERC-721 NFT contract for learning purposes on Celo testnet.
 * Follows Cyfrin Updraft style: clean structure, custom errors, OpenZeppelin for security.
 * OpenZeppelin is used for battle-tested ERC-721 implementation, access control (Ownable).
 * Custom errors provide gas-efficient reverts with descriptive messages.
 * Access control (onlyOwner) prevents unauthorized minting, ensuring security.
 */
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

// Custom errors
error CeloLearningNFT__NotOwner();

contract CeloLearningNFT is ERC721, ERC721URIStorage, Ownable {
    // Type declarations

    // State variables
    uint256 private s_tokenIdCounter;

    // Events
    event NftMinted(address indexed to, uint256 indexed tokenId);

    // Modifiers

    // Functions

    /**
     * @dev Constructor sets the name and symbol for the NFT collection.
     * @param name The name of the NFT collection.
     * @param symbol The symbol of the NFT collection.
     */
    constructor(string memory name, string memory symbol) ERC721(name, symbol) Ownable(msg.sender) {}

    /**
     * @dev Mints a new NFT to the specified address with a token URI.
     * Only the owner can mint. Emits NftMinted event.
     * Checks-effects-interactions: Checks (onlyOwner), Effects (mint and set URI), Interactions (_safeMint).
     * @param to The address to mint the NFT to.
     * @param uri The URI for the token metadata.
     */
    function mintNft(address to, string memory uri) public onlyOwner {
        uint256 tokenId = s_tokenIdCounter;
        s_tokenIdCounter++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        emit NftMinted(to, tokenId);
    }

    /**
     * @dev Returns the total supply of NFTs minted.
     * @return The current token ID counter value.
     */
    function totalSupply() public view returns (uint256) {
        return s_tokenIdCounter;
    }

    /**
     * @dev Overrides tokenURI to support ERC721URIStorage.
     * @param tokenId The ID of the token.
     * @return The token URI.
     */
    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    /**
     * @dev Overrides supportsInterface for ERC721URIStorage.
     * @param interfaceId The interface ID.
     * @return True if supported.
     */
    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}