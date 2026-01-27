# Code Examples

This directory contains runnable code examples from **Mastering EVM (2025 Edition)**.

## Structure

```
code/
├── chapter-03/          # Environment Setup
├── chapter-08/          # Solidity Fundamentals
├── chapter-09/          # Advanced Solidity Patterns
├── chapter-10/          # Smart Contract Security
├── chapter-11/          # Testing & Verification
├── chapter-12/          # Deployment & Upgrades
├── chapter-15/          # Token Standards
├── chapter-16/          # AMM Examples
├── chapter-17/          # Lending Examples
└── foundry.toml         # Shared Foundry configuration
```

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) (forge, cast, anvil)
- [Node.js](https://nodejs.org/) 20+ (for TypeScript examples)
- [pnpm](https://pnpm.io/) (recommended) or npm

## Quick Start

```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Clone the repository
git clone https://github.com/evmbook/evmbook.git
cd evmbook/code

# Install dependencies
pnpm install

# Run all tests
forge test

# Run a specific chapter's examples
cd chapter-08
forge test
```

## Chapter Examples

### Chapter 8: Solidity Fundamentals
Basic Solidity contracts demonstrating core concepts:
- Data types and storage
- Functions and modifiers
- Events and errors
- Inheritance patterns

### Chapter 9: Advanced Solidity Patterns
Advanced patterns for production contracts:
- Proxy patterns (UUPS, Transparent, Beacon)
- Library usage
- Inline assembly
- Gas optimization techniques

### Chapter 10: Smart Contract Security
Security-focused examples:
- Reentrancy prevention
- Access control patterns
- Flash loan integration
- Safe math operations

### Chapter 11: Testing & Verification
Comprehensive testing examples:
- Unit tests with forge
- Fuzz testing
- Invariant testing
- Fork testing

### Chapter 12: Deployment & Upgrades
Deployment and upgrade scripts:
- Deployment scripts
- Contract verification
- Upgrade procedures
- Multi-chain deployment

### Chapters 15-17: DeFi Examples
Token and DeFi protocol examples:
- ERC-20, ERC-721, ERC-1155 implementations
- ERC-4626 vault examples
- Minimal AMM implementation
- Lending protocol basics

## Running Tests

```bash
# Run all tests
forge test

# Run with verbosity
forge test -vvv

# Run specific test
forge test --match-test testTransfer

# Run fuzz tests with more runs
forge test --fuzz-runs 10000

# Run fork tests (requires RPC URL)
forge test --fork-url https://eth.llamarpc.com
```

## TypeScript Examples

TypeScript examples use viem and are located in `typescript/` subdirectories:

```bash
# Install dependencies
pnpm install

# Run TypeScript examples
pnpm tsx chapter-03/typescript/example.ts
```

## Configuration

### foundry.toml

The root `foundry.toml` provides shared configuration:

```toml
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
solc = "0.8.26"
optimizer = true
optimizer_runs = 200
```

### Environment Variables

Create a `.env` file for sensitive configuration:

```bash
# RPC URLs for fork testing
MAINNET_RPC_URL=https://eth.llamarpc.com
SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/YOUR_KEY

# Private key for deployment (NEVER commit this)
PRIVATE_KEY=your_private_key_here
```

## Contributing

Found an issue with a code example? Please [open an issue](https://github.com/evmbook/evmbook/issues) or submit a pull request.

## License

Code examples are provided under the MIT License unless otherwise noted.
