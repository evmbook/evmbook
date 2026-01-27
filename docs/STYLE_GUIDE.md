# Style Guide

Writing standards for the "Mastering EVM" historical research infrastructure.

## Voice and Tone

### General Principles

1. **Neutral and academic** - Present facts without advocacy
2. **Accessible** - Avoid unnecessary jargon; define technical terms
3. **Precise** - Use specific dates, names, and citations
4. **Humble** - Acknowledge uncertainty; avoid overclaiming

### Acceptable

> "Diffie and Hellman published their seminal paper in 1976, though James Ellis at GCHQ had independently discovered similar concepts earlier, as declassified documents later revealed."

### Avoid

> "Diffie and Hellman revolutionized cryptography forever with their groundbreaking genius."

---

## Date Formats

### For Events

Use "Month Day, Year" for specific events:
- "The Bitcoin genesis block was mined on January 3, 2009."
- "The DAO was attacked on June 17, 2016."

### For Papers and Publications

Use "Year" in citations; "Month Year" in prose if known:
- "Lamport et al. (1982) formalized the Byzantine Generals Problem."
- "In November 2018, Uniswap V1 launched on mainnet."

### For Ranges

Use en-dash without spaces:
- "The Cypherpunk era (1992-2008)"
- "Era 3: 1976-1990"

### Approximate Dates

Use "circa" or "approximately" when uncertain:
- "Nick Szabo was born circa 1964."
- "The concept emerged approximately 1994-1996."

---

## Naming Conventions

### People

- **First mention**: Full name with birth/death years if notable
  - "Hal Finney (1956-2014)"
- **Subsequent mentions**: Last name only
  - "Finney received the first Bitcoin transaction."

### Protocols and Projects

- **Use official capitalization**:
  - Bitcoin (not bitcoin, except when referring to the currency unit)
  - Ethereum (not ethereum)
  - Uniswap (not UniSwap or uniswap)
  - MakerDAO (not Makerdao or Maker DAO)

- **Version numbers**: Use official format
  - Uniswap V1, V2, V3, V4 (not v1, Version 1)
  - Aave V3 (not Aave 3)
  - ERC-20 (not ERC20 or ERC 20)

### Technical Terms

- **Proof of work** / **proof of stake** - lowercase unless starting a sentence
- **Byzantine fault tolerance** - lowercase
- **Smart contract** - lowercase
- **Merkle tree** - capitalize "Merkle" (proper noun)
- **EVM** - always uppercase (abbreviation)

### Abbreviations

- Define on first use: "Ethereum Virtual Machine (EVM)"
- Exception: Well-known abbreviations (BTC, ETH) may be used without definition
- EIPs: "EIP-1559" not "EIP 1559" or "EIP1559"

---

## Handling Controversies

### Satoshi's Identity

- Refer to as "Satoshi Nakamoto" or "Satoshi"
- Use "they/them" pronouns (identity unknown)
- Do not speculate on identity
- Note: "Satoshi's true identity remains unknown."

### Competing Narratives

When credible sources disagree:

1. Present the dominant view first
2. Present alternative views with "however" or "alternatively"
3. Cite sources for each perspective
4. Note confidence level as CONTESTED

**Example:**

> The constant product formula (x*y=k) is most commonly associated with Uniswap V1 (2018). However, similar formulations appear in earlier academic literature on automated market makers, including Hanson's work on prediction markets (2003). The extent of direct influence remains unclear.

### The DAO and ETC/ETH Split

- Present factual timeline without taking sides
- Acknowledge both chains as legitimate continuations
- Use neutral language ("the community diverged" not "Ethereum forked away")

### Protocol Failures

- Document failures factually (Terra, FTX, DAO hack)
- Avoid moral language ("scam," "fraud") unless legally established
- Focus on technical and systemic causes

---

## Numbers and Units

### Currency

- ETH, BTC with space: "3.5 ETH", "0.001 BTC"
- Fiat: "$1,000", "€500"
- Large numbers: "$1.5 billion" or "$1.5B" (be consistent)

### Technical Values

- Gas: "21,000 gas"
- Block numbers: "Block 15,537,394"
- Percentages: "50%" in text, "0.5" in technical contexts

### Scientific Notation

- Use for very large numbers: "2^256 possible addresses"
- Spell out in prose when helpful: "roughly 10^77 possibilities"

---

## Quotations

### Direct Quotes

Use for:
- Memorable or defining statements
- When exact wording matters
- Primary source authenticity

Format:
> "A smart contract is a set of promises, specified in digital form."
> — Nick Szabo, "Smart Contracts: Building Blocks for Digital Markets" (1996)

### Paraphrasing

Prefer paraphrasing for:
- Technical explanations
- Lengthy passages
- When the idea matters more than exact words

Still cite the source.

---

## Lists and Structure

### Era Sections

Each era in ERA_MAP.md should follow this structure:

```markdown
## Era N: [Name] (YYYY-YYYY)

### Overview
Brief summary of why this era matters.

### Key Primitives
- Primitive 1 — brief description
- Primitive 2 — brief description

### Key Artifacts
| Year | Artifact | Author(s) | Significance |
|------|----------|-----------|--------------|
| YYYY | Title    | Name      | Why it matters |

### EVM Relevance
How this era connects to modern EVM development.

### Citations
[@key1; @key2; @key3]
```

### Primitive Dossiers

Each dossier in `primitives/` should follow this structure:

```markdown
# [Primitive Name]

## Definition
Neutral, technical definition.

## Precursor Lineage
### [Field/Era 1]
- Source and date

### [Field/Era 2]
- Source and date

## First Formalization
Paper/book with citation.

## First Deployment
System with date.

## Crypto Adoption Timeline
| Date | Event | Citation |
|------|-------|----------|

## Common Misattributions
1. **[Misconception]** — Correction with citation
   - Confidence: [LEVEL]

## Open Questions
- Question 1
- Question 2

## Citations
[@key1; @key2]
```

---

## Cross-References

### Internal Links

Use relative paths:
- "See [AMM Constant Product](../primitives/amm_constant_product.md)"
- "Details in [Era 4](../manuscript/chapters/05_era4_1990_2008.md)"

### Book Chapter References

When referencing existing book content:
- "See Chapter 7 (Consensus & Finality) in the main manuscript."
- "As discussed in Appendix G (Key Figures)."

---

## Revision Markers

When updating existing content:

```markdown
<!-- UPDATED: 2026-01-27 | Added Hanson LMSR as AMM precursor -->
<!-- TODO: Verify exact date of Bancor whitepaper publication -->
<!-- DISPUTED: Some sources claim 1997, others 1998 -->
```

---

## Checklist for New Content

Before committing new historical content:

- [ ] All dates verified against primary sources
- [ ] All names spelled correctly and consistently
- [ ] Citations added for non-trivial claims
- [ ] Confidence levels assigned where appropriate
- [ ] Controversies handled neutrally
- [ ] Cross-references to related content included
- [ ] No speculation presented as fact
