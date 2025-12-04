# Script to commit each change separately with detailed commit messages
# Project: CeloLearningNFT on CELO Blockchain
# Tech Stack: Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry v1.12.0

# Get Foundry version
$foundryOutput = forge --version
$foundryVersion = if ($foundryOutput -match 'Version: (\S+)') { $Matches[1] } else { "unknown" }

# List of files to commit
$files = @(
    ".gitmodules",
    "lib/forge-std",
    "lib/openzeppelin-contracts",
    ".github/workflows/test.yml",
    ".gitignore",
    "README.md",
    "foundry.lock",
    "foundry.toml",
    "script/CeloLearningNFT.s.sol",
    "src/CeloLearningNFT.sol",
    "test/CeloLearningNFT.t.sol"
)

# Commit each file
foreach ($file in $files) {
    git add $file
    if ($file -eq "lib/forge-std") {
        git commit -m "Update forge-std to v1.12.0 for CELO Blockchain project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq "lib/openzeppelin-contracts") {
        git commit -m "Update OpenZeppelin contracts to v5.5.0 for CELO Blockchain project using Solidity ^0.8.24, Foundry $foundryVersion"
    } elseif ($file -eq ".gitmodules") {
        git commit -m "Add .gitmodules for submodules in CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq ".github/workflows/test.yml") {
        git commit -m "Add CI workflow for testing CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq ".gitignore") {
        git commit -m "Add .gitignore for CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq "README.md") {
        git commit -m "Add README.md documenting CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq "foundry.lock") {
        git commit -m "Add foundry.lock for dependency locking in CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq "foundry.toml") {
        git commit -m "Configure foundry.toml for CELO Blockchain NFT project using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq "script/CeloLearningNFT.s.sol") {
        git commit -m "Add deployment script for CELO Blockchain NFT using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq "src/CeloLearningNFT.sol") {
        git commit -m "Implement CeloLearningNFT contract for CELO Blockchain using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    } elseif ($file -eq "test/CeloLearningNFT.t.sol") {
        git commit -m "Add tests for CeloLearningNFT on CELO Blockchain using Solidity ^0.8.24, OpenZeppelin v5.5.0, Foundry $foundryVersion"
    }
}

# Push to GitHub
git push origin master