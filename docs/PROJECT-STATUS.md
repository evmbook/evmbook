# Mastering EVM (2025 Edition) - Project Status

**Last Updated:** 2026-01-27
**Book Status:** Content Complete - Historical Accuracy Verification in Progress

## Related Docs
- [MILESTONES.md](MILESTONES.md) - Phase tracking and research logs
- [DESIGN-SYSTEM.md](DESIGN-SYSTEM.md) - Diagram specs, colors, typography

---

## Current Work: Historical Accuracy Fixes

Two corrections identified from web research:

| File | Issue | Fix |
|------|-------|-----|
| `22-oracles.mdx` | Chainlink timeline unclear | Add "(whitepaper 2017, network 2019)" |
| `23-layer2-solutions.mdx` | Raiden "launched 2020" incorrect | Change to "started 2015, POC 2016" |

See [MILESTONES.md](MILESTONES.md) for full research log.

---

## Project Phases

| Phase | Status | Description |
|-------|--------|-------------|
| Phase 0 | Complete | Repository cleanup |
| Phase 1-4 | Complete | Content writing |
| Phase 5 | Complete | Polish & technical updates |
| Phase 6 | Complete | Chapter review & expansion |
| Phase 7 | Complete | 2025 Edition deep review |
| Phase 8A | Complete | Core file updates |
| Phase 8B | Complete | Publishing infrastructure |
| Phase 8C | Complete | Code examples (24 Solidity files) |
| Phase 9 | Complete | Elevated 7 existing diagrams |
| Phase 10 | Complete | Embedded all diagrams in chapters |
| Phase 11 | Complete | Created 8 new diagrams |
| Phase 12 | Complete | Linked code examples to chapters |
| **Phase 13** | **Complete** | Multi-chain terminology + Ch20 enhancement |
| Phase 14 | Ready | PDF/EPUB build |
| Phase 15 | Pending | Distribution (ISBN, KDP, release) |

---

## Book Structure

### Chapters (28 total)

| Part | Chapters | Focus |
|------|----------|-------|
| I: Landscape | 0-3 | Preface, EVM today, history (1976-2026), environment setup |
| II: Foundations | 4-7 | Cryptography, accounts, transactions, consensus |
| III: Development | 8-12 | Solidity, advanced patterns, security, testing, deployment |
| IV: Internals | 13-14 | EVM opcodes, gas optimization |
| V: Applications | 15-22 | Tokens, AMMs, lending, governance, NFTs, launchpads, prediction markets, oracles |
| VI: Scaling | 23-24 | Layer 2, zero-knowledge |
| VII: Real World | 25-27 | Regulatory, bootstrapping ecosystems, agentic development |

### Appendices (8 total)

- A: Fork History
- B: EIP Standards Reference
- C: Opcode Reference
- D: Development Tools
- E: Glossary
- F: Regulatory Timeline
- G: Key Figures
- H: Essential Reading

---

## Diagrams (15 total)

All diagrams redesigned with publisher-quality styling.

| Diagram | Chapter | Status |
|---------|---------|--------|
| ch01-evm-landscape.svg | 01 | Complete |
| ch04-cryptography-flow.svg | 04 | Complete |
| ch05-account-model.svg | 05 | Complete |
| ch06-transaction-flow.svg | 06 | Complete |
| ch07-pow-vs-pos.svg | 07 | Complete |
| ch09-proxy-patterns.svg | 09 | Complete |
| ch13-evm-architecture.svg | 13 | Complete |
| ch14-gas-cost-hierarchy.svg | 14 | Complete |
| ch16-amm-evolution.svg | 16 | Complete |
| ch17-lending-protocol.svg | 17 | Complete |
| ch18-dao-governance.svg | 18 | Complete |
| ch22-oracle-architecture.svg | 22 | Complete |
| ch23-l2-architecture.svg | 23 | Complete |
| ch24-zk-proof-flow.svg | 24 | Complete |
| ch26-dependency-tree.svg | 26 | Complete |

---

## Publishing Details

**Title:** Mastering EVM (2025 Edition)
**Author:** Christopher Mercer
**Publisher:** White B0x Inc.
**Version:** 2025.1.0

### ISBNs (Allocated)

| Format | ISBN |
|--------|------|
| Paperback | 979-8-9947278-0-5 |
| EPUB | 979-8-9947278-1-2 |
| Audiobook | 979-8-9947278-2-9 |

### Pricing

| Format | Price |
|--------|-------|
| PDF | Free |
| EPUB | Free |
| Web | Free |
| Kindle | $9.99 |
| Paperback | $49.99 |

### Print Specifications

| Spec | Value |
|------|-------|
| Trim Size | 7.5 x 9.25 inches |
| Page Count | ~600 |
| Paper | 60# white offset |
| Binding | Perfect bound paperback |
| Cover | Matte laminated |

---

## Key Design Principles

1. **Fresh Identity**: "Mastering EVM" (2025), not "Mastering Ethereum Updated"
2. **Evolution Narratives**: Show how each primitive developed
3. **Dependency Trees**: Help developers understand what builds on what
4. **Practical Focus**: Every historical section ends with "what this means for builders"
5. **Bootstrap Guide**: Enable developers to build ecosystems on new EVM chains
6. **Dual-Chain**: Maintain ETH + ETC perspective where relevant
7. **Ethics & Accountability**: Teach developers to market their systems accurately
8. **Current Through 2026**: No content gap after 2022

---

## Mercer Quote (Book's Philosophical Foundation)

> "Decentralization flows down, never up. A centralized foundation guarantees centralized outcomes."
>
> — Christopher Mercer

Opens Chapter 1, setting the tone for the entire book.
