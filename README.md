# Mastering EVM (2025 Edition)

**The Complete Guide to the Ethereum Virtual Machine**

A comprehensive guide to EVM development for 2025-2026. This book covers everything from foundational cryptography to building complete DeFi protocols, with a focus on practical code patterns and the evolution of key primitives.

**Version 2025.1.0** | **28 Chapters** | **8 Appendices** | **~180,000 words**

**Website**: [masteringevm.com](https://masteringevm.com)

## What This Book Covers

### Part I: The EVM Landscape (Ch 1-3)
Context-setting for developers entering the space today—the multi-chain reality, L2 ecosystem, and modern tooling.

### Part II: Core Foundations (Ch 4-7)
Cryptography, accounts, transactions, gas, and consensus mechanisms across ETH and ETC.

### Part III: Smart Contract Development (Ch 8-12)
Solidity fundamentals through advanced patterns, security, testing with Foundry, and deployment strategies.

### Part IV: The EVM Under the Hood (Ch 13-14)
EVM internals, opcodes, and gas optimization techniques.

### Part V: The Application Layer (Ch 15-22)
**Evolution narratives** showing how each primitive developed:
- Token Standards (ERC-20 → ERC-4626)
- AMMs (EtherDelta → Uniswap V3 → Aerodrome)
- Lending (Compound → Aave V3 → Sky Protocol)
- Governance & DAOs
- NFT Marketplaces (Wyvern → Seaport → Blur)
- Launchpads (ICOs → LBPs → Pump.fun)
- Prediction Markets (Augur → Polymarket)
- Oracles (Chainlink, Chronicle, RedStone, Pyth)

### Part VI: Scaling & Infrastructure (Ch 23-24)
Layer 2 solutions and zero-knowledge applications.

### Part VII: Building for the Real World (Ch 25-27)
Regulatory landscape, ecosystem bootstrapping (dependency trees), and agentic development.

## Key Features

- **Fresh 2025-2026 perspective**: Not an update of older material—written for today's EVM landscape
- **Dual-chain coverage**: Ethereum and Ethereum Classic where relevant (ETH as "upstream", ETC as "LTS")
- **Evolution narratives**: Understand how DeFi primitives developed, not just their current state
- **Dependency trees**: Know what to build first when bootstrapping a new EVM ecosystem
- **Modern tooling**: Foundry, viem, wagmi, TypeScript throughout

## Available Formats

| Format | Price | Status |
|--------|-------|--------|
| **Web** | Free | [masteringevm.com](https://masteringevm.com) |
| **PDF** | Free | [Download](https://masteringevm.com/downloads) |
| **EPUB** | Free | [Download](https://masteringevm.com/downloads) |
| **Kindle** | $9.99 | Amazon |
| **Paperback** | $49.99 | Amazon / IngramSpark |

ISBN (Paperback): 979-8-9947278-0-5

## Repository Structure

```
evmbook-v1/
├── content/
│   ├── chapters/           # 28 chapters (MDX) including preface
│   │   ├── 00-preface.mdx
│   │   ├── 01-evm-today.mdx
│   │   └── ... through 27-agentic-development.mdx
│   └── appendices/         # 8 appendices (A-H)
│       ├── a-fork-history.mdx
│       ├── b-eip-standards.mdx
│       └── ... through h-essential-reading.mdx
├── publishing/             # Publishing metadata and templates
├── images/                 # Diagrams and screenshots
├── code/                   # Runnable code examples
├── scripts/                # Build scripts (PDF, EPUB)
├── .claude/                # Claude Code configuration
└── .github/                # GitHub Copilot configuration
```

## Technical Standards

- **Solidity**: 0.8.26+
- **TypeScript**: Default for all JS examples
- **Libraries**: viem (preferred), ethers.js v6
- **Testing**: Foundry (forge test, fuzzing, invariants)
- **Networks**: Ethereum mainnet, Ethereum Classic, Sepolia, Mordor

## Content Format

Chapters are written in MDX with custom components:

```mdx
---
title: Chapter Title
description: One-line description
chapter: N
---

# Chapter Title

<Warning>
Important cautionary information
</Warning>

## Section

Content with code examples:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Example {
    // Modern Solidity patterns
}
```
```

## Development

### Agentic Coding Setup

This repository is configured for AI-assisted development:

- **Claude Code**: See `.claude/CLAUDE.md`
- **GitHub Copilot**: See `.github/copilot-instructions.md`

### Building

The content is designed for MDX-compatible static site generators. The website at masteringevm.com uses a custom Next.js setup.

## License

This work is licensed under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) (Attribution-NonCommercial).

You are free to share and adapt this material for non-commercial purposes with attribution. Commercial use requires permission from the publisher.

See [LICENSE](LICENSE) for full terms.

## Author & Publisher

**B.L. Brocer** — Author
**White B0x Inc.** — Publisher

Developed with assistance from [Claude](https://claude.ai).
