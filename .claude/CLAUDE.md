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
├── manuscript/                     # Era-based historical chapters (13 chapters)
│   └── chapters/                   # Era 0-12 (~6,600 lines total)
├── primitives/                     # Research dossiers (27 primitives, ~42K words)
├── sources/                        # BibTeX library (100+ entries)
├── history/                        # ERA_MAP.md, CLAIMS_LEDGER.md
├── docs/                           # Project documentation
├── notes/                          # Research notes and gaps
├── .claude/                        # Agent instructions (this file)
├── .archive/                       # Superseded content (reference only)
│   └── old-chapters/               # Previous chapter versions
├── code/                           # Code examples (24 Solidity files)
├── images/                         # Diagrams (15 SVGs)
└── scripts/                        # Build scripts
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

## Research Infrastructure

The repository includes a parallel research infrastructure for historical accuracy verification:

### Manuscript Chapters (`manuscript/`)

13 era-based historical chapters (Era 0-12) covering crypto history from ancient cryptography to 2025. All chapters follow consistent structure:
- Timeline of Key Events (table format)
- Open Questions section
- Bridge to Next Era section (or "Looking Forward" for Era 12)

### Primitive Dossiers (`primitives/`)

27 research dossiers covering specific technologies:
- AMM, PoW, BFT, PKC, Merkle trees, Smart contracts
- Fee markets, MEV, L2 rollups, Stablecoins
- ZK proofs, Privacy protocols, Oracles, Governance
- Token standards, Identity, DePIN, Restaking, Cross-chain

### Sources (`sources/`)

- `library.bib` — 100+ BibTeX entries
- `source_index.md` — Human-readable source index with credibility tiers

### History (`history/`)

- `ERA_MAP.md` — 13 eras with 5 parallel tracks
- `CLAIMS_LEDGER.md` — 80+ verified claims with confidence levels

## Project Documentation

All project docs are self-contained in `docs/`:
- **`docs/PROJECT-STATUS.md`** - Current status, next steps, book structure
- **`docs/MILESTONES.md`** - Phase tracking, research logs
- **`docs/DESIGN-SYSTEM.md`** - Diagram specs, colors, typography
- **`docs/RESEARCH_SYSTEM.md`** - Citation rules, confidence tagging
- **`docs/STYLE_GUIDE.md`** - Voice, naming, controversy handling

**Read these docs first** when starting a new session.

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

### Working with Research Infrastructure
1. Check `primitives/` for existing dossiers on the topic
2. Use BibTeX keys from `sources/library.bib` for citations: `[@key]`
3. Add new claims to `history/CLAIMS_LEDGER.md` with confidence levels
4. Flag uncertainties in `notes/known_gaps.md`
5. Follow citation format in `docs/RESEARCH_SYSTEM.md`

### After Completing Tasks
**IMPORTANT:** Update project documentation when work is complete:

1. **`docs/PROJECT-STATUS.md`** — Main status file
   - Update phase status in the table
   - Keep "Next Steps" section current
   - Update "Last Updated" date

2. **`docs/MILESTONES.md`** — Phase tracking
   - Move completed phases to "Completed Phases" table
   - Update "Current Phase" section
   - Keep research log accurate

3. **`notes/known_gaps.md`** — Research gaps
   - Check off resolved items in Action Items
   - Remove or archive completed sections
   - Add any new gaps discovered

4. **`notes/plan.md`** — Research priorities
   - Update phase completion status
   - Move completed items to done
   - Adjust priorities as needed

This ensures project documentation stays current and actionable.

## DO NOT

- Reference `book_series/` - this directory was deleted
- Describe this as an "11-book series" - it's a single book
- Use ethers.js v5 patterns - use viem or ethers.js v6
- Write JavaScript - use TypeScript
- Reference external plan files - all docs are in `docs/`
