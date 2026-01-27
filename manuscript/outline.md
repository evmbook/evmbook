# Manuscript Outline

Historical chapters organized by era, with summaries and key topics.

---

## Part I: Cryptographic Foundations (Eras 0-3)

### Chapter 1: Era 0 — Pre-1900: Ancient Cryptography

**Summary**: Cryptography as an art form before mathematical formalization.

**Key Topics**:
- Caesar cipher and substitution methods
- Vigenère cipher (polyalphabetic)
- Kerckhoffs's principle (1883)

**Status**: Skeleton

---

### Chapter 2: Era 1 — 1900-1945: Early Computing & Enigma

**Summary**: World Wars drive cryptographic advancement; computation becomes central.

**Key Topics**:
- Enigma machine and German ciphers
- Turing's contributions to cryptanalysis
- Birth of programmable computers (Colossus, Bombe)

**Status**: Skeleton

---

### Chapter 3: Era 2 — 1945-1975: Information Theory

**Summary**: Shannon mathematicizes communication and secrecy.

**Key Topics**:
- Information theory foundations
- Perfect secrecy and one-time pads
- Confusion and diffusion principles

**Status**: Skeleton

---

### Chapter 4: Era 3 — 1976-1990: The Public Key Revolution

**Summary**: The breakthrough that enables all of blockchain: asymmetric cryptography.

**Key Topics**:
- Diffie-Hellman key exchange (1976)
- RSA (1977)
- Merkle trees (1979)
- Byzantine Generals Problem (1982)
- Elliptic curve cryptography (1985-87)
- GCHQ's classified prior discovery

**Status**: **COMPLETE** — Priority chapter

**Primitive Links**: `public_key_crypto.md`, `hash_functions_and_merkle.md`, `byzantine_fault_tolerance.md`

---

## Part II: The Cypherpunk Era (Eras 4-5)

### Chapter 5: Era 4 — 1990-2008: Cypherpunks, P2P & Digital Cash

**Summary**: Parallel tracks converge: cypherpunk digital cash attempts and P2P network evolution.

**Key Topics**:
- Proof of work (Dwork/Naor 1992, Hashcash 1997)
- Digital cash attempts (eCash, b-money, bit gold, RPOW)
- P2P revolution (Napster, Gnutella, Mojo Nation, BitTorrent)
- DHTs and decentralized infrastructure (Chord, Kademlia)
- Smart contracts concept (Szabo 1994-96)

**Status**: **COMPLETE** — Priority chapter

**Primitive Links**: `proof_of_work.md`, `smart_contracts_and_vms.md`

---

### Chapter 6: Era 5 — 2008-2013: Bitcoin & The Genesis

**Summary**: Satoshi synthesizes existing primitives into the first decentralized cryptocurrency.

**Key Topics**:
- Bitcoin whitepaper (October 2008)
- Genesis block (January 3, 2009)
- Satoshi's synthesis: what was new vs. existing
- Early adoption and altcoins

**Status**: Skeleton

**Primitive Links**: `proof_of_work.md`, `byzantine_fault_tolerance.md`

---

## Part III: Ethereum & Programmable Money (Eras 6-7)

### Chapter 7: Era 6 — 2013-2017: Ethereum Launch

**Summary**: Bitcoin's concept generalized to a world computer.

**Key Topics**:
- Ethereum whitepaper (2013)
- Yellow Paper and EVM specification (2014)
- Mainnet launch (July 2015)
- The DAO and the ETH/ETC fork (2016)
- Decentralized storage track (IPFS, Filecoin)

**Status**: Skeleton

**Primitive Links**: `smart_contracts_and_vms.md`

---

### Chapter 8: Era 7 — 2017-2019: ICO Boom & DeFi Foundations

**Summary**: Token explosion and the quiet building of DeFi infrastructure.

**Key Topics**:
- ICO phenomenon ($5.6B 2017, $13.7B H1 2018)
- ERC-20 and ERC-721 standards
- Bancor and Uniswap V1 (AMM foundations)
- MakerDAO and DAI
- Compound and lending protocols

**Status**: Skeleton

**Primitive Links**: `amm_constant_product.md`, `stablecoins_and_collateral.md`

---

## Part IV: DeFi Maturation (Eras 8-9)

### Chapter 9: Era 8 — 2020: DeFi Summer

**Summary**: Liquidity mining ignites explosive DeFi growth.

**Key Topics**:
- COMP token launch and liquidity mining
- Yield farming frenzy
- Uniswap V2 and AMM evolution
- Curve and specialized invariants
- SushiSwap and vampire attacks
- Gas price crisis

**Status**: **COMPLETE** — Priority chapter

**Primitive Links**: `amm_constant_product.md`, `fee_markets_eip1559.md`

---

### Chapter 10: Era 9 — 2021: L2s, NFTs & Institutional Interest

**Summary**: NFTs go mainstream; L2s begin scaling; institutions arrive.

**Key Topics**:
- NFT explosion (Beeple, BAYC)
- Uniswap V3 and concentrated liquidity
- EIP-1559 activation
- Arbitrum and Optimism mainnet
- Institutional adoption signals

**Status**: Skeleton

**Primitive Links**: `l2_rollups_and_data_availability.md`, `fee_markets_eip1559.md`

---

## Part V: Maturation & Challenges (Eras 10-12)

### Chapter 11: Era 10 — 2022: Collapses & The Merge

**Summary**: Crypto's reckoning and Ethereum's technical triumph.

**Key Topics**:
- Terra/Luna collapse (May 2022)
- Cascade: 3AC, Celsius, FTX
- The Merge (September 2022)
- ETC maintains PoW

**Status**: Skeleton

**Primitive Links**: `stablecoins_and_collateral.md`, `proof_of_work.md`

---

### Chapter 12: Era 11 — 2023-2024: Recovery & Regulatory Clarity

**Summary**: Post-collapse rebuilding and institutional integration.

**Key Topics**:
- Shanghai/Shapella upgrade
- EIP-4844 and blob transactions
- Spot Bitcoin and Ethereum ETFs
- MiCA implementation
- L2 proliferation

**Status**: Skeleton

**Primitive Links**: `l2_rollups_and_data_availability.md`

---

### Chapter 13: Era 12 — 2025+: Current State

**Summary**: Where we are now and emerging trends.

**Key Topics**:
- Ethereum Pectra upgrade
- ETC Olympia
- Multi-chain reality
- AI integration
- Account abstraction
- Restaking and shared security

**Status**: Skeleton

---

## Appendix: Connections

### How Eras Connect

```
Era 0-2: Mathematical foundations
    ↓
Era 3: Public key revolution (enables digital signatures)
    ↓
Era 4: Digital cash attempts (proto-Bitcoin)
    ↓
Era 5: Bitcoin synthesizes everything
    ↓
Era 6: Ethereum generalizes Bitcoin
    ↓
Era 7-8: DeFi builds on EVM
    ↓
Era 9-12: Scaling, maturation, institutionalization
```

### Parallel Tracks

1. **Cryptographic Track**: Era 0-3 → foundational to all
2. **P2P Track**: Era 4 (Napster, BitTorrent) → Era 5 (Bitcoin network) → Era 6 (IPFS, Ethereum)
3. **Digital Cash Track**: Era 4 (b-money, bit gold) → Era 5 (Bitcoin) → Era 7-8 (DeFi)
4. **VM Track**: Era 1 (Turing) → Era 4 (Szabo smart contracts) → Era 6 (EVM)
