// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {CeloLearningNFT} from "../src/CeloLearningNFT.sol";

contract CeloLearningNFTTest is Test {
    CeloLearningNFT nft;
    address owner = address(1);
    address user = address(2);

    function setUp() public {
        vm.prank(owner);
        nft = new CeloLearningNFT("Test NFT", "TNFT");
    }

    function testMintNft() public {
        vm.prank(owner);
        nft.mintNft(user, "testURI");
        assertEq(nft.ownerOf(0), user);
        assertEq(nft.tokenURI(0), "testURI");
        assertEq(nft.totalSupply(), 1);
    }
}