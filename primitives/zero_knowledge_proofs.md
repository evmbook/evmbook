# Zero-Knowledge Proofs

## Definition

**Zero-knowledge proofs (ZKPs)** are cryptographic protocols that allow a prover to convince a verifier that a statement is true without revealing any information beyond the validity of the statement itself.

Properties:
- **Completeness**: If the statement is true, an honest prover can convince the verifier
- **Soundness**: A dishonest prover cannot convince the verifier of a false statement
- **Zero-knowledge**: The verifier learns nothing beyond the statement's truth

Types:
- **Interactive**: Requires back-and-forth communication
- **Non-interactive (NIZK)**: Single message from prover to verifier
- **Succinct (SNARKs/STARKs)**: Proofs are small and fast to verify

---

## Precursor Lineage

### 1. Interactive Proofs (1985)

**Goldwasser, Micali, and Rackoff (1985)** — "The Knowledge Complexity of Interactive Proof Systems":
- Introduced the concept of zero-knowledge proofs
- Defined knowledge complexity
- Proved that ZK proofs exist for NP-complete problems

[@article_goldwasser_zkp_1985]

This foundational paper established the theoretical framework for all subsequent ZK research.

### 2. Fiat-Shamir Heuristic (1986)

**Fiat and Shamir (1986)** — Transformed interactive proofs into non-interactive:
- Replace verifier's random challenges with hash function outputs
- Enables NIZKs in the random oracle model
- Widely used in practical ZK systems

### 3. Succinct Arguments (1990s-2000s)

Research on making proofs shorter and faster to verify:
- **PCPs (Probabilistically Checkable Proofs)**: Proofs verifiable by reading few bits
- **IOP (Interactive Oracle Proofs)**: Combine IOPs with polynomial commitments

### 4. Practical ZK Systems (2010s)

| Year | System | Innovation |
|------|--------|------------|
| 2012 | Pinocchio | First practical SNARK |
| 2013 | libsnark | Open-source SNARK library |
| 2016 | Groth16 | Most efficient pairing-based SNARK |
| 2018 | STARKs | Transparent (no trusted setup), post-quantum |
| 2019 | PLONK | Universal trusted setup |
| 2019 | Marlin | Universal SNARKs |

---

## First Formalization

**Goldwasser, Micali, Rackoff (1985)** — STOC conference, later expanded in SIAM Journal on Computing (1989)

The paper:
- Defined interactive proof systems formally
- Introduced perfect, statistical, and computational zero-knowledge
- Proved graph isomorphism has a ZK proof
- Established complexity-theoretic foundations

[@article_goldwasser_zkp_1985]

---

## First Major Deployment

### Zcash (October 2016)

**Zcash** was the first major deployment of ZK proofs in cryptocurrency:
- Used zk-SNARKs (Groth16) for shielded transactions
- Proved transaction validity without revealing sender, receiver, or amount
- Required trusted setup ceremony ("Powers of Tau")

[@misc_zerocash_2014]

### Ethereum ZK Applications

| Date | Application | Type | Notes |
|------|-------------|------|-------|
| 2017 | zkSNARK precompiles | EIP-196/197 | Enabled on-chain verification |
| 2019 | Tornado Cash | ZK mixer | Privacy via deposit/withdraw proofs |
| 2020 | Loopring | ZK rollup | DEX with validity proofs |
| 2020 | zkSync 1.0 | ZK rollup | Payments |
| 2022 | StarkNet | STARK rollup | General-purpose ZK |
| 2023 | zkSync Era | ZK rollup | EVM-compatible |
| 2024 | Scroll, Linea | zkEVM | Full EVM equivalence |

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 1985 | GMR paper | ZKP theoretical foundation |
| 1986 | Fiat-Shamir | Non-interactive transformation |
| 2012 | Pinocchio | First practical SNARK |
| 2014 | Zerocash paper | ZK for cryptocurrency privacy |
| 2016 | Zcash launch | First ZK cryptocurrency |
| 2016 | Groth16 | Efficient SNARK construction |
| 2017 | Ethereum EIP-196/197 | On-chain ZK verification |
| 2018 | STARKs introduced | Transparent, post-quantum |
| 2019 | PLONK | Universal trusted setup |
| 2019 | Tornado Cash | ZK privacy on Ethereum |
| 2020 | First ZK rollups | Loopring, zkSync |
| 2022 | SNARK proving acceleration | Hardware advances |
| 2023-24 | zkEVM race | Polygon, zkSync, Scroll, Linea |

---

## Proof System Comparison

### SNARKs vs STARKs

| Property | SNARKs | STARKs |
|----------|--------|--------|
| Proof size | ~200 bytes | ~50 KB |
| Verification time | ~5 ms | ~50 ms |
| Trusted setup | Required (Groth16) | Not required |
| Post-quantum | No | Yes |
| Prover time | Moderate | Higher |

### SNARK Variants

| System | Setup | Proof Size | Verification | Notes |
|--------|-------|------------|--------------|-------|
| Groth16 | Circuit-specific | ~200 B | Fast | Most efficient for fixed circuits |
| PLONK | Universal | ~400 B | Fast | Reusable setup |
| Marlin | Universal | ~500 B | Fast | AHP-based |
| Halo2 | None | ~5 KB | Moderate | Recursive, no trusted setup |

### Bulletproofs (2017)

**Bünz, Bootle, Boneh et al.** introduced Bulletproofs for range proofs without trusted setup:

| Property | Value |
|----------|-------|
| Proof size | O(log n) — ~700 bytes for 64-bit range |
| Verification | O(n) — slower than SNARKs |
| Setup | None required |
| Use case | Range proofs, Monero |

Key features:
- No trusted setup needed
- Logarithmic proof size
- Slower verification (not ideal for on-chain)
- Used in Monero for confidential transactions

[@inproceedings_bulletproofs_2018]

### Recursive Proofs and Folding Schemes

**Recursive SNARKs** allow proofs to verify other proofs:

| System | Year | Innovation |
|--------|------|------------|
| **Halo** | 2019 | Recursive proofs without trusted setup |
| **Halo2** | 2021 | Improved efficiency; used by Zcash, Scroll |
| **Nova** | 2022 | Folding scheme for incremental verification |
| **HyperNova** | 2023 | Generalized folding |
| **Protostar** | 2023 | Non-uniform IVC |

**Folding schemes** (Nova, HyperNova):
- Compress multiple instances into one
- Enable incremental verifiable computation (IVC)
- More efficient than recursive SNARKs for many use cases
- Key innovation: "fold" proofs rather than verify inside circuit

**Applications**:
- Prove arbitrarily long computations
- Aggregate many proofs into one
- Enable efficient zkVMs

---

## Common Misattributions

### 1. "ZK proofs are only for privacy"

**Misconception**: Zero-knowledge is purely a privacy technology.

**Reality**: ZK proofs have two major applications:
- **Privacy**: Hiding transaction details (Zcash, Tornado Cash)
- **Scalability**: Validity proofs for rollups (zkSync, StarkNet)

For rollups, ZK is about compression and verification, not privacy.

**Confidence**: HIGH

### 2. "Trusted setup means the system is insecure"

**Misconception**: Trusted setups create backdoors.

**Reality**: Multi-party computation (MPC) ceremonies distribute trust:
- If *any* participant is honest, the setup is secure
- Zcash's "Powers of Tau" had thousands of participants
- Universal setups (PLONK) only need to be done once

**Confidence**: HIGH

### 3. "STARKs are always better than SNARKs"

**Misconception**: STARKs are strictly superior due to no trusted setup.

**Reality**: Trade-offs exist:
- SNARKs have much smaller proofs (~200 bytes vs ~50 KB)
- SNARKs are cheaper to verify on-chain
- STARKs are post-quantum secure
- Choice depends on use case

**Confidence**: HIGH

### 4. "zkEVMs are fully equivalent to EVM"

**Misconception**: All zkEVMs are identical to Ethereum's EVM.

**Reality**: Spectrum of equivalence (Vitalik's taxonomy):
- **Type 1**: Fully equivalent (but harder to build)
- **Type 2**: EVM-equivalent (small differences)
- **Type 3**: EVM-compatible (needs modifications)
- **Type 4**: High-level language compatible (compiles to ZK)

**Confidence**: HIGH

---

## Open Questions

1. **Prover efficiency**: Can proving time be reduced to near-real-time?

2. **zkEVM tradeoffs**: What's the optimal Type 1-4 balance?

3. **Post-quantum SNARKs**: Can we get SNARK efficiency with STARK security?

4. **Recursive proofs**: How to efficiently compose proofs?

5. **Hardware acceleration**: Will ZK ASICs centralize proving?

6. **Formal verification**: How to verify ZK circuit correctness?

---

## Technical Details

### SNARK Construction (Simplified)

```
1. Computation → Arithmetic Circuit
2. Circuit → R1CS (Rank-1 Constraint System)
3. R1CS → QAP (Quadratic Arithmetic Program)
4. QAP + Trusted Setup → Proving/Verification keys
5. Witness + Proving key → Proof
6. Proof + Public inputs + Verification key → Accept/Reject
```

### Groth16 Proof

```
Proof = (A, B, C) where:
- A, B, C are elliptic curve points
- Pairing check: e(A, B) = e(α, β) · e(C, δ) · e(public_input, γ)
- Verification: ~3 pairings, ~200 bytes
```

### STARK Construction (Simplified)

```
1. Computation → Algebraic Intermediate Representation (AIR)
2. AIR → Polynomial constraints
3. FRI (Fast Reed-Solomon IOP) for polynomial commitment
4. Fiat-Shamir to make non-interactive
```

### zkEVM Flow

```
1. Execute EVM transactions
2. Generate execution trace
3. Prove trace satisfies EVM constraints
4. Post proof + state diff to L1
5. L1 verifies proof
6. State finalized
```

---

## ZK Rollup Economics

| Component | Cost Factor |
|-----------|-------------|
| Proving | ~$0.01-0.10 per tx (hardware, electricity) |
| Verification | ~21,000-500,000 gas on L1 |
| Data availability | ~16 gas/byte (calldata) or ~1 gas/byte (blobs) |

### Cost Comparison (per tx)

| Rollup Type | Pre-4844 | Post-4844 |
|-------------|----------|-----------|
| Optimistic | ~$0.10 | ~$0.01 |
| ZK | ~$0.20 | ~$0.02 |

---

## EVM Relevance

ZK proofs are transforming the EVM ecosystem:

1. **Scalability**: ZK rollups scale Ethereum by 100-1000x
2. **Privacy**: ZK applications enable private transactions
3. **Precompiles**: EIP-196/197 enable on-chain SNARK verification
4. **zkEVMs**: Run EVM bytecode with validity proofs
5. **Cross-chain**: ZK light clients for trustless bridges

### ZK Precompiles on Ethereum

```solidity
// EIP-196: BN256 addition
address constant BN256_ADD = 0x06;

// EIP-197: BN256 pairing check
address constant BN256_PAIRING = 0x08;

// Usage: verify SNARK proof on-chain
(bool success, ) = BN256_PAIRING.staticcall(pairingInput);
```

---

## Citations

[@article_goldwasser_zkp_1985]
[@misc_zerocash_2014]
[@inproceedings_groth16_2016]
[@misc_plonk_2019]
[@inproceedings_bulletproofs_2018]
[@misc_zk_stark_2018]

---

## Cross-References

- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — ZK rollup architecture
- [Privacy Protocols](privacy_protocols.md) — ZK for transaction privacy
- [Public Key Cryptography](public_key_crypto.md) — Elliptic curves used in SNARKs
