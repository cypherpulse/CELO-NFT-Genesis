# CeloLearningNFT

![Celo Badge](https://img.shields.io/badge/Celo-Ethereum%20L2-blue) ![Solidity](https://img.shields.io/badge/Solidity-^0.8.24-blue) ![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-Contracts-green) ![Foundry](https://img.shields.io/badge/Foundry-Testing%20Framework-yellow)

A simple, secure ERC-721 NFT smart contract designed for learning blockchain development. Deployed on Celo, an Ethereum Layer 2 network that enables fast, low-cost transactions and mobile-first DeFi, this project demonstrates core NFT functionality while prioritizing security and best practices.

## 🚀 Overview

This project showcases a minimal yet production-ready NFT contract built with Solidity. It mints unique digital assets on the Celo network, leveraging OpenZeppelin's battle-tested libraries for reliability. Perfect for developers exploring NFTs, smart contracts, and cross-chain deployment.

Key highlights:
- **Secure Minting**: Owner-controlled NFT creation with metadata support.
- **Celo Integration**: Optimized for Celo's efficient Layer 2 infrastructure.
- **Educational Focus**: Clean code structure for learning and extension.
- **Full Test Coverage**: Comprehensive tests using Foundry.

## ✨ Features

- **ERC-721 Compliant**: Standard NFT interface with URI storage.
- **Access Control**: Owner-only minting to prevent unauthorized issuance.
- **Metadata Support**: Token URIs for rich NFT content (e.g., images, JSON).
- **Gas Efficient**: Custom errors and optimized logic.
- **Celo Optimized**: Deployed on Celo Sepolia for fast, affordable testing.

## 🛠 Tech Stack

- **Solidity**: ^0.8.24 for modern, secure smart contracts.
- **OpenZeppelin**: ERC-721, Ownable, and utility libraries for audited, secure implementations.
- **Foundry**: Development framework for testing, scripting, and deployment.
- **Celo Network**: Ethereum L2 for scalable, eco-friendly blockchain apps.

## 📦 Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/celo-learning-nft.git
   cd celo-learning-nft
   ```

2. **Install Dependencies**:
   - **Install Foundry**: [Foundry Installation Guide](https://book.getfoundry.sh/getting-started/installation)
   - **Install OpenZeppelin Contracts**:
     ```bash
     forge install OpenZeppelin/openzeppelin-contracts
     ```
     This pulls the latest audited OpenZeppelin contracts into `lib/openzeppelin-contracts/`, providing secure ERC-721, access control, and utility functions. The contract imports these for reliability and best practices.

3. **Set Up Environment**:
   - Copy `.env.example` to `.env` and fill in your values:
     ```bash
     CELO_SEPOLIA_RPC_URL=https://forno.celo-sepolia.celo-testnet.org
     CELOSCAN_API_KEY=your_celoscan_api_key
     ADDRESS=your_wallet_address
     ```
   - Fund your wallet with Celo Sepolia tokens via the [Celo Faucet](https://faucet.celo.org/sepolia).

## 🧪 Testing

Run the full test suite:
```bash
forge test
```

Expected output: All tests pass, confirming minting, ownership, and URI functionality.

## 🚀 Deployment

Deploy to Celo Sepolia:
```bash
forge script script/CeloLearningNFT.s.sol --rpc-url $CELO_SEPOLIA_RPC_URL --broadcast --chain celo-sepolia --keystore ~/.foundry/keystores/your_keystore --sender $ADDRESS
```

- Note the contract address from the output.
- Verify on Celo Sepolia Blockscout:
  ```bash
  forge verify-contract --chain celo-sepolia --etherscan-api-key $CELOSCAN_API_KEY <contract_address> src/CeloLearningNFT.sol:CeloLearningNFT
  ```

## 📖 Usage

### Minting an NFT
As the contract owner, call `mintNft`:
```solidity
nft.mintNft(recipientAddress, "ipfs://your-metadata-uri");
```

### Viewing NFTs
- Check ownership: `ownerOf(tokenId)`
- Get metadata: `tokenURI(tokenId)`
- Total supply: `totalSupply()`

Interact via [Celo Sepolia Blockscout](https://sepolia.celoscan.io/) or tools like Remix.

## 🤝 Contributing

We welcome contributions! To get started:
1. Fork the repo.
2. Create a feature branch: `git checkout -b feature/your-feature`.
3. Commit changes: `git commit -m "Add your feature"`.
4. Push and open a PR.

Guidelines:
- Follow Solidity best practices.
- Add tests for new features.
- Update documentation.

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🌟 Acknowledgments

Built with inspiration from open-source blockchain communities. Special thanks to the Celo ecosystem for enabling accessible DeFi and NFTs.

---

**Live Contract**: [0xdfd6a971D1e6Ff57e8cB6A585b3f59A18221F10D](https://celo-sepolia.blockscout.com/address/0xdfd6a971D1e6Ff57e8cB6A585b3f59A18221F10D) on Celo Sepolia.
