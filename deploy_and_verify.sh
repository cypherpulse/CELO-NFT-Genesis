#!/bin/bash

# Script to deploy CeloLearningNFT and automatically verify it on Celo Sepolia
# Assumes .env is sourced with CELO_SEPOLIA_RPC_URL, CELOSCAN_API_KEY, ADDRESS

# Load environment variables
if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found. Please create it with required variables."
    exit 1
fi

# Check if keystore exists
KEYSTORE_PATH="$HOME/.foundry/keystores/defaultKey"
if [ ! -f "$KEYSTORE_PATH" ]; then
    echo "Error: Keystore not found at $KEYSTORE_PATH"
    exit 1
fi

# Deploy the contract
echo "Deploying CeloLearningNFT to Celo Sepolia..."
forge script script/CeloLearningNFT.s.sol --rpc-url "$CELO_SEPOLIA_RPC_URL" --broadcast --chain 62320 --keystore "$KEYSTORE_PATH" --sender "$ADDRESS"

if [ $? -ne 0 ]; then
    echo "Deployment failed."
    exit 1
fi

echo "Deployment successful!"

# Find the latest broadcast log
LATEST_BROADCAST=$(find broadcast -name "*.json" -path "*/CeloLearningNFT.s.sol/*" | sort | tail -1)

if [ -z "$LATEST_BROADCAST" ]; then
    echo "Error: No broadcast logs found."
    exit 1
fi

# Extract contract address
CONTRACT_ADDRESS=$(jq -r '.transactions[] | select(.contractName == "CeloLearningNFT") | .contractAddress' "$LATEST_BROADCAST")

if [ -z "$CONTRACT_ADDRESS" ] || [ "$CONTRACT_ADDRESS" == "null" ]; then
    echo "Error: Could not extract contract address."
    exit 1
fi

echo "Contract deployed at: $CONTRACT_ADDRESS"

# Verify the contract
echo "Verifying contract..."
forge verify-contract --chain celo-sepolia --etherscan-api-key "$CELOSCAN_API_KEY" "$CONTRACT_ADDRESS" src/CeloLearningNFT.sol:CeloLearningNFT

if [ $? -eq 0 ]; then
    echo "Verification successful! View at: https://celo-sepolia.blockscout.com/address/$CONTRACT_ADDRESS"
else
    echo "Verification failed."
fi