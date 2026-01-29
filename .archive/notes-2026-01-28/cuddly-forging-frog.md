# Implementation Plan: Mastering EVM Research Infrastructure

## Overview

Create a parallel research infrastructure for the "Mastering EVM" book to support historical accuracy verification and attribution auditing. The existing book has 28 chapters + 8 appendices with strong content but gaps in formal citations and some attribution issues.

**Phase 1-3 Status: ✅ COMPLETE**
**Phase 4: Book Integration** — Apply research to actual book chapters

---

## Current State Assessment (VERIFIED January 2026)

### Research Infrastructure
- **27 primitive dossiers** in `/primitives/` (~42,000+ words):
  - amm_constant_product, byzantine_fault_tolerance, communication_privacy_tools
  - **cross_chain_interoperability** ✅, decentralized_oracles, defi_derivatives
  - defi_lending, depin_and_physical_infra, fee_markets_eip1559
  - funding_and_economics, governance_and_daos, hash_functions_and_merkle
  - identity_and_naming, international_adoption, l2_rollups_and_data_availability
  - mev_and_auctions, mining_and_hardware, node_software_primitives
  - privacy_protocols, proof_of_work, public_key_crypto
  - **restaking** ✅, rwa_tokenization, smart_contracts_and_vms
  - stablecoins_and_collateral, token_standards_evolution, zero_knowledge_proofs
- **319 BibTeX references** in `sources/library.bib` (expanded from original 66)
- **ERA_MAP** covering 13 eras with 5 parallel tracks
- **CLAIMS_LEDGER** with documented claims
- **Source index** with credibility tiers
- **13 manuscript chapters** in `/manuscript/chapters/`

### Book Content
- **28 chapters** in `/content/chapters/`
- **Recently enhanced** (January 2026):
  - Ch 23: L2 taxonomy (rollups, validiums, optimiums, sidechains)
  - Inline citation cleanup across multiple chapters
- **Strong coverage**: Foundations (Ch 0-6), DeFi (Ch 15-21), L2s (Ch 23)

### Previously "Future" Items — NOW COMPLETE
- ✅ Cross-chain interoperability primitive
- ✅ Restaking primitive (Eigenlayer paradigm)
- ✅ BibTeX library expanded (66 → 319 entries)

---

## CURRENT TASK: Ch 23 L2 Taxonomy Refinement

### Research Finding: Sidechain vs Independent L1 Distinction

**Key insight**: There is NO technical/architectural difference between a sidechain and an independent L1. Both have own validators, consensus, and security. The distinction is **conceptual**:

| Criterion | Sidechain | Independent L1 |
|-----------|-----------|----------------|
| **Design intent** | Built to scale/extend another chain | Built as standalone platform |
| **Canonical relationship** | Official bridge + checkpoints to "parent" | Bridges exist but no "parent" |
| **Ecosystem positioning** | Markets as "scaling solution" | Markets as independent chain |

**Classification of major chains:**

| Chain | Classification | Consensus | Unique Position |
|-------|----------------|-----------|-----------------|
| **Ethereum Classic (ETC)** | Independent L1 | PoW | **Leading PoW EVM** (genesis chain) |
| **Ethereum (ETH)** | Independent L1 | PoS | **Leading PoS EVM** (forked 2016) |
| **Gnosis Chain** | Sidechain | PoS (was PoA) | Ethereum sidechain (formerly xDai) |
| **Polygon PoS** | Sidechain | PoS | Ethereum scaling solution |
| **BSC** | Independent L1 | PoSA | Standalone platform |
| **Avalanche C-Chain** | Independent L1 | Avalanche | Standalone platform |

**Why ETH is NOT a sidechain of ETC:**
- Fork was philosophical (The DAO), not to "scale"
- No canonical bridge or checkpoint relationship
- Operates as completely independent network

**Why Polygon PoS IS a sidechain:**
- Designed explicitly as Ethereum scaling solution
- Canonical bridge with Ethereum
- Commits checkpoints to Ethereum every ~30 min
- Markets as Ethereum L2/scaling (even though technically not L2)

### Changes to Make in Chapter 23

**File**: `content/chapters/23-layer2-solutions.mdx`

1. **Add new subsection**: "Sidechain vs Independent L1: The Real Distinction"
   - Explain that the distinction is conceptual, not technical
   - Criteria: design intent, canonical relationship, ecosystem positioning
   - Why ETH/ETC are both independent L1s despite shared genesis

2. **Update "Independent L1s Marketed as L2s" table**:
   - Add Gnosis Chain (PoS, was PoA) as sidechain
   - Separate into two tables: Sidechains vs Independent L1s
   - Highlight ETC as leading PoW L1 EVM
   - Highlight ETH as leading PoS L1 EVM

3. **Add callout on consensus diversity**:
   - ETC = PoW (original Ethereum consensus)
   - ETH = PoS (post-Merge)
   - Gnosis Chain = PoS (upgraded from PoA)
   - These represent the flagship implementations of each consensus type

### Verification
- Confirm Gnosis Chain is now PoS (user confirmed, formerly xDai PoA)
- Ensure distinction is clear: technical vs conceptual
- Cross-reference with Chapter 7 (Consensus) for consistency

---

## Phase 4: Book Integration Plan

### Strategy: Priority-Based Chapter Expansion

Expand underdeveloped chapters using research primitives as source material, adapting content to book style (MDX format, code examples, Callout components).

### Priority Tiers

**TIER 1: Critical Gaps (Sessions 1-3)**

| Chapter | Current | Target | Primary Primitives |
|---------|---------|--------|-------------------|
| Ch 24: Zero-Knowledge | 1,462 words | 3,500+ | `zero_knowledge_proofs.md`, `privacy_protocols.md` |
| Ch 22: Oracles | 2,222 words | 4,000+ | `decentralized_oracles.md`, `mev_and_auctions.md` |
| Ch 07: Consensus | 2,158 words | 3,500+ | `proof_of_work.md`, `byzantine_fault_tolerance.md`, `restaking.md` |

**TIER 2: Significant Gaps (Sessions 4-6)**

| Chapter | Current | Target | Primary Primitives |
|---------|---------|--------|-------------------|
| Ch 23: Layer 2 | 3,134 words | 5,000+ | `l2_rollups_and_data_availability.md`, `zero_knowledge_proofs.md` |
| Ch 16: AMMs | 3,405 words | 4,500+ | `amm_constant_product.md`, `defi_derivatives.md` |
| Ch 17: Lending | 3,567 words | 4,500+ | `defi_lending.md`, `stablecoins_and_collateral.md` |

**TIER 3: Enhancement (Sessions 7+)**

| Chapter | Current | Target | Primary Primitives |
|---------|---------|--------|-------------------|
| Ch 18: Governance | 2,162 words | 3,000+ | `governance_and_daos.md` |
| Ch 15: Tokens | 3,789 words | 4,500+ | `token_standards_evolution.md`, `rwa_tokenization.md` |
| Ch 13: EVM Internals | 2,035 words | 3,000+ | `smart_contracts_and_vms.md` |

### Integration Workflow (Per Chapter)

```
1. READ current chapter thoroughly
2. IDENTIFY gaps vs corresponding primitive(s)
3. EXTRACT relevant content from primitives
4. ADAPT to MDX format:
   - Add <Callout>, <Note>, <Tip> components
   - Include code examples with language tags
   - Create comparison tables
   - Add ASCII diagrams where helpful
5. ADD citations from library.bib ([@key] format)
6. VERIFY technical accuracy
7. UPDATE cross-references to other chapters
```

### Chapter-Primitive Mapping

| Chapter | Primary Primitives | Secondary Primitives |
|---------|-------------------|---------------------|
| Ch 02: History | `ERA_MAP.md`, all foundational | `international_adoption.md` |
| Ch 04: Cryptography | `public_key_crypto.md`, `hash_functions_and_merkle.md` | — |
| Ch 07: Consensus | `proof_of_work.md`, `byzantine_fault_tolerance.md` | `restaking.md` |
| Ch 13: EVM Internals | `smart_contracts_and_vms.md` | `fee_markets_eip1559.md` |
| Ch 15: Tokens | `token_standards_evolution.md` | `rwa_tokenization.md` |
| Ch 16: AMMs | `amm_constant_product.md` | `mev_and_auctions.md`, `defi_derivatives.md` |
| Ch 17: Lending | `defi_lending.md`, `stablecoins_and_collateral.md` | `rwa_tokenization.md` |
| Ch 18: Governance | `governance_and_daos.md` | `funding_and_economics.md` |
| Ch 21: Prediction Markets | `amm_constant_product.md` (LMSR lineage) | `decentralized_oracles.md` |
| Ch 22: Oracles | `decentralized_oracles.md` | `mev_and_auctions.md` |
| Ch 23: Layer 2 | `l2_rollups_and_data_availability.md` | `cross_chain_interoperability.md` |
| Ch 24: Zero-Knowledge | `zero_knowledge_proofs.md`, `privacy_protocols.md` | `communication_privacy_tools.md` |
| Ch 25: Regulatory | `privacy_protocols.md` (Tornado Cash) | `international_adoption.md` |

### Expected Outcomes

| Metric | Before | After |
|--------|--------|-------|
| Total book words | ~20,000 | ~30,000+ |
| Chapters with citations | ~3 | ~15+ |
| Critical gaps filled | 0/4 | 4/4 |
| Average chapter words | ~715 | ~1,100+ |

### Verification Checklist

For each integrated chapter:
- [ ] Word count increased by target amount
- [ ] Citations added from library.bib
- [ ] Code examples compile (if any)
- [ ] Cross-references to other chapters work
- [ ] MDX components render correctly
- [ ] No orphaned content from primitives

---

## Phase 2-3: Research Expansion (COMPLETE)

---

## Phase 1 Accomplishments (Complete)

- ✅ Foundation docs (RESEARCH_SYSTEM.md, STYLE_GUIDE.md)
- ✅ BibTeX library with 66 entries
- ✅ Source index with credibility tiers
- ✅ ERA_MAP covering 13 eras with 5 parallel tracks
- ✅ CLAIMS_LEDGER with 50 documented claims
- ✅ 10 primitive dossiers (AMM, PoW, BFT, PKC, Merkle, Smart Contracts, EIP-1559, MEV, L2, Stablecoins)
- ✅ 13 manuscript chapters (3 complete, 10 skeletons)
- ✅ Notes (plan.md, known_gaps.md)

---

## Phase 2: Expansion Plan

### Gap Analysis (from Codex Series Data Dump)

**Protocol Dependencies Tier Model** identifies gaps in our coverage:

| Tier | Category | Current Status | Action Needed |
|------|----------|----------------|---------------|
| 0 | Pre-EVM Foundations | ✅ Complete | — |
| 1 | EVM Core | ✅ Complete | — |
| 2 | Token Standards | ⚠️ Partial | New primitive needed |
| 3 | Oracle Layer | ❌ Missing | New primitive needed |
| 4 | DeFi Primitives | ✅ AMM covered | Expand lending/derivatives |
| 5 | Governance | ❌ Missing | New primitive needed |
| 6 | Scaling | ✅ L2 covered | — |
| 7 | Indexing | ❌ Missing | Research topic |
| 8 | Identity | ❌ Missing | New primitive needed |
| 9 | Privacy | ❌ Missing | New primitive needed |
| 10 | Security Tooling | ⚠️ Partial | Expand coverage |

**Key gaps to address:**
- Chapter 07 (Consensus) poorly attributed - missing Lamport, Satoshi, Back citations
- DeFi chapters (15-22) lack academic/economic precursors
- No BibTeX library or formal citation infrastructure
- Folk attributions (e.g., constant product AMM only credited to Uniswap)

---

## Deliverables Structure

```
evmbook-v1/
├── docs/
│   ├── RESEARCH_SYSTEM.md        # Citation rules, confidence tagging
│   └── STYLE_GUIDE.md            # Voice, naming, dates, controversies
├── sources/
│   ├── README.md                 # How sources are stored
│   ├── library.bib               # BibTeX library (50+ entries)
│   └── source_index.md           # Human-readable index
├── history/
│   ├── ERA_MAP.md                # 13 eras (0-12) with citations
│   └── CLAIMS_LEDGER.md          # 30+ claims with confidence levels
├── primitives/
│   ├── amm_constant_product.md   # PRIORITY - needs economic precursors
│   ├── hash_functions_and_merkle.md
│   ├── public_key_crypto.md
│   ├── byzantine_fault_tolerance.md
│   ├── proof_of_work.md
│   ├── smart_contracts_and_vms.md
│   ├── fee_markets_eip1559.md
│   ├── mev_and_auctions.md
│   ├── l2_rollups_and_data_availability.md
│   └── stablecoins_and_collateral.md
├── manuscript/
│   ├── README.md
│   ├── outline.md
│   └── chapters/
│       ├── 01_era0_pre1900.md
│       ├── 02_era1_1900_1945.md
│       ├── 03_era2_1945_1975.md
│       ├── 04_era3_1976_1990.md      # PRIORITY - crypto toolkit
│       ├── 05_era4_1990_2008.md      # PRIORITY - cypherpunks
│       ├── 06_era5_2008_2013.md
│       ├── 07_era6_2013_2017.md
│       ├── 08_era7_2017_2019.md
│       ├── 09_era8_2020.md           # PRIORITY - DeFi Summer
│       ├── 10_era9_2021.md
│       ├── 11_era10_2022.md
│       ├── 12_era11_2023_2024.md
│       └── 13_era12_2025.md
└── notes/
    ├── plan.md
    └── known_gaps.md
```

---

## Implementation Phases

### Phase 1: Foundation Documents (Parallel)
Create citation rules and style guides that all other files will follow.

**Files:**
- `docs/RESEARCH_SYSTEM.md` (~500 words)
  - Citation format: `[@key_year]` BibTeX style
  - Confidence levels: HIGH / MEDIUM / LOW / CONTESTED
  - Primary vs secondary source rules
  - Verification workflow

- `docs/STYLE_GUIDE.md` (~800 words)
  - Voice: Neutral, academic but accessible
  - Date formats: "Month Year" for events, "YYYY" for papers
  - Controversy handling: Present multiple perspectives
  - Naming conventions for protocols/people

- `sources/README.md` (~300 words)
  - BibTeX format explanation
  - Source credibility criteria
  - How to add new sources

### Phase 2: BibTeX Library (Sequential)
Build the formal citation library, extracting from existing Appendix G (Key Figures) and Appendix H (Essential Reading).

**File:** `sources/library.bib` (~50-70 entries)

**Key entries by era:**
- Era 0-2: Shannon (1948), cryptographic prehistory
- Era 3: Diffie-Hellman (1976), RSA (1978), Merkle (1979), Lamport (1982)
- Era 4: Chaum (1982), Back (1997/2002), Dai (1998), Szabo (1998), Finney (2004)
- Era 5: Nakamoto (2008)
- Era 6: Buterin (2013), Wood (2014)
- Era 7-12: DeFi papers, EIPs, L2 research

**Sources to leverage:**
- `content/appendices/appendix-g-key-figures.mdx` - 20 figures with dates/works
- `content/appendices/appendix-h-essential-reading.mdx` - ~60 resources

### Phase 3: Source Index and Era Map (Parallel)

**File:** `sources/source_index.md` (~2000 words)
- Human-readable table of all sources
- Credibility notes for each
- Where used in the book

**File:** `history/ERA_MAP.md` (~4000 words)
- 13 sections (Era 0-12)
- Each section includes:
  - Key primitives introduced
  - Key artifacts (papers, systems)
  - EVM relevance linkages
  - 5-15 citations per era

**Source to leverage:**
- `content/chapters/02-how-we-got-here.mdx` - existing timeline

### Phase 4: Primitive Dossiers (Parallel - 10 files)

Each dossier (~1500 words) contains:
1. Definition
2. Precursor lineage
3. First formalization (paper/book)
4. First deployment (system)
5. Crypto adoption timeline
6. Common misattributions
7. Open questions
8. Citations

**Priority order:**

1. **`amm_constant_product.md`** (HIGHEST)
   - Key misattribution: Uniswap credited alone, missing Hanson LMSR (2003), Bancor (2017)
   - Sources: Hanson (2003), Bancor whitepaper (2017), Adams blog (2018)

2. **`proof_of_work.md`**
   - Key misattribution: Often only Bitcoin, missing Dwork/Naor (1992), Back (1997)

3. **`byzantine_fault_tolerance.md`**
   - Key gap: Chapter 07 doesn't cite Lamport (1982) or PBFT (1999)

4. **`public_key_crypto.md`**
   - Note: GCHQ independent discovery often omitted

5. **`hash_functions_and_merkle.md`**
6. **`smart_contracts_and_vms.md`**
7. **`fee_markets_eip1559.md`**
8. **`mev_and_auctions.md`**
9. **`l2_rollups_and_data_availability.md`**
10. **`stablecoins_and_collateral.md`**

### Phase 5: Claims Ledger (Sequential)

**File:** `history/CLAIMS_LEDGER.md` (~2000 words)

Table format with 30+ high-value claims:
| ID | Claim | Era | Confidence | Source(s) | Notes |
|----|-------|-----|------------|-----------|-------|

Example claims:
- "Satoshi synthesized existing primitives rather than inventing new cryptography" (HIGH)
- "Constant product formula predates Uniswap in academic literature" (MEDIUM)
- "EIP-1559 improves UX but doesn't reduce average fees" (HIGH)

### Phase 6: Manuscript Scaffolding (Parallel)

**Files:**
- `manuscript/README.md` (~300 words) - organization guide
- `manuscript/outline.md` (~800 words) - chapter summaries
- 13 era chapter files

**3 Priority chapters with real content (~1000 words each):**

1. **`04_era3_1976_1990.md`** - Cryptographic Toolkit
   - Why: Foundation for everything; addresses Chapter 07 gaps
   - Covers: Diffie-Hellman, RSA, Merkle trees, Byzantine Generals

2. **`05_era4_1990_2008.md`** - Cypherpunk Digital Cash
   - Why: Most commonly misattributed era; direct Bitcoin precursors
   - Covers: Chaum, Hashcash, b-money, bit gold, RPOW

3. **`09_era8_2020.md`** - DeFi Summer
   - Why: Addresses AMM attribution gaps; connects theory to deployment
   - Covers: Compound, Uniswap V2, yield farming, AMM evolution

### Phase 7: Notes (Final)

**Files:**
- `notes/plan.md` - justification for era chapter priorities
- `notes/known_gaps.md` - unconfirmed claims, low confidence items, follow-up needed

---

## Key Sources to Reference During Implementation

| File | Purpose |
|------|---------|
| `content/appendices/appendix-g-key-figures.mdx` | Extract 20 figures for BibTeX |
| `content/appendices/appendix-h-essential-reading.mdx` | Convert ~60 resources to BibTeX |
| `content/chapters/02-how-we-got-here.mdx` | Era boundaries, "Synthesis" table (lines 97-107) |
| `content/chapters/07-consensus-finality.mdx` | Target for attribution fixes |
| `content/chapters/16-amm-evolution.mdx` | Target for AMM precursor additions |

---

## AMM Constant Product Dossier Strategy (Critical)

This is the most important attribution audit item.

**Research questions:**
1. Who invented x*y=k? (Not Uniswap alone)
2. What economic precursors exist? (Market microstructure, prediction markets)
3. What's the intellectual lineage? (Hanson → Gnosis → Bancor → Uniswap)

**Key sources to include:**
- Hanson, R. (2003). "Combinatorial Information Market Design" - LMSR
- Bancor Whitepaper (2017) - bonding curves
- Adams, H. (2018). "Uniswap: A Unique Exchange" - blog post
- Garman (1976), Amihud-Mendelson (1980) - market microstructure

**Misattributions to correct:**
1. "Uniswap invented AMMs" → Bancor predates; prediction market AMMs predate crypto
2. "x*y=k is novel to DeFi" → Similar formulations in market microstructure literature

---

## Estimated Scope

| Category | Files | Words | Lines |
|----------|-------|-------|-------|
| Foundation docs | 3 | 1,600 | 250 |
| Sources | 2 + bib | 2,000 | 2,800 |
| History | 2 | 6,000 | 900 |
| Primitives | 10 | 15,000 | 2,500 |
| Manuscript | 15 | 6,100 | 1,050 |
| Notes | 2 | 1,000 | 160 |
| **Total** | **34** | **~31,700** | **~7,660** |

---

## Verification Plan

After implementation, verify:

1. **BibTeX validity**: Run `bibtex` on library.bib to check syntax
2. **Citation coverage**: Grep for `[@` in all markdown to ensure citations resolve
3. **Era completeness**: Each ERA_MAP.md section has 5-15 citations
4. **Claims ledger**: 30+ claims with sources
5. **Primitive dossiers**: Each has all 8 required sections
6. **Cross-references**: Manuscript chapters link to relevant primitive dossiers

---

## Phase 1 Files Created (34 total) ✅

```
docs/RESEARCH_SYSTEM.md ✅
docs/STYLE_GUIDE.md ✅
sources/README.md ✅
sources/library.bib ✅ (66 entries)
sources/source_index.md ✅
history/ERA_MAP.md ✅
history/CLAIMS_LEDGER.md ✅ (50 claims)
primitives/amm_constant_product.md ✅
primitives/hash_functions_and_merkle.md ✅
primitives/public_key_crypto.md ✅
primitives/byzantine_fault_tolerance.md ✅
primitives/proof_of_work.md ✅
primitives/smart_contracts_and_vms.md ✅
primitives/fee_markets_eip1559.md ✅
primitives/mev_and_auctions.md ✅
primitives/l2_rollups_and_data_availability.md ✅
primitives/stablecoins_and_collateral.md ✅
manuscript/README.md ✅
manuscript/outline.md ✅
manuscript/chapters/01_era0_pre1900.md ✅ (skeleton)
manuscript/chapters/02_era1_1900_1945.md ✅ (skeleton)
manuscript/chapters/03_era2_1945_1975.md ✅ (skeleton)
manuscript/chapters/04_era3_1976_1990.md ✅ (COMPLETE)
manuscript/chapters/05_era4_1990_2008.md ✅ (COMPLETE)
manuscript/chapters/06_era5_2008_2013.md ✅ (skeleton)
manuscript/chapters/07_era6_2013_2017.md ✅ (skeleton)
manuscript/chapters/08_era7_2017_2019.md ✅ (skeleton)
manuscript/chapters/09_era8_2020.md ✅ (COMPLETE)
manuscript/chapters/10_era9_2021.md ✅ (skeleton)
manuscript/chapters/11_era10_2022.md ✅ (skeleton)
manuscript/chapters/12_era11_2023_2024.md ✅ (skeleton)
manuscript/chapters/13_era12_2025.md ✅ (skeleton)
notes/plan.md ✅
notes/known_gaps.md ✅
```

---

## Phase 2: New Primitive Dossiers (7 files)

Based on Codex series tier model and gap analysis:

### 1. `primitives/zero_knowledge_proofs.md` (HIGH PRIORITY)

**Why**: ZK is fundamental to L2 scaling (zkSync, StarkNet, Scroll) but we have no dedicated primitive.

**Content**:
- Definition: Interactive vs non-interactive proofs
- Historical lineage: Goldwasser/Micali/Rackoff (1985) → Fiat-Shamir (1986) → Groth16 (2016) → PLONK (2019)
- Proof systems comparison: SNARKs vs STARKs vs Bulletproofs
- EVM relevance: zk-EVMs, privacy, scalability
- Common misattributions: "ZK = privacy" (it's also for scalability)

**Key sources to add**:
- Goldwasser, Micali, Rackoff (1985) "Knowledge complexity of interactive proofs"
- Groth (2016) "On the Size of Pairing-based Non-interactive Arguments"
- Gabizon, Williamson, Ciobotaru (2019) "PLONK"
- Bünz et al. (2017) "Bulletproofs"

### 2. `primitives/decentralized_oracles.md` (HIGH PRIORITY)

**Why**: Oracles are the bridge between on-chain and off-chain data. Critical for DeFi.

**Content**:
- Definition: Oracle problem and why it's fundamental
- Historical lineage: Centralized feeds → Chainlink (2017) → UMA → Pyth → Chronicle
- Design patterns: Push vs pull, commit-reveal, Schelling points
- EVM relevance: Price feeds, VRF, automation
- Common misattributions: "Chainlink invented oracles"

**Key sources to add**:
- Chainlink whitepaper (2017)
- UMA optimistic oracle design
- Pyth network documentation
- Town Crier (2016) - academic precursor

### 3. `primitives/governance_and_daos.md` (HIGH PRIORITY)

**Why**: Governance is the "operating system" of decentralized protocols.

**Content**:
- Definition: On-chain governance, token voting, delegation
- Historical lineage: The DAO (2016) → Aragon → MolochDAO → Compound Governor → Tally
- Design patterns: Token voting, quadratic voting, conviction voting
- EVM relevance: Governor contracts, multi-sig, timelocks
- Common misattributions: Compound invented on-chain governance

**Key sources to add**:
- Compound Governor documentation
- OpenZeppelin Governor contracts
- Gnosis Safe architecture
- Vitalik's "Moving beyond coin voting governance"

### 4. `primitives/token_standards_evolution.md` (MEDIUM PRIORITY)

**Why**: Token standards define how value is represented on-chain.

**Content**:
- Definition: Token as a ledger abstraction
- Historical lineage: ERC-20 (2015) → ERC-721 (2017) → ERC-1155 → ERC-4626 → ERC-6551
- Design patterns: Fungible vs non-fungible vs semi-fungible
- EVM relevance: Interface standards, composability
- Common misattributions: NFTs = art (they're a primitive)

**Key sources to add**:
- EIP-20 (Vogelsteller, Buterin)
- EIP-721 (Entriken et al.)
- EIP-1155 (Radomski et al.)
- EIP-4626 (vault standard)

### 5. `primitives/identity_and_naming.md` (MEDIUM PRIORITY)

**Why**: Identity is a prerequisite for reputation, credit, and social coordination.

**Content**:
- Definition: On-chain identity vs pseudonymity
- Historical lineage: Namecoin → ENS (2017) → Lens → Soulbound tokens
- Design patterns: Name resolution, attestations, social graphs
- EVM relevance: ENS integration, identity verification
- Common misattributions: ENS = just DNS on-chain

**Key sources to add**:
- ENS documentation and EIPs
- Lens Protocol whitepaper
- Vitalik's "Soulbound" paper (2022)

### 6. `primitives/privacy_protocols.md` (MEDIUM PRIORITY)

**Why**: Privacy is essential for fungibility and user protection.

**Content**:
- Definition: Transaction privacy vs identity privacy
- Historical lineage: Zcash (2016) → Tornado Cash (2019) → Aztec → Privacy Pools (2023)
- Design patterns: Mixers, shielded pools, compliance
- EVM relevance: Private transactions, compliant privacy
- Common misattributions: Privacy = illegal activity

**Key sources to add**:
- Zerocash paper
- Tornado Cash circuit design
- Privacy Pools paper (Buterin et al., 2023)

### 7. `primitives/depin_and_physical_infra.md` (LOWER PRIORITY)

**Why**: DePIN represents blockchain's expansion into physical infrastructure.

**Content**:
- Definition: Decentralized Physical Infrastructure Networks
- Historical lineage: Filecoin → Helium → Render → Hivemapper → DIMO → Akash
- Design patterns: Proof of coverage, work tokens, burn-and-mint
- EVM relevance: Token economics, hardware verification
- Emerging area with limited academic literature

**Key sources to add**:
- Helium whitepaper
- Render Network documentation
- Messari DePIN research reports

---

## Phase 2: BibTeX Library Expansion (~25 new entries)

### Cryptography Additions

```bibtex
@article{goldwasser_knowledge_complexity_1985,
  author = {Goldwasser, Shafi and Micali, Silvio and Rackoff, Charles},
  title = {The Knowledge Complexity of Interactive Proof Systems},
  journal = {SIAM Journal on Computing},
  year = {1989},
  note = {Original 1985 conference version}
}

@inproceedings{groth16_2016,
  author = {Groth, Jens},
  title = {On the Size of Pairing-based Non-interactive Arguments},
  booktitle = {EUROCRYPT},
  year = {2016}
}

@misc{plonk_2019,
  author = {Gabizon, Ariel and Williamson, Zachary and Ciobotaru, Oana},
  title = {PLONK: Permutations over Lagrange-bases for Oecumenical Noninteractive arguments of Knowledge},
  year = {2019}
}

@inproceedings{bulletproofs_2018,
  author = {B{\"u}nz, Benedikt and Bootle, Jonathan and Boneh, Dan and others},
  title = {Bulletproofs: Short Proofs for Confidential Transactions and More},
  booktitle = {IEEE S\&P},
  year = {2018}
}

@misc{corbellini_ecc_tutorial,
  author = {Corbellini, Andrea},
  title = {Elliptic Curve Cryptography: A Gentle Introduction},
  year = {2015},
  note = {Tutorial series}
}

@misc{bernstein_curve25519_2006,
  author = {Bernstein, Daniel J.},
  title = {Curve25519: New Diffie-Hellman Speed Records},
  year = {2006}
}
```

### Consensus & Scaling Additions

```bibtex
@inproceedings{hotstuff_2019,
  author = {Yin, Maofan and Malkhi, Dahlia and Reiter, Michael K. and others},
  title = {HotStuff: BFT Consensus with Linearity and Responsiveness},
  booktitle = {PODC},
  year = {2019}
}

@inproceedings{block_stm_2022,
  author = {Gelashvili, Rati and Spiegelman, Alexander and others},
  title = {Block-STM: Scaling Blockchain Execution by Turning Ordering Curse to a Performance Blessing},
  booktitle = {PPoPP},
  year = {2022}
}

@misc{celestia_lazylegder_2019,
  author = {Al-Bassam, Mustafa and Sonnino, Alberto and Buterin, Vitalik},
  title = {LazyLedger: A Data Availability Blockchain with Sub-Linear Full Block Validation},
  year = {2019}
}

@misc{truebit_2017,
  author = {Teutsch, Jason and Reitwie{\ss}ner, Christian},
  title = {A Scalable Verification Solution for Blockchains},
  year = {2017}
}
```

### DeFi & Economics Additions

```bibtex
@article{cfmm_angeris_2020,
  author = {Angeris, Guillermo and Chitra, Tarun and Evans, Alex},
  title = {An Analysis of Uniswap Markets},
  journal = {Cryptoeconomic Systems},
  year = {2020}
}

@misc{curve_stableswap_2019,
  author = {Egorov, Michael},
  title = {StableSwap - Efficient Mechanism for Stablecoin Liquidity},
  year = {2019}
}

@misc{chainlink_whitepaper_2017,
  author = {Ellis, Steve and Juels, Ari and Nazarov, Sergey},
  title = {ChainLink: A Decentralized Oracle Network},
  year = {2017}
}

@misc{privacy_pools_2023,
  author = {Buterin, Vitalik and others},
  title = {Blockchain Privacy and Regulatory Compliance: Towards a Practical Equilibrium},
  year = {2023}
}
```

### Security Additions

```bibtex
@inproceedings{biased_nonce_2020,
  author = {Breitner, Joachim and Heninger, Nadia},
  title = {Biased Nonce Sense: Lattice Attacks Against Weak ECDSA Signatures in Cryptocurrencies},
  booktitle = {FC},
  year = {2020}
}

@article{minerva_2020,
  author = {Jancar, Jan and others},
  title = {Minerva: The curse of ECDSA nonces},
  journal = {IACR TCHES},
  year = {2020}
}
```

---

## Phase 2: Skeleton Chapter Expansion

### Priority Order for Chapter Expansion

| Chapter | Current | Target | Why Prioritize |
|---------|---------|--------|----------------|
| Era 5 (Bitcoin) | 39 lines | 200+ lines | Only 1 BibTeX entry; synthesis not explained |
| Era 6 (Ethereum) | 40 lines | 200+ lines | DAO hack, fork, EVM design underexplained |
| Era 7 (ICO/DeFi) | 41 lines | 200+ lines | Token mechanics, early DeFi foundations |
| Era 9 (NFT/L2) | 39 lines | 150+ lines | Technical depth on L2 security |
| Era 10 (Merge) | 38 lines | 150+ lines | Collapse analysis, PoS transition |
| Era 11-12 | 75 lines | 150+ lines | Current events contextualization |
| Era 0-2 | 106 lines | 150+ lines | Lower priority; academic background |

### Era 5: Bitcoin Genesis (HIGH PRIORITY)

**Current gaps**:
- Only Nakamoto whitepaper cited
- Synthesis narrative missing
- Early adoption story absent
- Mining evolution not covered

**Expansion needed**:
- Nakamoto's synthesis: What was truly novel?
- Early exchanges (Mt. Gox 2010-2014)
- Altcoin emergence (Namecoin, Litecoin, Colored Coins)
- Mining evolution (CPU → GPU → ASIC)
- Silk Road and adoption drivers

### Era 6: Ethereum Launch (HIGH PRIORITY)

**Current gaps**:
- Whitepaper/Yellow Paper mentioned but not explained
- The DAO hack as event, not analyzed
- Fork implications underexplored
- EVM design rationale missing

**Expansion needed**:
- EVM design decisions (Why stack-based? Why 256-bit?)
- The DAO: Technical exploit, governance response, fork ethics
- ETH/ETC split: Technical and philosophical divergence
- Decentralized storage context (IPFS, Swarm)

### Era 7: ICO Boom & DeFi Foundations (HIGH PRIORITY)

**Current gaps**:
- Token mechanics not explained
- ERC-20/721 mentioned but not detailed
- Early DeFi (MakerDAO, Bancor) underexplored

**Expansion needed**:
- ICO mechanics and regulatory response
- MakerDAO CDP system design
- Bancor's bonding curve innovation
- Uniswap V1's simplicity as advantage

---

## Phase 2: Summary

### Files to Create (7 new primitives)

```
primitives/zero_knowledge_proofs.md
primitives/decentralized_oracles.md
primitives/governance_and_daos.md
primitives/token_standards_evolution.md
primitives/identity_and_naming.md
primitives/privacy_protocols.md
primitives/depin_and_physical_infra.md
```

### Files to Update

```
sources/library.bib (+25 entries)
sources/source_index.md (add new sources)
history/ERA_MAP.md (integrate new primitives)
history/CLAIMS_LEDGER.md (add new claims)
manuscript/chapters/06_era5_2008_2013.md (expand)
manuscript/chapters/07_era6_2013_2017.md (expand)
manuscript/chapters/08_era7_2017_2019.md (expand)
notes/known_gaps.md (update with resolved items)
```

### Estimated Scope for Phase 2

| Category | New Files | Words | Lines |
|----------|-----------|-------|-------|
| New primitives | 7 | 10,500 | 1,750 |
| BibTeX expansion | — | — | 400 |
| Chapter expansion | 3 major | 4,500 | 750 |
| Updates | 4 files | 2,000 | 400 |
| **Total** | **7 new + 7 updated** | **~17,000** | **~3,300** |

---

## Verification Plan (Phase 2)

1. **New primitive completeness**: Each has all 8 required sections
2. **BibTeX validity**: Syntax check on new entries
3. **Cross-references**: New primitives linked from ERA_MAP
4. **Claims expansion**: 10+ new claims from new primitives
5. **Chapter quality**: Expanded chapters match quality of Era 3/4/8

---

## Consolidated Next Steps Checklist

### Immediate (Verification of Existing Claims)

- [ ] Search for Mojo Nation original documentation (token incentive claim unverified)
- [ ] Locate Vitalik's AMM Reddit post (commonly cited as Uniswap inspiration)
- [ ] Verify Szabo smart contracts 1994 vs 1996 date
- [ ] Archive critical blog post URLs via Wayback Machine

### Phase 2A: New Primitive Dossiers (7 files)

- [ ] `zero_knowledge_proofs.md` — ZK foundations through modern systems
- [ ] `decentralized_oracles.md` — Oracle problem and solutions
- [ ] `governance_and_daos.md` — On-chain governance evolution
- [ ] `token_standards_evolution.md` — ERC-20 through ERC-6551
- [ ] `identity_and_naming.md` — ENS, Lens, Soulbound
- [ ] `privacy_protocols.md` — Mixers to Privacy Pools
- [ ] `depin_and_physical_infra.md` — Helium, Render, Akash

### Phase 2B: BibTeX Library Expansion (~40 entries)

**ZK & Cryptography:**
- [ ] Goldwasser/Micali/Rackoff (1985) — Original ZKP
- [ ] Groth16 (2016) — Pairing-based SNARKs
- [ ] PLONK (2019) — Universal SNARK
- [ ] Bulletproofs (2017) — Range proofs
- [ ] zk-STARK (2018) — Transparent SNARKs
- [ ] Shamir's Secret Sharing (1979)
- [ ] Proofs of Knowledge (Bellare/Goldreich)
- [ ] BLS Signatures (2001)
- [ ] Ed25519 (Bernstein, 2011)
- [ ] Corbellini ECC tutorial

**Consensus & Scaling:**
- [ ] HotStuff (2019) — Linear BFT
- [ ] Block-STM (2022) — Parallel execution
- [ ] Celestia/LazyLedger (2019) — Data availability
- [ ] Truebit (2017) — Computation verification
- [ ] Avalanche (2018) — Metastable consensus
- [ ] GHOST (2013) — Fork choice
- [ ] Casper FFG (2017) — ETH PoS

**DeFi & Protocols:**
- [ ] CFMM analysis (Angeris et al., 2020)
- [ ] Curve StableSwap (Egorov, 2019)
- [ ] Compound V2/V3 (2019)
- [ ] 0x Protocol (2017)
- [ ] Augur (2015)
- [ ] Eigenlayer (2023)
- [ ] Cosmos/IBC (2017)

**Privacy:**
- [ ] Zerocash (2014)
- [ ] Privacy Pools (2023)
- [ ] Tornado Cash circuit design
- [ ] MimbleWimble (2016)
- [ ] Monero/CryptoNote (2014)

**Security:**
- [ ] Biased Nonce Sense (2020)
- [ ] Minerva (2020)

### Phase 2C: Skeleton Chapter Expansion

- [ ] Expand Era 5 (Bitcoin Genesis): Synthesis narrative, mining evolution, early adoption
- [ ] Expand Era 6 (Ethereum Launch): EVM design, DAO hack analysis, fork ethics
- [ ] Expand Era 7 (ICO/DeFi): Token mechanics, MakerDAO, Bancor, Uniswap V1

### Phase 2D: Integration & Cross-References

- [ ] Update ERA_MAP.md with new primitives
- [ ] Add 10+ new claims to CLAIMS_LEDGER.md
- [ ] Update source_index.md with new sources
- [ ] Cross-reference main book chapters with research infrastructure
- [ ] Expand `smart_contracts_and_vms.md` with pre-Ethereum attempts
- [ ] Add "Why EVM Won" analysis section
- [ ] Expand VM comparison table (UTXO, eUTXO, Move, DAG)

### Phase 2E: Reference Material Integration

- [ ] Add "Designing Data-Intensive Applications" to recommended reading
- [ ] Add Uniswap V3 Development Book reference for AMM primitive
- [ ] Add Tornado Cash Book reference for privacy primitive
- [ ] Archive Vitalik's Blog key posts via Wayback Machine
- [ ] Archive Satoshi Archive and Hal Finney blogs
- [ ] Create recommended reading list for each primitive

### Phase 3: Context & Narrative Expansion

Based on user feedback, Phase 3 addresses critical gaps in broader context, international perspective, funding attribution, and recent developments.

---

## Phase 3A: Communication & Privacy Tools Context

**New Primitive: `primitives/communication_privacy_tools.md`**

| Topic | Coverage | Sources Needed |
|-------|----------|----------------|
| **PGP (1991)** | Phil Zimmermann, RSA export restrictions, key signing, web of trust | PGP history documentation |
| **Anonymous Remailers** | Cypherpunk remailers, Mixmaster, Type I/II/III | Cypherpunk mailing list archives |
| **TOR (2002)** | Onion routing, Naval Research origins, Tor Project | Tor documentation, Dingledine papers |
| **Signal Protocol (2013)** | Double Ratchet, OWS, Axolotl → Signal | Moxie Marlinspike writings |
| **Mesh Networks** | Golem, Briar, decentralized communication | Project documentation |

**Expand `privacy_protocols.md` with full market context:**

| Topic | What's Missing | Action |
|-------|---------------|--------|
| **Early Mixers** | Helix, BestMixer, BitcoinFog, centralized mixers | Add "Pre-Blockchain Mixing" section |
| **Dark Web Market Evolution** | Silk Road (2011-2013) → AlphaBay (2014-2017) → Hydra (2015-2022) | Full market timeline as adoption context |
| **Mixer Service Shutdowns** | BestMixer seized (2019), Helix operator arrested | Enforcement timeline |
| **CoinJoin Technical** | How it works, limitations, Wasabi/JoinMarket implementation | Expand technical depth |
| **Monero** | RingCT, bulletproofs, mandatory privacy, Fluffy Pony era | Dedicated subsection |
| **Privacy Coin Delistings** | Exchange compliance pressure (2020+) | Regulatory response context |

---

## Phase 3B: Geopolitical & Surveillance Context

**Expand Era 4-5 chapters with:**

| Topic | Era | Coverage Needed |
|-------|-----|-----------------|
| **Snowden/PRISM (June 2013)** | 4-5 | NSA mass surveillance revelations; timing coincides with crypto adoption |
| **Cryptography Wars (1990s)** | 4 | Export restrictions, Clipper chip, government vs. cypherpunks |
| **Arab Spring (2010-2012)** | 5 | Political context for censorship-resistant money |
| **WikiLeaks banking blockade (2010)** | 5 | Visa/MC/PayPal cut off donations; turned to Bitcoin |
| **Russian invasion context (2022)** | 10 | Ukraine crypto donations, sanctions evasion debates |

**New Claims for CLAIMS_LEDGER.md:**
- C079: Snowden revelations (June 2013) accelerated privacy tool adoption
- C080: WikiLeaks banking blockade (2010) demonstrated Bitcoin's censorship resistance
- C081: US cryptography export restrictions shaped early cypherpunk development

---

## Phase 3C: International Adoption Narratives

**New Primitive: `primitives/international_adoption.md` (6-7 Comprehensive Case Studies)**

Each case study should include: Historical context, adoption timeline, key metrics, regulatory response, and current status.

| Region | Case Study | Narrative | Depth |
|--------|------------|-----------|-------|
| **Venezuela** | Bolívar collapse (2016+) | Crypto as survival mechanism; LocalBitcoins dominance; Petro failure | FULL |
| **Argentina** | Peso crises (2018, 2024) | Crypto as inflation hedge; dollar controls; Milei era | FULL |
| **El Salvador** | BTC Law (2021) | First nation-state adoption; Chivo wallet; volcano mining; IMF tensions | FULL |
| **Nigeria** | eNaira vs crypto (2021+) | Largest African crypto adoption; P2P dominance; CBN ban reversal | FULL |
| **Lebanon** | Banking collapse (2019+) | Capital controls; crypto for remittances; bank haircuts | FULL |
| **Turkey** | Lira instability (2018+) | High crypto adoption amid currency weakness; exchange collapse | FULL |
| **Zimbabwe** | Currency collapses (2008, 2019) | Multiple currency failures; BTC adoption | FULL |

**Secondary Coverage (briefer):**
- Ukraine (2022 war donations)
- Russia (sanctions evasion debates)
- Iran (mining for sanctions circumvention)
- China (mining ban exodus 2021)

**Non-US Development Perspectives:**

| Region | Contributors/Projects | Missing Coverage |
|--------|----------------------|------------------|
| **China** | Bitmain, mining dominance, ASIC development | Mining hardware evolution |
| **Japan** | Mt. Gox lessons, regulatory evolution | Exchange history |
| **Korea** | Kimchi premium, KakaoTalk (Klaytn) | Asian market dynamics |
| **Russia** | Cryptographic heritage, Vitalik's origins | Pre-Bitcoin contributions |
| **Israel** | ZK research (Ben-Sasson), security research | Academic contributions |
| **Switzerland** | Crypto Valley, FINMA approach | Regulatory innovation |

---

## Phase 3D: Funding Attribution

**New Primitive: `primitives/funding_and_economics.md`**

Track funding sources throughout crypto history:

| Era | Funding Model | Examples | Notes |
|-----|---------------|----------|-------|
| **Pre-Bitcoin** | Government grants, academia | NSA (SHA), DARPA (internet), universities | Defense/academic origins |
| **Bitcoin (2009-2014)** | Mining, voluntary work | Satoshi, Finney (volunteer); no formal funding | Grassroots emergence |
| **Early Altcoins** | Mining, donations | Litecoin, Namecoin | Bitcoin model copied |
| **Ethereum (2014)** | Crowdsale | 31,529 BTC (~$18M) | First major crowdfund |
| **ICO Era (2017-2018)** | Token sales | $20B+ raised | Regulatory arbitrage |
| **VC Era (2018+)** | Venture capital | a16z, Paradigm, Polychain | Institutional money |
| **Foundation Grants** | Non-profit | EF grants, Zcash Foundation | Ongoing development |
| **Protocol Revenue** | Fee sharing | Uniswap, Maker | Self-sustaining models |

**Controversial Funding (Document Factually):**
- MIT Media Lab / Epstein connections to Bitcoin Core development — document with citations, no editorial judgment
- Government grants to privacy research (DARPA, NSA connections to cryptography)
- VC conflicts of interest (token allocations, governance capture)

**Add funding context to existing chapters:**
- Era 5: Bitcoin's grassroots funding (no ICO, no VC)
- Era 6: Ethereum crowdsale mechanics and distribution
- Era 7: ICO boom economics
- Era 8+: VC dominance and its implications

---

## Phase 3E: Recent Bitcoin Programmability (2024-2025)

**Expand `smart_contracts_and_vms.md` with:**

| Topic | Year | Coverage |
|-------|------|----------|
| **BitVM** | 2023 | Robin Linus proposal; general computation on Bitcoin via fraud proofs |
| **OP_CAT Revival** | 2024 | Covenant enabling; script expansion debates |
| **Citrea** | 2024 | Bitcoin validity rollup; ZK proofs on Bitcoin |
| **Stacks (STX)** | 2021+ | Clarity language; Bitcoin L2 |
| **Ordinals/Inscriptions** | 2023 | Application layer on Bitcoin; controversy |
| **MATT Proposal** | 2024 | Merkle-based Alternative Taproot Tree |

**New BibTeX Entries:**
- BitVM whitepaper (Linus, 2023)
- Citrea documentation (2024)
- OP_CAT BIP discussion
- Stacks whitepaper
- Ordinals protocol specification

**Expand Era 12 (2025+) chapter:**
- Bitcoin programmability renaissance
- BitVM implementations and limitations
- Bitcoin L2 landscape vs Ethereum L2s
- OP_CAT and covenant debates

---

## Phase 3F: Satellite/Mesh Networks & Physical Layer

**Topics for infrastructure expansion:**

| Technology | Relevance | Coverage |
|------------|-----------|----------|
| **Satellite Internet** | Starlink enables global node operation | DePIN adjacent |
| **Mesh Networks** | goTenna, Meshtastic, disaster-resilient comms | Censorship resistance |
| **Bitcoin via Radio** | TxTenna, satellite broadcasts | Off-grid transactions |
| **Blockstream Satellite** | Global Bitcoin broadcast | Infrastructure redundancy |

---

## Phase 3G: Comprehensive Privacy Infrastructure Expansion (NEW)

Based on gap analysis, the following privacy technologies are missing from historical coverage. Goal: Comprehensive privacy infrastructure history across all eras, not relying on vague memory.

### 1. Alternative Anonymity Networks (Critical Gaps)

| Technology | Year | Coverage Needed | Era |
|------------|------|-----------------|-----|
| **Freenet** | Summer 1999 | Ian Clarke, distributed datastore, censorship resistance | 4 |
| **I2P** | 2001-2003-2006 | "Invisible Internet Project", garlic routing, jrandom | 4 |
| **GNUnet** | 2001 | GNU project anonymity framework | 4 |
| **Lokinet** | 2018+ | Modern I2P implementation, Oxen blockchain integration | 7-8 |

**I2P Deep Dive (must document)**:
- October 2001: Project origins by "jrandom"
- 2003: Formal design documentation
- 2006: Public release of I2P software
- August 2021: Bitcoin Core 22.0 adds native I2P support
- Architecture: Garlic routing vs TOR's onion routing
- Differences from TOR: Unidirectional tunnels, packet-based vs TCP stream

**Freenet Deep Dive**:
- Summer 1999: Ian Clarke releases Freenet
- Distributed datastore with cryptographic addressing
- Key precursor to IPFS concept
- Censorship-resistant document storage

### 2. Privacy Operating Systems Timeline

| OS | Release | Purpose | Notes |
|----|---------|---------|-------|
| **Tails OS** | June 2009 | Amnesic live system, TOR routing | Snowden recommended |
| **Whonix** | February 2012 | TOR gateway + workstation isolation | Qubes integration |
| **Qubes OS** | September 2012 | Security through compartmentalization | Xen-based isolation |
| **GrapheneOS** | 2014+ | Hardened Android (formerly CopperheadOS) | Mobile privacy |

### 3. Alternative Secure Messengers

| Messenger | Year | Protocol | Notes |
|-----------|------|----------|-------|
| **Wickr** | 2012 | Proprietary E2EE | Acquired by AWS 2021 |
| **Threema** | 2012 | NaCl-based | Swiss; no phone number required |
| **Session** | 2020 | Signal fork + Lokinet | Decentralized, no phone number |
| **Briar** | 2018 | TOR + Bluetooth mesh | Works offline |
| **Element/Matrix** | 2014-2016 | Matrix protocol | Federated, E2EE optional |
| **Keybase** | 2014 | PGP + identity | Acquired by Zoom 2020 |
| **Wire** | 2014 | Proteus (Wire Protocol) | Swiss jurisdiction |

### 4. DNS Privacy & Network Layer

| Technology | Year | Purpose | Relevance |
|------------|------|---------|-----------|
| **DNSCrypt** | 2011 | Encrypted DNS queries | Anti-surveillance |
| **DNS over HTTPS (DoH)** | 2018 | DNS in HTTPS | RFC 8484 |
| **DNS over TLS (DoT)** | 2016 | Encrypted DNS | RFC 7858 |
| **Encrypted SNI (ESNI)** | 2018 | Hide destination hostname | ECH successor |
| **Encrypted Client Hello (ECH)** | 2020+ | Full TLS handshake privacy | Active development |

### 5. Bitcoin Privacy Enhancements

| Technology | Year | Creator/Team | Notes |
|------------|------|--------------|-------|
| **CoinJoin** | August 2013 | Gregory Maxwell | Original proposal |
| **JoinMarket** | 2015 | belcher | CoinJoin marketplace |
| **Wasabi Wallet** | 2018 | zkSNACKs | ZeroLink CoinJoin |
| **Samourai Wallet** | 2015+ | Samourai | Whirlpool CoinJoin |
| **PayJoin** | 2018 | Various | P2EP (pay-to-endpoint) |
| **Taproot** | November 2021 | Activated | Schnorr signatures, script privacy |

**Critical events to document**:
- April 2024: Samourai Wallet founders arrested
- FBI/DoJ enforcement actions on non-custodial mixing

### 6. Privacy Research Fundamentals

| Concept | Year | Authors | Relevance |
|---------|------|---------|-----------|
| **k-anonymity** | 1998 | Sweeney | Privacy metric |
| **l-diversity** | 2006 | Machanavajjhala et al. | Refinement of k-anonymity |
| **Differential privacy** | 2006 | Dwork | Formal privacy guarantees |
| **Chaum mix networks** | 1981 | David Chaum | Theoretical foundation |
| **Timing attacks** | Various | Academic | Deanonymization research |

### 7. VPN Context for Cryptocurrency

| Provider | Year | Notes | Crypto Relevance |
|----------|------|-------|------------------|
| **Mullvad** | 2009 | Swedish; accepts BTC/XMR | Privacy-focused crypto payments |
| **ProtonVPN** | 2017 | Swiss; Proton ecosystem | Crypto-friendly |
| **IVPN** | 2009 | Gibraltar; accepts BTC | No email registration |

**Topics to cover**:
- VPN as complement to TOR (different threat models)
- Crypto payments for VPN services (financial privacy)
- VPN + Monero as privacy stack

### Files to Update/Create

**Expand `primitives/communication_privacy_tools.md`** (~+400 lines):
- Add Freenet section (Era 4)
- Add full I2P section with architecture comparison to TOR
- Add Lokinet/Session section
- Add privacy OS timeline
- Add alternative messengers comprehensive coverage
- Add DNS privacy section

**Expand `primitives/privacy_protocols.md`** (~+200 lines):
- Add Bitcoin-specific privacy section (CoinJoin, Wasabi, Samourai)
- Add PayJoin/Taproot implications
- Add Samourai arrest context (2024)

**Expand manuscript chapters**:
- Era 4 (1990-2008): Freenet (1999), I2P (2001-2006), early privacy tools
- Era 5 (2008-2013): CoinJoin (2013), early Bitcoin privacy
- Era 7 (2017-2019): Wasabi Wallet, Samourai maturity
- Era 11-12 (2023-2025): Privacy enforcement actions, Samourai arrests

### New BibTeX Entries (~15)

```bibtex
@misc{freenet_1999,
  author = {Clarke, Ian},
  title = {A Distributed Decentralised Information Storage and Retrieval System},
  year = {1999},
  note = {Freenet master's thesis}
}

@misc{i2p_design_2003,
  author = {{I2P Development Team}},
  title = {I2P: A Scalable Framework for Anonymous Communication},
  year = {2003},
  note = {Garlic routing architecture}
}

@article{sweeney_kanonymity_2002,
  author = {Sweeney, Latanya},
  title = {k-Anonymity: A Model for Protecting Privacy},
  journal = {International Journal of Uncertainty, Fuzziness and Knowledge-Based Systems},
  year = {2002}
}

@article{dwork_differential_privacy_2006,
  author = {Dwork, Cynthia},
  title = {Differential Privacy},
  journal = {ICALP},
  year = {2006}
}

@misc{maxwell_coinjoin_2013,
  author = {Maxwell, Gregory},
  title = {CoinJoin: Bitcoin Privacy for the Real World},
  year = {2013},
  note = {bitcointalk.org post}
}

@misc{wasabi_wallet_2018,
  author = {{zkSNACKs}},
  title = {Wasabi Wallet Documentation},
  year = {2018},
  note = {ZeroLink implementation}
}

@misc{taproot_activation_2021,
  author = {{Bitcoin Core}},
  title = {Taproot Activation},
  year = {2021},
  note = {BIP 340/341/342; block 709632}
}
```

### New Claims (~10)

- C111: I2P originated October 2001, predating TOR's public release
- C112: Freenet (1999) established distributed censorship-resistant storage before BitTorrent
- C113: CoinJoin proposed August 2013 by Gregory Maxwell, foundational to Bitcoin privacy
- C114: Bitcoin Core 22.0 (August 2021) added native I2P support
- C115: Tails OS (2009) became standard operational security tool for cryptocurrency users
- C116: Samourai Wallet founders arrested April 2024, marking major privacy enforcement
- C117: k-anonymity (Sweeney, 1998) provided theoretical framework for privacy metrics
- C118: Signal Protocol (2013) became de facto standard for E2EE messaging
- C119: Taproot activation (November 2021) improved Bitcoin script privacy
- C120: DNS privacy protocols (DoH 2018, DoT 2016) complement cryptocurrency privacy

### Phase 3G Estimated Scope

| Category | Lines | Words |
|----------|-------|-------|
| communication_privacy_tools.md expansion | +400 | +5,000 |
| privacy_protocols.md expansion | +200 | +2,500 |
| Chapter updates (4 chapters) | +300 | +3,500 |
| BibTeX entries | +100 | — |
| Claims | +50 | +600 |
| **Total** | **~1,050** | **~11,600** |

### Implementation Priority

1. **I2P coverage** (HIGH) — Complete gap, predates TOR public release
2. **Freenet coverage** (HIGH) — 1999, major historical precursor
3. **Bitcoin privacy tools** (HIGH) — CoinJoin, Wasabi, Samourai timeline
4. **Privacy OS timeline** (MEDIUM) — Tails, Whonix, Qubes
5. **Alternative messengers** (MEDIUM) — Comprehensive timeline
6. **DNS privacy** (LOWER) — Supporting context
7. **Privacy research fundamentals** (LOWER) — Academic foundations

---

## Phase 3 Deliverables Summary (Updated with Phase 3G)

### New Primitives (3 files - Phase 3A-F)
```
primitives/communication_privacy_tools.md  (~250 lines base + 400 expansion = 650 lines)
primitives/international_adoption.md       (~300 lines)
primitives/funding_and_economics.md        (~250 lines)
```

### Major Expansions (Phase 3A-F)
```
primitives/privacy_protocols.md            (+100 lines mixers + 200 lines Bitcoin privacy = +300 lines)
primitives/smart_contracts_and_vms.md      (+150 lines: BitVM, OP_CAT, Bitcoin L2s)
manuscript/chapters/05_era4_1990_2008.md   (+200 lines PGP/TOR + 150 lines Freenet/I2P = +350 lines)
manuscript/chapters/06_era5_2008_2013.md   (+150 lines: Snowden, WikiLeaks, Arab Spring, CoinJoin)
manuscript/chapters/08_era7_2017_2019.md   (+100 lines: Wasabi, Samourai maturity)
manuscript/chapters/13_era12_2025.md       (+300 lines: Bitcoin programmability, privacy enforcement)
```

### Phase 3G Privacy Expansion (NEW)
```
communication_privacy_tools.md expansion   (+400 lines: I2P, Freenet, Lokinet, privacy OS, messengers)
privacy_protocols.md expansion             (+200 lines: CoinJoin, Wasabi, Samourai, PayJoin, Taproot)
Chapter updates (4 chapters)               (+300 lines total)
```

### New BibTeX Entries (~40 total)
**Phase 3A-F (~25)**:
- PGP/Zimmermann documentation
- TOR papers (Dingledine et al.)
- Signal Protocol specification
- Snowden/PRISM primary sources
- BitVM, Citrea, Stacks documentation
- International adoption case studies
- Helix/early mixer documentation

**Phase 3G (~15)**:
- Freenet (Clarke, 1999)
- I2P design documentation (2003)
- k-anonymity (Sweeney, 1998/2002)
- Differential privacy (Dwork, 2006)
- CoinJoin (Maxwell, 2013)
- Wasabi Wallet documentation
- Taproot activation (BIP 340/341/342)

### New Claims (~30 total)
**Phase 3A-F (~20)**:
- Snowden/PRISM timing context
- Funding model evolution
- International adoption drivers
- Bitcoin programmability developments

**Phase 3G (~10)**:
- I2P origins (October 2001)
- Freenet as IPFS precursor
- CoinJoin foundation for Bitcoin privacy
- Bitcoin Core I2P support (2021)
- Tails OS operational security standard
- Samourai arrest (April 2024)
- Privacy research theoretical foundations

---

## Phase 3 Estimated Scope (Updated)

| Category | Files | Words | Lines |
|----------|-------|-------|-------|
| New primitives | 3 | 10,000 | 1,000 |
| International case studies | 7 deep | 7,000 | 700 |
| Chapter expansions | 5 | 15,000 | 1,500 |
| Primitive updates | 2 | 6,500 | 700 |
| BibTeX | — | — | 650 |
| Claims | — | 3,600 | 500 |
| **Phase 3A-F Subtotal** | **9 files + 7 cases** | **~35,500** | **~4,150** |
| **Phase 3G Addition** | **2 major expansions** | **~11,600** | **~1,050** |
| **Phase 3 TOTAL** | **11 files + 7 cases** | **~47,100** | **~5,200** |

### Phase 3 Priorities (Reordered)
1. **Privacy infrastructure** (Phase 3G) - I2P, Freenet, Bitcoin privacy tools (CRITICAL GAP)
2. **International adoption** - 7 comprehensive case studies
3. **Privacy/mixer context** - Full dark web market evolution timeline
4. **Funding attribution** - Factual documentation including controversial connections
5. **Geopolitical context** - Snowden, Arab Spring, WikiLeaks
6. **Bitcoin programmability** - BitVM, Citrea, OP_CAT (2024-2025)

---

### Phase 4 — Remaining Work

**Completed (previously "Future"):**
- [x] Cross-chain interoperability primitive (`primitives/cross_chain_interoperability.md`)
- [x] Restaking primitive (`primitives/restaking.md`)

**Still Outstanding:**
- [ ] Expert review of contested claims
- [ ] Interview-based verification where possible
- [ ] Integration with main book content (Chapters 7, 16)
- [ ] Security vulnerability taxonomy (flash loans, oracle manipulation)

---

## Codex Series Alignment

This research infrastructure supports the broader "Blockchain Developer's Codex" series:

| Codex Volume | EVMBook Coverage | Research Infrastructure Support |
|--------------|------------------|--------------------------------|
| Vol I: Scaling & L2s | Ch 23-24 | `l2_rollups_and_data_availability.md` |
| Vol II: Interoperability | Ch 23 bridges | `cross_chain_interoperability.md` ✅ |
| Vol III: Privacy & ZK | Ch 24 | `zero_knowledge_proofs.md`, `privacy_protocols.md` |
| Vol IV: DeFi | Ch 15-22 | `amm_constant_product.md`, `stablecoins_and_collateral.md` |
| Vol V: Tokenization | Ch 15 | `token_standards_evolution.md` |
| Vol VI: Prediction Markets | Ch 21 | `amm_constant_product.md` (LMSR lineage) |
| Vol VII: Governance | Ch 18 | `governance_and_daos.md` |
| Vol VIII: Organizations | Ch 27 | Agentic development context |
| Vol IX: Infrastructure | Ch 3 | `decentralized_oracles.md`, `depin_and_physical_infra.md` |
| Vol X: Security | Ch 10 | `mev_and_auctions.md`, security primitives |

The research infrastructure provides the historical and attribution foundation that all Codex volumes can reference.

---

## Whitepaper & Source Priority Matrix

Based on reference material analysis, organized by priority for research infrastructure:

### CRITICAL - Must Reference in Detail (VERIFIED January 2026)

| Whitepaper | Year | Current Status | Notes |
|------------|------|----------------|-------|
| Bitcoin | 2008 | ✅ Covered | In library.bib |
| Ethereum | 2014 | ✅ Covered | In library.bib |
| Uniswap V2/V3 | 2019/2021 | ✅ Covered | `blog_adams_uniswap_2018`, `whitepaper_uniswap_v2_2020` |
| EIP-1559 | 2019 | ✅ Covered | In library.bib |
| MakerDAO | 2017 | ✅ Covered | `online_makerdao_whitepaper_2017` - CDPs, DAI mechanics |
| Chainlink | 2017 | ✅ Covered | In library.bib |
| Arbitrum | 2018 | ✅ Covered | `misc_arbitrum_2018` - interactive fraud proofs |
| The DAO | 2016 | ✅ Covered | Referenced in multiple entries with exploit context |

### HIGH PRIORITY - Add to Library

| Whitepaper | Year | Target Primitive | Notes |
|------------|------|------------------|-------|
| CFMM (Angeris et al.) | 2020 | `amm_constant_product.md` | Mathematical foundations |
| Eigenlayer | 2023 | New: `restaking.md`? | Restaking paradigm |
| Tornado Cash | 2019 | `privacy_protocols.md` | Circuit design |
| Compound V2/V3 | 2019 | `stablecoins_and_collateral.md` | Lending mechanics |
| Augur | 2015 | `amm_constant_product.md` | First prediction market |
| Flash Boys 2.0 | 2019 | ✅ In library.bib | Covered |
| Zerocash | 2014 | `privacy_protocols.md` | ZK privacy foundation |
| 0x Protocol | 2017 | `decentralized_oracles.md` | DEX aggregation |
| Avalanche | 2018 | `byzantine_fault_tolerance.md` | Alternative consensus |
| Cosmos/IBC | 2017 | Future: `interoperability.md` | Cross-chain |
| HotStuff | 2018 | ✅ In plan | BFT consensus |
| Groth16 | 2016 | ✅ In plan | ZK-SNARK |
| PLONK | 2019 | ✅ In plan | Universal SNARK |
| Block-STM | 2022 | ✅ In plan | Parallel execution |
| Curve StableSwap | 2020 | ✅ In plan | Stablecoin AMM |
| Privacy Pools | 2023 | ✅ In plan | Compliant privacy |
| Celestia | 2019 | ✅ In plan | Data availability |

### MEDIUM PRIORITY - Historical Context

| Whitepaper | Year | Notes |
|------------|------|-------|
| Truebit | 2017 | Off-chain computation verification |
| VDFs | 2018 | Verifiable delay functions |
| Mina Protocol | 2020 | Recursive SNARKs |
| Cardano/Ouroboros | 2017 | PoS comparison |
| Polkadot | 2016 | Parachains |
| PBFT | 1999 | ✅ In library.bib | Consensus foundation |
| Byzantine Generals | 1982 | ✅ In library.bib | BFT origin |
| Merkle Trees | 1979 | ✅ In library.bib | Data structure |
| Hashcash | 1997 | ✅ In library.bib | PoW precursor |
| B-Money/Bit Gold | 1998/2005 | ✅ In library.bib | Pre-Bitcoin |
| GHOST | 2013 | Fork choice rule |
| Casper | 2017 | ETH PoS |
| zk-STARK | 2018 | Transparent SNARKs |
| Bulletproofs | 2017 | ✅ In plan | Range proofs |
| BLS Signatures | 2001 | Signature aggregation |
| MimbleWimble | 2016 | Privacy scaling |

---

## Reference Books Matrix

### HIGH RELEVANCE - Should Reference

| Book | Author | Target Use | Action |
|------|--------|------------|--------|
| Designing Data-Intensive Applications | Kleppmann | Distributed systems context | ADD to recommended reading |
| Understanding Distributed Systems | Vitillo | Network consistency models | ADD to recommended reading |
| Uniswap V3 Development Book | — | AMM mechanics | ADD as DeFi reference |
| Tornado Cash Book | — | Privacy protocol deep dive | ADD as privacy reference |
| Token Engineering & DeFi | — | Mathematical models | ADD for economic primitives |
| AMM Practical Guide | — | CFMM mechanics | ADD for AMM primitive |
| Web3 Hacks (Chainlight) | — | Exploit analysis | ADD for security context |

### MEDIUM RELEVANCE - Background Context

| Book | Author | Notes |
|------|--------|-------|
| The Code Breakers | Kahn | Cryptography history (Ch 4 context) |
| Digital Gold | Popper | Bitcoin history narrative |
| Layered Money | Bhatia | Monetary theory context |

### FILTERED OUT (Not EVM-Relevant)

- **Bitcoin maximalist books** (The Bitcoin Standard, etc.) — Economic philosophy, not technical
- **Traditional OSINT books** — Not blockchain-specific
- **Language-specific programming books** (C#, Java, Python) — Not Solidity

---

## Primary Source Archives

Critical primary sources to reference and archive:

| Source | Type | Priority | Notes |
|--------|------|----------|-------|
| Vitalik's Blog | Primary | CRITICAL | All books - authoritative source |
| Satoshi Archive | Primary | HIGH | Era 5 historical context |
| Hal Finney Blogs | Primary | HIGH | Era 5 historical context |
| Chaum Papers | Primary | HIGH | Era 4 blind signatures |
| Ethereum Research Forum | Primary | HIGH | EIP discussions, technical debates |
| Bitcoin Talk Archives | Primary | MEDIUM | Early Bitcoin community |

---

## Additional BibTeX Entries (from second data dump)

### Secret Sharing & MPC

```bibtex
@article{shamir_secret_sharing_1979,
  author = {Shamir, Adi},
  title = {How to Share a Secret},
  journal = {Communications of the ACM},
  year = {1979},
  volume = {22},
  number = {11},
  pages = {612--613}
}

@misc{proofs_of_knowledge_bellare,
  author = {Bellare, Mihir and Goldreich, Oded},
  title = {On Defining Proofs of Knowledge},
  year = {1992},
  note = {ZK theory foundation}
}
```

### Alternative Consensus

```bibtex
@misc{avalanche_consensus_2018,
  author = {Team Rocket},
  title = {Snowflake to Avalanche: A Novel Metastable Consensus Protocol Family for Cryptocurrencies},
  year = {2018}
}

@misc{cosmos_whitepaper_2017,
  author = {Kwon, Jae and Buchman, Ethan},
  title = {Cosmos: A Network of Distributed Ledgers},
  year = {2017}
}

@misc{ghost_protocol_2013,
  author = {Sompolinsky, Yonatan and Zohar, Aviv},
  title = {Accelerating Bitcoin's Transaction Processing: Fast Money Grows on Trees, Not Chains},
  year = {2013}
}

@misc{casper_ffg_2017,
  author = {Buterin, Vitalik and Griffith, Virgil},
  title = {Casper the Friendly Finality Gadget},
  year = {2017}
}
```

### DeFi Protocols

```bibtex
@misc{eigenlayer_whitepaper_2023,
  author = {EigenLayer Team},
  title = {EigenLayer: The Restaking Collective},
  year = {2023}
}

@misc{augur_whitepaper_2015,
  author = {Peterson, Jack and Krug, Joseph},
  title = {Augur: A Decentralized Oracle and Prediction Market Platform},
  year = {2015}
}

@misc{0x_whitepaper_2017,
  author = {Warren, Will and Bandeali, Amir},
  title = {0x: An Open Protocol for Decentralized Exchange on the Ethereum Blockchain},
  year = {2017}
}

@misc{compound_whitepaper_2019,
  author = {Leshner, Robert and Hayes, Geoffrey},
  title = {Compound: The Money Market Protocol},
  year = {2019}
}
```

### Privacy & ZK

```bibtex
@misc{zerocash_2014,
  author = {Ben-Sasson, Eli and Chiesa, Alessandro and others},
  title = {Zerocash: Decentralized Anonymous Payments from Bitcoin},
  year = {2014}
}

@misc{zk_stark_2018,
  author = {Ben-Sasson, Eli and Bentov, Iddo and others},
  title = {Scalable, transparent, and post-quantum secure computational integrity},
  year = {2018}
}

@misc{mimblewimble_2016,
  author = {Jedusor, Tom Elvis},
  title = {MimbleWimble},
  year = {2016},
  note = {Privacy scaling approach}
}

@misc{monero_whitepaper_2014,
  author = {van Saberhagen, Nicolas},
  title = {CryptoNote v 2.0},
  year = {2014},
  note = {Ring signatures for privacy}
}
```

### Signatures & Cryptography

```bibtex
@article{bls_signatures_2001,
  author = {Boneh, Dan and Lynn, Ben and Shacham, Hovav},
  title = {Short Signatures from the Weil Pairing},
  journal = {ASIACRYPT},
  year = {2001}
}

@misc{ed25519_2011,
  author = {Bernstein, Daniel J. and others},
  title = {High-speed high-security signatures},
  year = {2011}
}
```

---

## Updated Scope Estimate

### Phase 2 Totals (Revised)

| Category | Files | New BibTeX | Words | Lines |
|----------|-------|------------|-------|-------|
| New primitives | 7 | — | 10,500 | 1,750 |
| BibTeX expansion | — | ~40 entries | — | 600 |
| Chapter expansion | 3 major | — | 4,500 | 750 |
| Updates | 4 files | — | 2,000 | 400 |
| **Total** | **7 new + 7 updated** | **~40 entries** | **~17,000** | **~3,500** |

### Full Research Infrastructure (Phase 1 + Phase 2)

| Metric | Phase 1 | Phase 2 | Total |
|--------|---------|---------|-------|
| Files | 34 | 14 | 48 |
| BibTeX entries | 66 | ~40 | ~106 |
| Words | ~31,700 | ~17,000 | ~48,700 |
| Lines | ~7,660 | ~3,500 | ~11,160 |
| Primitives | 10 | 7 | 17 |
| Claims | 50 | 15+ | 65+ |

---

## Coverage Assessment: VM & Smart Contract History

Based on third data dump review against existing `smart_contracts_and_vms.md`:

### Already Covered ✅

| Topic | Status | Location |
|-------|--------|----------|
| Nick Szabo 1994-1996 papers | ✅ Detailed | Primitive lines 27-46 |
| Bitcoin Script limitations | ✅ Covered | Primitive lines 56-65 |
| EVM architecture | ✅ Detailed | Primitive lines 122-148 |
| Gas metering | ✅ Covered | Primitive lines 143-148 |
| Alternative VMs table | ✅ Basic | Primitive lines 242-250 |

### Gaps to Address in Phase 2

| Topic | Priority | Action |
|-------|----------|--------|
| Pre-Ethereum alt-chains | HIGH | Expand primitive |
| Namecoin (2011) | HIGH | First alt-chain, DNS registry |
| Counterparty (2014) | HIGH | Smart contracts via OP_RETURN |
| Mastercoin/Omni (2013) | HIGH | Colored coins precursor |
| Deep VM comparisons | MEDIUM | Expand Alternative VMs |
| UTXO vs Account vs eUTXO | MEDIUM | Add comparison table |
| Move-based chains (Sui, Aptos) | MEDIUM | Resource-oriented |
| DAG-based systems | LOW | IOTA, Hedera |
| Historical dead-ends | LOW | NXT, EOS, Stellar |
| "Why EVM Won" analysis | MEDIUM | Network effects |

### Primitive Update: `smart_contracts_and_vms.md`

**Expansion needed (~300 words)**:

1. **Pre-Ethereum Attempts** section (after Bitcoin Script):
   - Namecoin (2011): First alt-chain, DNS-like registry
   - Mastercoin/Omni (2013): Colored coins on Bitcoin
   - Counterparty (2014): Smart contracts via OP_RETURN
   - Why these hit limitations → motivated Ethereum

2. **Expanded VM Comparison**:
   | Model | Chains | State | Trade-offs |
   |-------|--------|-------|------------|
   | UTXO + Script | Bitcoin | Stateless | Security via simplicity |
   | Account + EVM | ETH/ETC/L2s | Global | Flexibility, tooling |
   | eUTXO | Cardano | Deterministic | Formal verification |
   | Account + SVM | Solana | Per-account | Speed vs decentralization |
   | Move VM | Sui, Aptos | Object-centric | Resource safety |
   | DAG | IOTA, Hedera | Varies | Different finality |

3. **"Why EVM Won"** section:
   - First mover in general-purpose computation
   - Developer tooling (Solidity, Hardhat, Foundry)
   - Network effects: liquidity, users, dApps
   - EVM compatibility standard (BSC, Polygon, Avalanche)

### Additional BibTeX for VM History

```bibtex
@misc{namecoin_2011,
  author = {Namecoin Developers},
  title = {Namecoin: A Decentralized DNS},
  year = {2011},
  note = {First Bitcoin fork/alt-chain}
}

@misc{mastercoin_whitepaper_2012,
  author = {Willett, J.R.},
  title = {The Second Bitcoin Whitepaper},
  year = {2012},
  note = {Colored coins concept; became Omni}
}

@misc{counterparty_2014,
  author = {Counterparty Developers},
  title = {Counterparty Protocol Specification},
  year = {2014},
  note = {Smart contracts on Bitcoin via OP_RETURN}
}

@misc{nxt_2013,
  author = {BCNext},
  title = {Nxt Whitepaper},
  year = {2013},
  note = {First pure PoS; limited scripting}
}
```
