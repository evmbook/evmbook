# Research Plan & Priorities

## Why These Three Eras Were Prioritized

### Era 3 (1976-1990): Cryptographic Toolkit

**Rationale**: This era contains the foundational cryptography that underlies all of blockchain:
- Public key cryptography (Diffie-Hellman, RSA)
- Merkle trees
- Byzantine fault tolerance
- Elliptic curve cryptography

**Gap addressed**: The existing book's Chapter 07 (Consensus & Finality) mentions Byzantine fault tolerance but doesn't cite Lamport's foundational paper. Era 3 provides the scholarly foundation.

**Outcome**: Detailed chapter with proper attribution of Diffie-Hellman, Merkle, Lamport, and the GCHQ independent discovery.

### Era 4 (1990-2008): Cypherpunks & Digital Cash

**Rationale**: This is the most commonly misattributed era in crypto history:
- Proof of work often attributed only to Bitcoin (Dwork/Naor 1992, Hashcash 1997 predate)
- Smart contracts often attributed to Ethereum (Szabo 1994)
- P2P networks and token incentives rarely credited (Mojo Nation 2000)

**Gap addressed**: Folk histories skip the cypherpunk era or mention it superficially. This chapter establishes the intellectual lineage that Bitcoin synthesized.

**Outcome**: Comprehensive treatment of parallel tracks (cypherpunks, P2P, digital cash) with proper attribution.

### Era 8 (2020): DeFi Summer

**Rationale**: This era crystallized modern DeFi and raised attribution questions:
- AMM origins (Hanson LMSR → Bancor → Uniswap)
- Who invented what in rapid succession
- The composability paradigm

**Gap addressed**: The existing Chapter 16 (AMM Evolution) covers protocols but lacks academic precursor citations. Era 8 connects Hanson's 2003 work to Uniswap.

**Outcome**: DeFi Summer narrative with AMM lineage clarified.

---

## Research Methodology

### Source Priority

1. **Primary sources first**: Original papers, whitepapers, EIPs
2. **Cross-reference with secondary**: Wikipedia, news sources for context
3. **Flag uncertainties**: Mark confidence levels, add to known_gaps.md

### Attribution Audit Process

For each major concept:
1. Who is commonly credited?
2. What primary sources support this?
3. Are there earlier precursors?
4. Is the common attribution accurate or simplified?

### BibTeX Workflow

1. Add source to `sources/library.bib`
2. Add to `sources/source_index.md` with credibility assessment
3. Use key in documents: `[@key]`
4. If claim is contested, note in `history/CLAIMS_LEDGER.md`

---

## Next Steps (Prioritized)

### High Priority

1. **Expand skeleton chapters**: Eras 0-2, 5-7, 9-12 need full content
2. **Verify LMSR → Uniswap lineage**: Did Adams know of Hanson's work?
3. **Primary source for Mojo Nation**: Need original documentation for token incentive claims
4. **Szabo smart contracts date**: Verify 1994 vs 1996 original

### Medium Priority

5. **Add EVM-specific sources**: Geth, Erigon, client implementations
6. **Expand DeFi protocol citations**: Aave, Yearn, Balancer whitepapers
7. **ZK research sources**: Add foundational ZK papers beyond STARKs/PLONK
8. **Regulatory timeline sources**: Official regulatory documents

### Lower Priority

9. **International crypto history**: Asia-based projects, non-English sources
10. **Female contributors**: Cynthia Dwork is noted; expand coverage
11. **Mining hardware evolution**: Bitmain, ASIC history
12. **Exchange history**: Mt. Gox, early exchanges

---

## Open Research Questions

### Attribution

1. **Constant product formula origin**: Is x*y=k truly novel to Uniswap, or are there academic precursors?
2. **Nakamoto identity**: Document speculation without endorsing any theory
3. **Bit Gold timeline**: Was Szabo working on this in 1998 or is 2005 the real date?

### Technical History

4. **secp256k1 choice**: Why did Satoshi choose this curve? Was it prescient or coincidental?
5. **EVM design decisions**: Why stack-based? Why 256-bit words?
6. **Ethash vs ETCHash**: Document the divergence

### Economic History

7. **First token incentives**: Was Mojo Nation truly first, or are there earlier examples?
8. **Liquidity mining origin**: Who coined the term? When?

---

## Timeline for Completion

### Phase 1 (Complete)
- [x] Research infrastructure (docs, sources, history)
- [x] Primitive dossiers (10)
- [x] Priority era chapters (3)
- [x] Manuscript scaffolding

### Phase 2 (Complete)
- [x] Expand skeleton chapters — All 13 era chapters now complete (~6,600 lines)
- [x] Add consistent structure (Timeline, Open Questions, Bridge sections)
- [ ] Verify contested claims
- [ ] Add missing sources
- [ ] Cross-reference with main book content

### Phase 3 (Future)
- [ ] Review by domain experts
- [ ] Integration with existing book
- [ ] Bibliography formatting for publication
- [ ] Index generation
