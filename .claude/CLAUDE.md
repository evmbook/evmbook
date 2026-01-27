# Claude Code Instructions for evmbook-v1

## Project Overview

This repository contains **Mastering EVM**—a comprehensive single-volume book (28 chapters) covering EVM development from cryptographic foundations through modern agentic development.

**NOT an 11-book series.** This is a unified book with chapters 00-27.

## Repository Structure

```
evmbook-v1/
├── content/                        # Book source content (MDX)
│   ├── chapters/                   # 28 chapters (00-preface through 27-agentic)
│   ├── appendices/                 # 8 appendices (A-H)
│   └── meta/                       # About, colophon
├── .claude/                        # Agent instructions (this file)
├── .archive/                       # Superseded content (reference only)
│   └── old-chapters/               # Previous chapter versions
├── code/                           # Code examples (placeholder)
├── images/                         # Diagrams, screenshots (placeholder)
└── scripts/                        # Build scripts (placeholder)
```

## Book Structure (28 Chapters)

| Part | Chapters | Focus |
|------|----------|-------|
| I: Landscape | 0-3 | Preface, EVM today, history (1976-2026), environment setup |
| II: Foundations | 4-7 | Cryptography, accounts, transactions, consensus |
| III: Development | 8-12 | Solidity, advanced patterns, security, testing, deployment |
| IV: Internals | 13-14 | EVM opcodes, gas optimization |
| V: Applications | 15-22 | Token standards, AMMs, lending, governance, NFTs, launchpads, prediction markets, oracles |
| VI: Scaling | 23-24 | Layer 2, zero-knowledge |
| VII: Real World | 25-27 | Regulatory, bootstrapping ecosystems, agentic development |

### Appendices (A-H)

- A: Fork History (ETH and ETC)
- B: EIP Standards Reference
- C: EVM Opcodes
- D: Development Tools
- E: Glossary
- F: Regulatory Timeline
- G: Key Figures in Blockchain History
- H: Essential Reading List

## Content Guidelines

### Writing Style
- Technical accuracy first
- Evolution narratives: show how each primitive developed over time
- Document failures and lessons learned
- Practical code examples at each evolutionary stage
- Both ETH and ETC coverage (dual-chain perspective)
- Developer lessons: "What this means for builders"

### Chapter Structure
- Clear ### subsections for navigation (minimum 15+ for comprehensive chapters)
- Historical context where applicable
- Code examples with practical demonstrations
- Dependency positioning (how topic connects to others)

### MDX Format
- Use `<Callout>`, `<Note>`, `<Tip>`, `<Warning>` components
- Code blocks with language specifier
- Tables for comparisons
- ASCII diagrams for architecture

### Chapter Template
```markdown
---
title: Chapter Title
description: One-line description
chapter: N
---

# Chapter Title

[Introduction paragraph]

## Section Heading

### Subsection

[Content]

## Conclusions

[Key takeaways]
```

## Technical Standards (2025-2026)

- **Solidity**: 0.8.26+
- **TypeScript**: Default (not JavaScript)
- **Libraries**: viem/wagmi (not ethers.js v5)
- **Testing**: Foundry (primary), Hardhat (secondary)
- **Package manager**: pnpm preferred

### Ethereum Updates
- **Pectra** (2024-2025): EIP-7702 native account abstraction
- **Dencun** (March 2024): EIP-4844 blob transactions

### Ethereum Classic Updates
- **Olympia** (2025): EIP-1559 with treasury (ECIP-1111 through ECIP-1121)
- BASEFEE goes to treasury (not burned)
- New opcodes: PUSH0, MCOPY, TLOAD/TSTORE

## Key Files

- **Chapters**: `content/chapters/XX-name.mdx`
- **Appendices**: `content/appendices/X-name.mdx`
- **Chapter index**: `content/chapters/_index.json`
- **Comprehensive plan**: `/home/dev/.claude/plans/composed-spinning-tome.md`

## Task Patterns

### Adding a New Chapter
1. Read existing chapters to understand style
2. Create MDX file in `content/chapters/`
3. Update `content/chapters/_index.json`
4. Include evolution narrative if applicable
5. Add developer lessons throughout

### Updating Existing Content
1. Read the chapter first
2. Check for cross-references to other chapters
3. Update with current (2025-2026) information
4. Verify code examples compile with modern tooling

### Researching Topics
For open-ended exploration, prefer using specialized agents:
- Use Explore agent for codebase questions
- Use Plan agent for implementation planning
- Check existing content before adding new material

## DO NOT

- Reference `book_series/` - this directory was deleted
- Describe this as an "11-book series" - it's a single book
- Use ethers.js v5 patterns - use viem or ethers.js v6
- Write JavaScript - use TypeScript
- Reference SERIES_MAPPING.md, BOOK_PLAN.md, or similar - these don't exist
