# L2 Rollups & Data Availability

## Definition

### Rollups

Rollups are Layer 2 scaling solutions that:
- Execute transactions off-chain
- Post transaction data to L1 for data availability
- Inherit L1 security through proofs

Types:
- **Optimistic rollups**: Assume validity; fraud proofs for disputes
- **ZK rollups**: Cryptographic validity proofs for every batch

### Data Availability

Data availability (DA) ensures that transaction data is accessible to anyone who needs to verify state. Without DA, rollups cannot prove fraud or reconstruct state.

---

## Precursor Lineage

### 1. Payment Channels (2015)

**Lightning Network (2015-2016)** — First major L2 proposal:
- Off-chain transactions between parties
- On-chain settlement of final balances
- Requires channel management

[@whitepaper_poon_lightning_2016]

Limitation: Only works for payments, not general computation.

### 2. Plasma (2017)

**Poon & Buterin (2017)** — "Plasma: Scalable Autonomous Smart Contracts":
- Nested child chains
- Merkle roots posted to L1
- Exit games for disputes

[@whitepaper_poon_plasma_2017]

Limitation: Data availability problem; users must watch chain.

### 3. Rollup Concept (2018-2019)

**Optimistic rollups** emerged from Plasma research:
- Post all data to L1 (solves DA)
- Fraud proofs for invalid state transitions
- 7-day dispute period

**ZK rollups** applied zero-knowledge proofs:
- Validity proofs for each batch
- Instant finality (once proof verified)
- Higher computational cost for provers

---

## First Formalization

### Optimistic Rollups

Various researchers (Buterin, Plasma Group, Optimism) developed optimistic rollup specifications 2018-2020.

### ZK Rollups

**StarkWare** and **Matter Labs** pioneered ZK rollup implementations, building on SNARK/STARK research.

---

## First Major Deployment

| Date | Rollup | Type | Notes |
|------|--------|------|-------|
| 2020 | Loopring | ZK | DEX-focused |
| 2020 | zkSync 1.0 | ZK | Payments |
| 2021 | Arbitrum One | Optimistic | General purpose |
| 2021 | Optimism | Optimistic | General purpose |
| 2022 | StarkNet | ZK | General purpose |
| 2023 | zkSync Era | ZK | EVM-compatible |
| 2023 | Base | Optimistic | Coinbase's L2 |
| 2024 | Scroll, Linea | ZK | EVM-equivalent |

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2016 | Lightning Network paper | First L2 proposal |
| 2017 | Plasma paper | Ethereum scaling vision |
| 2018 | Rollup concepts emerge | Solving Plasma's DA problem |
| 2020 | First rollups launch | Loopring, zkSync |
| 2021 | Arbitrum, Optimism mainnet | General-purpose rollups |
| 2022 | Rollup adoption grows | TVL increases |
| Mar 2024 | EIP-4844 (Dencun) | Blob transactions; 90%+ cost reduction |
| 2024-25 | Rollup proliferation | Dozens of L2s |

### L2 TVL Growth

| Date | Total L2 TVL | Top Rollups |
|------|--------------|-------------|
| Jan 2021 | ~$50M | Early stages |
| Jan 2022 | ~$7B | Arbitrum, Optimism |
| Jan 2023 | ~$5B | Bear market |
| Jan 2024 | ~$20B | Recovery |
| 2025 | ~$40B+ | Multi-rollup era |

---

## EIP-4844 & Data Availability

**EIP-4844 (March 2024)** introduced blob transactions:
- New transaction type carrying "blobs"
- Blobs pruned after ~18 days
- Separate fee market from regular gas
- 90%+ reduction in rollup costs

[@eip_proto_danksharding_2022]

Before 4844: Rollups used CALLDATA (~16 gas/byte)
After 4844: Rollups use blobs (~1 gas/byte equivalent)

---

## Common Misattributions

### 1. "Rollups are sidechains"

**Misconception**: Rollups are just another chain.

**Reality**: Rollups inherit L1 security through proofs. Sidechains have independent security. The distinction is fundamental.

**Confidence**: HIGH

### 2. "ZK rollups are always better than optimistic"

**Misconception**: ZK technology is strictly superior.

**Reality**: Trade-offs exist:
- Optimistic: Simpler, EVM-equivalent, 7-day withdrawal
- ZK: Complex provers, near-instant withdrawal, harder EVM compatibility

**Confidence**: HIGH

### 3. "L2s solve blockchain scalability completely"

**Misconception**: Rollups are the final scaling solution.

**Reality**: Rollups shift bottlenecks (prover compute, DA bandwidth) rather than eliminating them. Scaling is ongoing research.

**Confidence**: HIGH

---

## Open Questions

1. **Sequencer decentralization**: How should rollup sequencers be decentralized?

2. **Interoperability**: How do L2s communicate securely?

3. **Based rollups**: Should sequencing return to L1 validators?

4. **DA alternatives**: Will non-Ethereum DA layers (Celestia, EigenDA) be adopted?

5. **State growth**: How do L2s handle growing state?

---

## Technical Details

### Optimistic Rollup Flow

```
1. Sequencer orders transactions
2. Sequencer posts state root + tx data to L1
3. 7-day dispute period
4. If challenged: fraud proof game
5. If unchallenged: state finalized
```

### ZK Rollup Flow

```
1. Sequencer orders transactions
2. Prover generates validity proof
3. Post proof + state diff to L1
4. L1 verifies proof
5. State finalized immediately
```

### Blob Transaction Format

```
Type 3 transaction:
- max_fee_per_gas
- max_priority_fee_per_gas
- max_fee_per_blob_gas      # new
- blob_versioned_hashes     # new
- blobs, commitments, proofs # sidecar
```

---

## Rollup Economics

### Cost Structure

| Component | Pre-4844 | Post-4844 |
|-----------|----------|-----------|
| L1 DA cost | ~90% of cost | ~10% of cost |
| L2 execution | ~5% | ~50% |
| Prover (ZK) | ~5% | ~40% |

### Sequencer Revenue

```
Revenue = L2 fees collected - L1 costs - prover costs
```

Sequencers profit from the spread between L2 fees and L1 costs.

---

## EVM Relevance

L2s extend the EVM ecosystem:

1. **EVM equivalence**: Most rollups run EVM
2. **Lower costs**: Enable use cases unviable on L1
3. **Same tooling**: Hardhat, Foundry work on L2s
4. **Bridge considerations**: Moving assets between layers
5. **Deployment strategy**: L1 vs. L2 trade-offs

### L2 Deployment Considerations

```solidity
// Same contract, different addresses across L2s
// Use CREATE2 for consistent addresses
// Consider L1 ↔ L2 messaging
```

---

## Citations

[@whitepaper_poon_lightning_2016]
[@whitepaper_poon_plasma_2017]
[@eip_proto_danksharding_2022]

---

## Cross-References

- [Fee Markets & EIP-1559](fee_markets_eip1559.md) — L2 fee mechanisms
- [MEV & Auctions](mev_and_auctions.md) — Sequencer MEV
- [Smart Contracts & VMs](smart_contracts_and_vms.md) — EVM execution on L2s
