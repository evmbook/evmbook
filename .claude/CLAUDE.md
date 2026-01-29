# Claude Code Instructions for evmbook-v2025

## Project Overview

This repository contains **Mastering EVM (2025 Edition)**—a comprehensive single-volume book (28 chapters) covering EVM development from cryptographic foundations through modern agentic development.

**This is the source of truth.** The companion website (evmbook-site) pulls content from here.

## Repository Structure

```
evmbook-v2025/
├── content/                        # Book source content (MDX)
│   ├── chapters/                   # 28 chapters (00-preface through 27-agentic)
│   ├── appendices/                 # 8 appendices (A-H)
│   └── meta/                       # About, colophon
├── manuscript/                     # Era-based historical chapters (13 chapters)
│   └── chapters/                   # Era 0-12 (~6,600 lines total)
├── primitives/                     # Research dossiers (27 primitives, ~49K words)
├── sources/                        # BibTeX library (319 entries)
├── history/                        # ERA_MAP.md, CLAIMS_LEDGER.md
├── docs/                           # Project documentation (SINGLE SOURCE OF TRUTH)
├── notes/                          # Session-specific working files only
├── .claude/                        # Agent instructions (this file)
├── .archive/                       # Superseded content (reference only)
├── code/                           # Code examples (24 Solidity files)
├── images/                         # Diagrams (18 SVGs)
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

- `library.bib` — 319 BibTeX entries
- `source_index.md` — Human-readable source index with credibility tiers

### History (`history/`)

- `ERA_MAP.md` — 13 eras with 5 parallel tracks
- `CLAIMS_LEDGER.md` — 150 verified claims with confidence levels

## Project Documentation

All project docs are in `docs/` as **single sources of truth**:

| File | Purpose |
|------|---------|
| `PROJECT-STATUS.md` | Master status, phases, next steps, research log |
| `KNOWN-GAPS.md` | Research gaps, unverified claims, future work |
| `DESIGN-SYSTEM.md` | Diagram specs, colors, typography |
| `RESEARCH_SYSTEM.md` | Citation rules, confidence tagging |
| `STYLE_GUIDE.md` | Voice, naming, controversy handling |

**Read `docs/PROJECT-STATUS.md` first** when starting a new session.

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
4. Flag uncertainties in `docs/KNOWN-GAPS.md`
5. Follow citation format in `docs/RESEARCH_SYSTEM.md`

### After Completing Tasks
**IMPORTANT:** Update project documentation when work is complete:

1. **`docs/PROJECT-STATUS.md`** — Single source of truth
   - Update phase status in the table
   - Keep "Next Steps" section current
   - Add entries to "Research Log" section
   - Update "Last Updated" date

2. **`docs/KNOWN-GAPS.md`** — Research gaps
   - Move resolved items to "Resolved Items" section
   - Add any new gaps discovered during work

3. **Archive session plans** — When done with major planning sessions
   - Move completed plans to `.archive/notes-YYYY-MM-DD/`
   - Keep `notes/` clean for active work only

This ensures project documentation stays current and actionable.

## Best Practices for Agentic Documentation

1. **Single source of truth** — One file per concern (status, gaps, style)
2. **docs/ for stable docs** — Reference documentation that persists
3. **notes/ for session work** — Temporary files, archive when done
4. **Archive, don't delete** — Move completed plans to `.archive/`
5. **Update status immediately** — Mark tasks done as you complete them
6. **Cross-reference** — Link related docs, don't duplicate content

## Website Alignment (evmbook-site)

The companion website at masteringevm.com pulls content from this repository. **This repo is the authoritative source of truth for all website content.**

### What the Website Syncs

| Book Repo | Website Repo | Purpose |
|-----------|--------------|---------|
| `content/chapters/*.mdx` | `content/chapters/` | 28 chapter pages |
| `content/appendices/*.mdx` | `content/appendices/` | 8 appendix pages |
| `content/chapters/_index.json` | `content/chapters/` | Canonical TOC |
| `code/` | `content/code/` | Code Library (`/read/code`) |
| `images/diagrams/*.svg` | `public/images/diagrams/` | Diagram gallery (`/read/diagrams`) |

### After Updating Book Content

When chapters, appendices, code, or diagrams change, sync to the website:

```bash
cd ../evmbook-site
cp -r ../evmbook-v2025/content/chapters/*.mdx content/chapters/
cp ../evmbook-v2025/content/chapters/_index.json content/chapters/
cp -r ../evmbook-v2025/content/appendices/*.mdx content/appendices/
cp -r ../evmbook-v2025/code/* content/code/
cp ../evmbook-v2025/images/diagrams/*.svg public/images/diagrams/
```

Then update website navigation:
1. `src/components/layout/Sidebar.tsx` — Match `_index.json`
2. `src/components/layout/Footer.tsx` — Update counts
3. `public/sitemap.xml` — Regenerate URLs

### Website Anti-Regression Checks

Before deploying the website, verify:
- [ ] 28 chapters present and match book
- [ ] 8 appendices present and match book
- [ ] Sidebar.tsx lists all chapters/appendices + Resources section
- [ ] `npm run build` succeeds with no 404s
- [ ] Code Library works at `/read/code`
- [ ] Diagrams render at `/read/diagrams` (all 18 SVGs)

### Brand Guidelines
- Author: Christopher Mercer with Claude (Anthropic)
- Publisher: White B0x Inc.
- License: CC BY-NC 4.0
- Voice: Calm, systems-oriented, grounded, no hype

## DO NOT

- Reference `book_series/` - this directory was deleted
- Describe this as an "11-book series" - it's a single book
- Use ethers.js v5 patterns - use viem or ethers.js v6
- Write JavaScript - use TypeScript
- Create duplicate tracking files - use existing docs in `docs/`
- Leave stale plans in `notes/` - archive completed work
- Invent author credentials not in the back cover copy
- Use derivative attribution to Antonopoulos/Wood
