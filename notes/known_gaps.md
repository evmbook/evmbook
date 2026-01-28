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
   - Status: ✓ FOUND — Primary sources located:
     - Technical Overview (Feb 14, 2000) from Autonomous Zone Industries
     - Financial Cryptography post-mortem by Jim McCoy (founder)
     - IPTPS 2002 paper by Zooko Wilcox-O'Hearn
     - **Confirmed**: Mojo tokens for micropayments; IOU-based credit system; token server for anti-double-spend. Key people: Jim McCoy (CEO), Zooko Wilcox-O'Hearn, Bram Cohen. Ceased Feb 2002 due to hyperinflation.

2. **Szabo smart contracts 1994 document**
   - Need: Original 1994 version
   - Why: Date dispute (1994 vs 1996)
   - Status: ✓ RESOLVED — Both dates correct for different works:
     - **1994**: Original "Smart Contracts" essay (copyright 1994) — first definition
     - **Q1 1996**: "Smart Contracts: Building Blocks for Digital Markets" in Extropy #16
     - **1997**: "The Idea of Smart Contracts" follow-up
     - Archive.org has Extropy #16 PDF confirming Q1 1996 publication

3. **Vitalik Reddit post on AMMs**
   - Need: Link to specific Reddit post
   - Why: Commonly cited as Uniswap inspiration
   - Status: ✓ FOUND — October 3, 2016 Reddit post "Let's run on-chain decentralized exchanges the way we run prediction markets" (r/ethereum). Documented via Adjacent Research article with precise date. Full AMM lineage: Köppelmann (Sep 2015) → Johnson Euler (Sep 2016) → Vitalik Reddit (Oct 2016) → Lu invariants (Mar 2017) → Vitalik follow-up (Mar 2018) → Uniswap V1 (Nov 2018).

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
| Women in crypto history | ✓ Expanded | Cynthia Dwork (PoW, proof_of_work.md); WWII codebreakers: Joan Clarke, Mavis Batey, Elizebeth Friedman, Code Girls (Era 1 chapter) |
| Global crypto pioneers | ✓ Comprehensive | 40+ profiles: Asia (Jihan Wu, CZ, Da Hongfei, Do Kwon), Russia/E.Europe (Buterin, Yakovenko, Nazarov, Egorov), Africa (Abubakar Nur Khalil, Ray Youssef, Vinny Lingham), Middle East (Ben-Sasson, Bancor, Roya Mahboob), LatAm (Casares, Bitso), W.Europe (Wood, Back, Köppelmann), Oceania (Warwick) — all in international_adoption.md |
| DeFi era builders | ✓ Profiles added | Leshner, Egorov, Adams in amm_constant_product.md |
| L2 researchers | ✓ Profiles added | Felten, Goldfeder (Arbitrum), Ben-Sasson (StarkWare), Floersch (Optimism) in l2_rollups_and_data_availability.md |

### Technical Topics

| Topic | Issue | Notes |
|-------|-------|-------|
| ZK proof systems | ✓ Covered | GMR (1985), Fiat-Shamir, Groth16, PLONK, STARKs, Bulletproofs, Nova, HyperNova, folding schemes, zkEVM taxonomy in zero_knowledge_proofs.md |
| EVM client implementations | ✓ Covered | Geth, Erigon, Nethermind, Besu, Reth in smart_contracts_and_vms.md |
| Mining hardware | ✓ Covered | CPU→GPU→FPGA→ASIC evolution, manufacturers (Bitmain, Canaan, MicroBT), pools, algorithms in mining_and_hardware.md |
| Node software primitives | ✓ Covered | DHTs, storage engines, crypto libraries, libp2p in node_software_primitives.md |
| Privacy protocols | ✓ Covered | Early mixers, CryptoNote/Monero, Zcash, Tornado Cash, CoinJoin/Wasabi/Samourai, PayJoin, Taproot, Privacy Pools in privacy_protocols.md |
| Communication privacy | ✓ Covered | PGP, remailers, Freenet, I2P, TOR, Signal, Lokinet, privacy OSes, messengers, DNS privacy in communication_privacy_tools.md |

### DeFi Protocols

| Topic | Issue | Notes |
|-------|-------|-------|
| AMMs | ✓ Covered | x*y=k, LMSR precursors, Uniswap V1-V3, Curve in amm_constant_product.md |
| DeFi lending | ✓ Covered | Compound, Aave, flash loans, cTokens/aTokens, liquidations in defi_lending.md |
| DeFi derivatives | ✓ Covered | Perpetuals, options, vAMM, power perps in defi_derivatives.md |
| Stablecoins | ✓ Covered | BitUSD/NuBits history, fiat-backed (USDT/USDC/TUSD/GUSD/PYUSD), crypto-backed (DAI/LUSD), synthetic (sUSD), algorithmic (UST/MIM), hybrid (FRAX), delta-neutral (USDe), commodity-backed (PAXG), RWA-backed in stablecoins_and_collateral.md |
| RWA tokenization | ✓ Covered | Tokenized Treasuries (BUIDL, OUSG, BENJI), private credit (Centrifuge, Maple), ERC-1400, key figures in rwa_tokenization.md |

### Economic Topics

| Topic | Issue | Notes |
|-------|-------|-------|
| Auction theory & mechanism design | ✓ Covered | VCG (Vickrey-Clarke-Groves), Hurwicz, Gibbard-Satterthwaite in mev_and_auctions.md and library.bib |
| Market microstructure | ✓ Covered | Kyle (1985), Glosten-Milgrom (1985), Glosten (1994), Foucault (1999), Budish (2015) in mev_and_auctions.md |
| MEV economics | ✓ Covered | Adverse selection, batch auctions, AMM-LP connection in mev_and_auctions.md |

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
| `misc_mojonation_technical_2000` | ✓ Primary doc found | Verified |
| `misc_szabo_bitgold_1998` | Date disputed | Medium confidence |
| Various blog posts | URLs may break | Need archival copies |

---

## Action Items

### Immediate

1. [x] Search for Mojo Nation original documentation — FOUND: Technical Overview (Feb 14, 2000), McCoy post-mortem, IPTPS 2002 paper. Token economics verified.
2. [x] Locate Vitalik's AMM Reddit post — FOUND: October 3, 2016 Reddit post "Let's run on-chain decentralized exchanges the way we run prediction markets" (via Adjacent Research); added as `misc_buterin_reddit_amm_2016`
3. [x] Verify Szabo smart contracts 1994 vs 1996 — RESOLVED: Both dates valid. 1994 = original concept essay; Q1 1996 = Extropy #16 expanded article; 1997 = "Idea of Smart Contracts"
4. [ ] Archive critical blog post URLs via Wayback Machine
   - **High priority** (personal sites, may disappear):
     - weidai.com/bmoney.txt (b-money)
     - activism.net/cypherpunk/manifesto.html
     - hashcash.org/papers/hashcash.pdf
     - vitalik.ca blog posts
     - fon.hum.uva.nl Szabo archives
     - financialcryptography.com McCoy post-mortem
   - **Medium priority** (project docs):
     - curve.fi/files/stableswap-paper.pdf
     - uniswap.org whitepapers
     - compound.finance whitepaper
     - makerdao.com whitepaper
   - **Already stable**: nakamotoinstitute.org, archive.org, bitcoin.org, ethereum.org, GitHub

### Short-term

5. [x] Add BitShares/BitUSD to library.bib — Added as `misc_bitshares_bitusd_2014`
6. [x] Expand ZK proof system coverage — Added Bulletproofs detail, Nova, HyperNova, folding schemes
7. [x] Profile DeFi era builders — Added Hayden Adams (Uniswap), Michael Egorov (Curve), Robert Leshner (Compound) profiles to amm_constant_product.md
8. [x] Add auction theory foundations — Added Vickrey (1961), Myerson (1981), Milgrom/Weber (1982), Klemperer (1999)

### Long-term

9. [ ] Expert review of contested claims
10. [x] International crypto history expansion — Added `primitives/international_adoption.md`
11. [ ] Interview-based verification where possible

### Phase 2-3 Completions

12. [x] Create restaking primitive — `primitives/restaking.md`
13. [x] Create cross-chain interoperability primitive — `primitives/cross_chain_interoperability.md`
14. [x] Expand all skeleton era chapters (0-12)
