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

**Arbitrum (2018)** — Kalodner, Goldfeder, Chen, Felten published "Arbitrum: Scalable, Private Smart Contracts" at USENIX Security 2018. Introduced interactive fraud proofs with logarithmic on-chain cost.

[@misc_arbitrum_2018]

**Optimism (2019)** — Emerged from Plasma Group research. Developed the OP Stack, enabling the Superchain ecosystem (Base, Zora, Mode, etc.).

[@misc_optimism_2019]

### ZK Rollups

**StarkWare (2018)** — Ben-Sasson et al. developed STARKs: transparent (no trusted setup), post-quantum secure validity proofs. Powers StarkNet and StarkEx.

[@misc_starkware_2018]

**zkSync (2020)** — Matter Labs pioneered zkEVM development with native account abstraction. zkSync Era launched 2023.

[@misc_zksync_2020]

### Sidechains / Commit Chains

**Polygon/Matic (2017)** — Originally a Plasma-based sidechain, evolved to Polygon PoS (commit chain) and now developing Polygon zkEVM.

[@misc_polygon_matic_2017]

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

## Key Figures

### Ed Felten (Arbitrum / Offchain Labs)

**Background**: B.S. Physics, Caltech (1985); M.S. and Ph.D. Computer Science, University of Washington (1993). Robert E. Kahn Professor Emeritus of Computer Science at Princeton University (1993-2021). Founding Director, Princeton Center for Information Technology Policy.

**Government service**: First Chief Technologist of the FTC (2011); Deputy U.S. Chief Technology Officer at the White House (2015-2017).

**Contribution**: Co-founded Offchain Labs (September 2018) with Ph.D. students Steven Goldfeder and Harry Kalodner. Developed Arbitrum as Princeton research project, licensed technology and launched commercial product. Arbitrum One processed over 1 billion transactions by October 2023.

### Steven Goldfeder (Arbitrum / Offchain Labs)

**Background**: B.S. Mathematics and Computer Science, Yeshiva University; Ph.D. Computer Science, Princeton University (2018), advised by Arvind Narayanan. NSF Graduate Research Fellow; research in cryptography and digital currencies.

**Publications**: Co-authored "Bitcoin and Cryptocurrency Technologies" (Princeton University Press, 2016) and "Arbitrum: Scalable, private smart contracts" (USENIX Security 2018). Published threshold ECDSA research at CCS 2018.

**Contribution**: CEO and Co-founder of Offchain Labs. Led technical development of Arbitrum, the highest-TVL Ethereum L2.

### Eli Ben-Sasson (StarkWare)

**Background**: Ph.D. Computer Science, Hebrew University of Jerusalem (2001), advised by Avi Wigderson. Postdoc at Harvard and MIT. Professor at Technion (2005-2020); Henry Taub Award for Academic Excellence (2009).

**Inventions**: Co-invented STARKs and FRI protocols (2018) — zero-knowledge proofs with post-quantum security, no trusted setup, quasi-linear prover time. Co-inventor of Zerocash protocol; founding scientist of Zcash.

**Contribution**: Co-founded StarkWare Industries (2018) with Uri Kolodny, Michael Riabzev, and Alessandro Chiesa. CEO since February 2024. StarkWare valued at $8B; StarkNet is a major ZK-rollup.

### Karl Floersch (Optimism)

**Background**: B.S. Computer Science, Stony Brook University. College roommate of Hayden Adams (Uniswap founder).

**Career path**: Blockchain engineer at ConsenSys (built Ujo Music) → Ethereum Foundation researcher (2017-2020) — contributed to PoS research, created blockchain education course → Co-founded Plasma Group with Jinglan Wang → Plasma Group evolved into Optimism.

**Contribution**: CTO then CEO of OP Labs. Architected Optimistic Rollup design. Created Retroactive Public Goods Funding (RPGF) mechanism. Oversaw OP Stack release enabling Coinbase's Base and other L2s (Superchain).

---

## Citations

[@whitepaper_poon_lightning_2016]
[@whitepaper_poon_plasma_2017]
[@misc_arbitrum_2018]
[@misc_optimism_2019]
[@misc_starkware_2018]
[@misc_zksync_2020]
[@misc_polygon_matic_2017]
[@eip_proto_danksharding_2022]
[@misc_celestia_lazylegder_2019]

---

## Cross-References

- [Fee Markets & EIP-1559](fee_markets_eip1559.md) — L2 fee mechanisms
- [MEV & Auctions](mev_and_auctions.md) — Sequencer MEV
- [Smart Contracts & VMs](smart_contracts_and_vms.md) — EVM execution on L2s
