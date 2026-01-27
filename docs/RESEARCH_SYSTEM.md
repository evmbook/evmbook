# Research System

This document defines the citation rules, source classification, and verification workflow for the "Mastering EVM" historical research infrastructure.

## Citation Format

All citations use BibTeX keys in the format `[@key]` within markdown text.

### Key Naming Convention

```
@{type}_{author}_{topic}_{year}
```

Examples:
- `[@article_diffie_hellman_1976]` - Diffie-Hellman paper
- `[@whitepaper_nakamoto_bitcoin_2008]` - Bitcoin whitepaper
- `[@eip_buterin_1559_2019]` - EIP-1559

### Citation Placement Rules

1. **Inline citations**: Place immediately after the claim being supported
   - "The Byzantine Generals Problem was formalized in 1982 [@article_lamport_byzantine_1982]."

2. **Multiple sources**: Separate with semicolons
   - "Proof of work has roots in anti-spam research [@article_dwork_pricing_1992; @techreport_back_hashcash_2002]."

3. **Direct quotes**: Include page number if available
   - "As Szabo wrote, 'A smart contract is a set of promises' [@article_szabo_smart_contracts_1996, p. 1]."

---

## Source Classification

### Primary Sources

Documents created by the original author or participant at the time of the event.

**Examples:**
- Original academic papers (Diffie-Hellman 1976, Lamport 1982)
- Protocol whitepapers (Bitcoin, Ethereum)
- EIPs and ECIPs
- Original blog posts by protocol creators
- Source code repositories (first commits)
- Patents

**Required for:**
- Attribution claims ("X invented Y")
- Technical specifications
- Date of first occurrence

### Secondary Sources

Analysis, interpretation, or compilation by non-participants after the fact.

**Examples:**
- Wikipedia articles
- News coverage (CoinDesk, The Block)
- Academic surveys
- Books about crypto history
- Podcast transcripts

**Acceptable for:**
- Providing context
- Triangulating disputed claims
- Summarizing complex topics

**Not acceptable for:**
- Sole support for attribution claims
- Establishing "firsts" without corroboration

### Tertiary Sources

Aggregations of secondary sources.

**Examples:**
- Textbooks
- Encyclopedias
- General reference works

**Use only for:**
- Background context
- Definitions of established terms

---

## Confidence Levels

Every non-trivial claim should be tagged with a confidence level.

| Level | Definition | Requirements |
|-------|------------|--------------|
| **HIGH** | Established fact, well-documented | 2+ primary sources OR 1 primary + 2 secondary |
| **MEDIUM** | Likely accurate, some documentation gaps | 1 primary source OR 3+ secondary sources |
| **LOW** | Plausible but unverified | Secondary sources only, or oral history |
| **CONTESTED** | Multiple credible competing narratives | Document all perspectives with sources |

### Marking Claims

In markdown, use HTML comments or a claims ledger:

```markdown
Satoshi synthesized existing primitives rather than inventing new cryptography.
<!-- CONFIDENCE: HIGH | Sources: nakamoto_bitcoin_2008, back_hashcash_2002 -->
```

---

## Verification Workflow

### For New Claims

1. **Identify claim type**
   - Attribution ("X invented Y")
   - Temporal ("X happened before Y")
   - Technical ("X works by doing Y")

2. **Find primary source**
   - Check `sources/library.bib` first
   - Search academic databases (Google Scholar, IEEE, ACM)
   - Search blockchain-specific archives (ethresear.ch, Bitcoin Talk)

3. **Verify with secondary source**
   - Cross-reference dates and attributions
   - Note any discrepancies

4. **Assign confidence level**
   - Document reasoning in notes if LOW or CONTESTED

5. **Add to claims ledger**
   - `history/CLAIMS_LEDGER.md`

### For Existing Content

When auditing existing book chapters:

1. Extract factual claims
2. Classify as attributed/unattributed
3. Find supporting sources
4. Flag gaps in `notes/known_gaps.md`

---

## Attribution Audit Checklist

For each primitive or major concept:

- [ ] Who is credited in the current text?
- [ ] Is this the original inventor or a popularizer?
- [ ] Are there earlier precursors in adjacent fields?
- [ ] Are there competing claims to the invention?
- [ ] What primary sources support the attribution?

### Common Misattribution Patterns

1. **Popularizer credited as inventor**
   - Example: Uniswap credited for AMMs (Bancor was earlier; prediction market AMMs predate crypto)

2. **Implementation credited over concept**
   - Example: Bitcoin credited for proof of work (Hashcash was earlier; Dwork/Naor was first formalization)

3. **Public figure credited over team**
   - Example: Vitalik alone credited for Ethereum (multiple co-founders and researchers)

4. **Date of announcement vs. date of publication**
   - Example: Papers circulated privately before formal publication

---

## Source Quality Indicators

### High-Quality Sources

- Peer-reviewed academic papers
- Official protocol documentation
- Primary author blog posts with verifiable dates
- GitHub commits with timestamps
- Archived versions (Wayback Machine)

### Lower-Quality Sources (use with caution)

- Undated blog posts
- Twitter threads (ephemeral, editable)
- News articles without citations
- Wikipedia without checking underlying sources
- Forum posts (valuable for context, not authority)

---

## File Organization

```
sources/
├── README.md           # This file's companion, explains BibTeX usage
├── library.bib         # Master BibTeX library
└── source_index.md     # Human-readable index with credibility notes

history/
├── ERA_MAP.md          # Timeline with citations per era
└── CLAIMS_LEDGER.md    # Central registry of verified claims

primitives/
└── *.md                # Dossiers with embedded citations

notes/
├── known_gaps.md       # Unverified claims needing follow-up
└── plan.md             # Research priorities and rationale
```

---

## Adding New Sources

1. Add BibTeX entry to `sources/library.bib`
2. Add human-readable entry to `sources/source_index.md`
3. Use citation key in relevant documents
4. Update claims ledger if source affects claim confidence
