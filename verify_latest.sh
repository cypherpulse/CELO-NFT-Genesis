#!/bin/bash

# Script to verify the latest deployed CeloLearningNFT contract on Celo Sepolia
# Assumes .env is sourced with CELOSCAN_API_KEY

# Load environment variables
if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found. Please create it with CELOSCAN_API_KEY."
    exit 1
fi

# Find the latest broadcast log for CeloLearningNFT deployment
LATEST_BROADCAST=$(find broadcast -name "*.json" -path "*/CeloLearningNFT.s.sol/*" | sort | tail -1)

if [ -z "$LATEST_BROADCAST" ]; then
    echo "Error: No broadcast logs found for CeloLearningNFT deployment."
    exit 1
fi

# Extract the contract address from the broadcast log
CONTRACT_ADDRESS=$(jq -r '.transactions[] | select(.contractName == "CeloLearningNFT") | .contractAddress' "$LATEST_BROADCAST")

if [ -z "$CONTRACT_ADDRESS" ] || [ "$CONTRACT_ADDRESS" == "null" ]; then
    echo "Error: Could not find contract address in $LATEST_BROADCAST"
    exit 1
fi

echo "Found latest deployed contract: $CONTRACT_ADDRESS"

# Verify the contract
echo "Verifying contract on Celo Sepolia Blockscout..."
forge verify-contract --chain celo-sepolia --etherscan-api-key "$CELOSCAN_API_KEY" "$CONTRACT_ADDRESS" src/CeloLearningNFT.sol:CeloLearningNFT

if [ $? -eq 0 ]; then
    echo "Verification successful! Contract verified at: https://celo-sepolia.blockscout.com/address/$CONTRACT_ADDRESS"
else
    echo "Verification failed. Check the output above for details."
fi