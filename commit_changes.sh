#!/bin/bash

# Script to commit each change separately with detailed commit messages
# Project: CeloLearningNFT on CELO Blockchain
# Tech Stack: Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry v1.12.0

# Get Foundry version
FOUNDRY_VERSION=$(forge --version | grep -oP 'forge \K[^\s]+')

# List of files to commit
files=(
    ".gitmodules"
    "lib/forge-std"
    "lib/openzeppelin-contracts"
    ".github/workflows/test.yml"
    ".gitignore"
    "README.md"
    "foundry.lock"
    "foundry.toml"
    "script/CeloLearningNFT.s.sol"
    "src/CeloLearningNFT.sol"
    "test/CeloLearningNFT.t.sol"
)

# Commit each file
for file in "${files[@]}"; do
    git add "$file"
    if [[ "$file" == "lib/forge-std" ]]; then
        git commit -m "Update forge-std to v1.12.0 for CELO Blockchain project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == "lib/openzeppelin-contracts" ]]; then
        git commit -m "Update OpenZeppelin contracts to v5.5.0 for CELO Blockchain project using Solidity ^0.8.24, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == ".gitmodules" ]]; then
        git commit -m "Add .gitmodules for submodules in CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == ".github/workflows/test.yml" ]]; then
        git commit -m "Add CI workflow for testing CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == ".gitignore" ]]; then
        git commit -m "Add .gitignore for CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == "README.md" ]]; then
        git commit -m "Add README.md documenting CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == "foundry.lock" ]]; then
        git commit -m "Add foundry.lock for dependency locking in CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == "foundry.toml" ]]; then
        git commit -m "Configure foundry.toml for CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == "script/CeloLearningNFT.s.sol" ]]; then
        git commit -m "Add deployment script for CELO Blockchain NFT using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == "src/CeloLearningNFT.sol" ]]; then
        git commit -m "Implement CeloLearningNFT contract for CELO Blockchain using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    elif [[ "$file" == "test/CeloLearningNFT.t.sol" ]]; then
        git commit -m "Add tests for CeloLearningNFT on CELO Blockchain using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $FOUNDRY_VERSION"
    fi
done

# Push to GitHub
git push origin main