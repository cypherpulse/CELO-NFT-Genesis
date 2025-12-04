// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {CeloLearningNFT} from "../src/CeloLearningNFT.sol";

contract CeloLearningNFTScript is Script {
    function run() external {
        vm.startBroadcast();

        CeloLearningNFT nft = new CeloLearningNFT("Celo Learning NFT", "CLNFT");

        // Optionally mint one example NFT
        nft.mintNft(msg.sender, "ipfs://QmExampleTokenURI");

        vm.stopBroadcast();

        // Note: Verification is done separately after deployment
    }
}