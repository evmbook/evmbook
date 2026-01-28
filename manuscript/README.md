# Manuscript Organization

This directory contains the era-based historical chapters that complement the existing book content.

## Purpose

While the main `content/chapters/` contains the technical book content (28 chapters covering EVM development), this `manuscript/` directory provides deeper historical research for each era of protocol development.

## Relationship to Main Book

| Main Book | Manuscript |
|-----------|------------|
| `content/chapters/02-how-we-got-here.mdx` | Expanded era chapters here |
| `content/appendices/g-key-figures.mdx` | Cross-referenced |
| `content/appendices/h-essential-reading.mdx` | Citations formalized in `sources/library.bib` |

## Chapter Structure

Each era chapter follows the template:

1. **Overview** — Why this era matters
2. **Key Developments** — Major events and artifacts
3. **Key Figures** — People who shaped the era
4. **Technical Contributions** — Primitives introduced
5. **Common Misattributions** — Corrections to folk history
6. **EVM Relevance** — How this era connects to modern EVM development
7. **Primitive Cross-Links** — References to dossiers in `primitives/`
8. **Citations** — Using BibTeX keys from `sources/library.bib`

## Era Mapping

All 13 chapters are complete with consistent structure (Timeline, Open Questions, Bridge sections).

| Chapter | Era | Period | Focus | Status |
|---------|-----|--------|-------|--------|
| 01 | 0 | Pre-1900 | Ancient cryptography | ✅ Complete |
| 02 | 1 | 1900-1945 | Enigma, Turing, early computing | ✅ Complete |
| 03 | 2 | 1945-1975 | Shannon, information theory | ✅ Complete |
| 04 | 3 | 1976-1990 | Public key revolution | ✅ Complete |
| 05 | 4 | 1990-2008 | Cypherpunks, P2P, digital cash | ✅ Complete |
| 06 | 5 | 2008-2013 | Bitcoin birth | ✅ Complete |
| 07 | 6 | 2013-2017 | Ethereum launch | ✅ Complete |
| 08 | 7 | 2017-2019 | ICO boom, DeFi foundations | ✅ Complete |
| 09 | 8 | 2020 | DeFi Summer | ✅ Complete |
| 10 | 9 | 2021 | L2s, NFTs, institutional | ✅ Complete |
| 11 | 10 | 2022 | Collapses, The Merge | ✅ Complete |
| 12 | 11 | 2023-2024 | Recovery, ETFs, EIP-4844 | ✅ Complete |
| 13 | 12 | 2025+ | Current state | ✅ Complete |

**Total:** ~6,600 lines across 13 chapters

## Chapter Structure

All chapters follow a consistent template:

1. **Overview** — Why this era matters
2. **Timeline of Key Events** — Table format with dates
3. **Key Developments** — Major events and artifacts
4. **Key Figures** — People who shaped the era
5. **Technical Contributions** — Primitives introduced
6. **Common Misattributions** — Corrections to folk history
7. **Open Questions** — Unresolved issues
8. **EVM Relevance** — How this era connects to modern EVM development
9. **Bridge to Next Era** — Transitions (or "Looking Forward" for Era 12)
10. **Primitive Cross-Links** — References to dossiers in `primitives/`
11. **Citations** — Using BibTeX keys from `sources/library.bib`

## Cross-References

- **Primitive Dossiers**: `../primitives/` — Deep dives on specific technologies
- **Era Map**: `../history/ERA_MAP.md` — Timeline overview
- **Claims Ledger**: `../history/CLAIMS_LEDGER.md` — Verified claims with sources
- **BibTeX Library**: `../sources/library.bib` — All citations

## Citation Format

All chapters use BibTeX keys:
```markdown
The Byzantine Generals Problem was formalized in 1982 [@article_lamport_byzantine_1982].
```

See `../docs/RESEARCH_SYSTEM.md` for full citation rules.
