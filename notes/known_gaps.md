# Known Gaps & Unverified Claims

## Purpose

This document tracks claims that need additional verification, sources that couldn't be confirmed, and areas where research is incomplete.

---

## Unverified Claims (Marked LOW or MEDIUM confidence)

### Attribution Claims

| Claim | Current Confidence | Issue | Follow-up Needed |
|-------|-------------------|-------|------------------|
| Nick Szabo coined "smart contracts" in 1994 | MEDIUM | Some sources say 1996 | Find original 1994 document |
| Bit Gold was conceived in 1998 | CONTESTED | Published 2005; 1998 claim is secondhand | Contact Szabo or find contemporaneous mention |
| Mojo Nation used tokens for file sharing incentives (2000) | MEDIUM | Need primary source | Find original Mojo Nation documentation |
| Hayden Adams was inspired by Vitalik's Reddit post | MEDIUM | Common claim but need specific post | Find original Reddit post |
| LMSR directly influenced DeFi AMMs | MEDIUM | Logical connection but no confirmed influence | Interview DeFi founders on inspirations |

### Historical Claims

| Claim | Current Confidence | Issue | Follow-up Needed |
|-------|-------------------|-------|------------------|
| GCHQ discovered PKC before Diffie-Hellman | HIGH | Declassified 1997 | ✓ Confirmed via declassified docs |
| First Bitcoin transaction was Satoshi → Finney | HIGH | Block 170 | ✓ Confirmed via blockchain |
| Bancor predates Uniswap | HIGH | Bancor June 2017, Uniswap Nov 2018 | ✓ Confirmed |

---

## Missing Primary Sources

### High Priority

1. **Mojo Nation original documentation**
   - Need: Original whitepaper or specification
   - Why: Token incentive claim is significant
   - Status: Only secondary sources found

2. **Szabo smart contracts 1994 document**
   - Need: Original 1994 version
   - Why: Date dispute (1994 vs 1996)
   - Status: 1996 Extropy Magazine version confirmed

3. **Vitalik Reddit post on AMMs**
   - Need: Link to specific Reddit post
   - Why: Commonly cited as Uniswap inspiration
   - Status: Not yet located

### Medium Priority

4. **Bancor whitepaper original URL**
   - Need: Archival copy
   - Why: Links may have changed
   - Status: Need Wayback Machine verification

5. **Dwork/Naor original conference paper**
   - Need: CRYPTO '92 proceedings
   - Why: PDF not freely available
   - Status: Citation confirmed; need full text

6. **BitShares/BitUSD documentation**
   - Need: Original stablecoin whitepaper
   - Why: First crypto-collateralized stable
   - Status: ✓ Added to library.bib as `misc_bitshares_bitusd_2014`

---

## Areas Needing Expanded Coverage

### People

| Person | Issue | Notes |
|--------|-------|-------|
| Women in crypto history | Underrepresented | Cynthia Dwork noted; others needed |
| Asian crypto pioneers | Underrepresented | Need international perspective |
| DeFi era builders | Names without deep profiles | Leshner, Egorov, Adams need expansion |
| L2 researchers | Not profiled | Arbitrum, Optimism, StarkWare teams |

### Technical Topics

| Topic | Issue | Notes |
|-------|-------|-------|
| ZK proof systems | Limited coverage | Only STARKs/PLONK; need Groth16, etc. |
| EVM client implementations | Not covered | Geth, Erigon, Nethermind history |
| Mining hardware | Not covered | ASIC history, manufacturers |
| Privacy protocols | Limited | Tornado Cash, Zcash need expansion |

### Economic Topics

| Topic | Issue | Notes |
|-------|-------|-------|
| Auction theory precursors | Limited | Vickrey, Milgrom need proper citation |
| Market microstructure | Only Garman, Amihud-Mendelson | More depth needed |
| Mechanism design | Not covered | Formal treatment needed |

---

## Contested Narratives

### Satoshi Identity

**Status**: CONTESTED (by design)

Multiple theories exist:
- Nick Szabo: Writing style analysis; bit gold similarity; he denies
- Hal Finney: Proximity; skills; received first tx; he denied
- Craig Wright: Self-claimed; legally contested; widely disbelieved
- Adam Back: Cited in whitepaper; he denies
- Multiple people: Some believe Satoshi was a group

**Position**: Document speculation without endorsing any theory. Use "identity unknown" consistently.

### "Who invented X" disputes

| Topic | Simplified Attribution | Complex Reality |
|-------|----------------------|-----------------|
| Proof of work | Bitcoin/Satoshi | Dwork/Naor (1992) → Back (1997) → Bitcoin (2008) |
| AMMs | Uniswap | Hanson (2003) → Bancor (2017) → Uniswap (2018) |
| Smart contracts | Ethereum | Szabo (1994) → Ethereum (2015) |
| Digital cash | Bitcoin | Chaum (1982) → Dai (1998) → Szabo (1998) → Bitcoin (2008) |

**Position**: Credit synthesizers and popularizers, but document precursors.

---

## Sources Quality Issues

### Lower-Quality Sources Currently Used

| Source | Issue | Mitigation |
|--------|-------|------------|
| Wikipedia | Secondary; can change | Cross-reference with primary |
| Medium posts | Variable quality | Only use if author is primary |
| Twitter threads | Ephemeral; editable | Archive via Wayback Machine |
| News articles | May contain errors | Cross-reference multiple sources |

### Sources Needing Verification

| Source | Issue | Status |
|--------|-------|--------|
| `misc_wilcox_mojonation_2000` | Needs primary doc | Unverified |
| `misc_szabo_bitgold_1998` | Date disputed | Medium confidence |
| Various blog posts | URLs may break | Need archival copies |

---

## Action Items

### Immediate

1. [ ] Search for Mojo Nation original documentation
2. [ ] Locate Vitalik's AMM Reddit post
3. [ ] Verify Szabo smart contracts 1994 vs 1996
4. [ ] Archive critical blog post URLs via Wayback Machine

### Short-term

5. [x] Add BitShares/BitUSD to library.bib — Added as `misc_bitshares_bitusd_2014`
6. [ ] Expand ZK proof system coverage
7. [ ] Profile DeFi era builders
8. [ ] Add auction theory foundations

### Long-term

9. [ ] Expert review of contested claims
10. [x] International crypto history expansion — Added `primitives/international_adoption.md`
11. [ ] Interview-based verification where possible

### Phase 2-3 Completions

12. [x] Create restaking primitive — `primitives/restaking.md`
13. [x] Create cross-chain interoperability primitive — `primitives/cross_chain_interoperability.md`
14. [x] Expand all skeleton era chapters (0-12)
