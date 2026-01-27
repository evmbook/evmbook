# Restaking

## Definition

**Restaking** is the practice of using already-staked assets (primarily staked ETH) to provide cryptoeconomic security for additional protocols or services beyond the base layer. Validators opt-in to additional slashing conditions in exchange for additional rewards, effectively "renting out" their stake to secure multiple systems simultaneously.

**Core insight**: Ethereum's $60B+ staked ETH represents significant cryptoeconomic security. Restaking allows this security to be extended to other protocols without requiring each to bootstrap its own validator set.

---

## Precursor Lineage

### Shared Security Concepts

| Concept | Year | Description | Relevance |
|---------|------|-------------|-----------|
| **Merge mining** | 2011 | Mining multiple PoW chains simultaneously (Namecoin, Litecoin) | First shared security model |
| **Cosmos Hub security** | 2019 | Interchain Security (replicated security) | PoS shared security |
| **Polkadot relay chain** | 2020 | Parachains secured by DOT stakers | Unified security pool |
| **Rollup security** | 2020+ | L2s inherit L1 security | Data availability guarantees |

### Intellectual Foundation

**Merge Mining (2011)**:
- Namecoin shared Bitcoin's hashpower
- Same work secures multiple chains
- Problem: Chains compete for same security

**Interchain Security (Cosmos)**:
- Cosmos Hub validators secure consumer chains
- Opt-in for validators
- Precursor to restaking economics

**Key distinction**: Restaking extends *staked capital* (not work) to multiple uses.

---

## First Formalization

### Eigenlayer Whitepaper (2023)

**Sreeram Kannan** (University of Washington) published the Eigenlayer whitepaper describing:

**Core components**:
1. **Restakers**: ETH stakers who opt into additional slashing conditions
2. **Operators**: Node operators running AVS software
3. **AVSs (Actively Validated Services)**: Protocols secured by restaked ETH
4. **Delegation**: Restakers can delegate to operators

[@misc_eigenlayer_2023]

**Key innovation**: Pooled security—AVSs don't need to bootstrap their own token and validator set.

### Formal Model

```
Restaker stakes ETH to Ethereum
  → Opts into Eigenlayer
  → Delegates to Operator
  → Operator runs AVS software
  → Restaker accepts AVS slashing conditions
  → Restaker earns AVS rewards
```

**Slashing conditions**:
- Base Ethereum slashing (inactivity, equivocation)
- Plus AVS-specific slashing (varies by service)

---

## First Deployment

### Eigenlayer Mainnet (April 2024)

| Milestone | Date | Details |
|-----------|------|---------|
| Whitepaper | 2023 | Theoretical framework |
| Testnet | Q4 2023 | Initial testing |
| Mainnet (Stage 1) | April 2024 | Native restaking only |
| LST restaking | May 2024 | stETH, rETH, etc. |
| Operator delegation | Q2 2024 | Full model operational |

**Initial TVL growth**:
- Launch: ~$1B
- 30 days: ~$10B
- Peak: ~$15B+ (mid-2024)

---

## Actively Validated Services (AVS)

### What AVSs Can Be

| Category | Examples | What Restaking Provides |
|----------|----------|------------------------|
| **Oracles** | Pyth, Chronicle | Data availability guarantees |
| **Bridges** | Hyperlane, Lagrange | Cross-chain message validation |
| **Data availability** | EigenDA | Storage and retrieval guarantees |
| **Coprocessors** | Brevis, Axiom | Off-chain computation verification |
| **Sequencers** | Espresso | Shared sequencing |
| **Keeper networks** | Gelato | Automation reliability |

### First AVSs (2024)

| AVS | Type | Launch | Purpose |
|-----|------|--------|---------|
| **EigenDA** | Data availability | Q2 2024 | Rollup data storage |
| **Lagrange** | ZK coprocessor | 2024 | Cross-chain proofs |
| **AltLayer** | Rollup infrastructure | 2024 | Restaked rollups |
| **Omni** | Interoperability | 2024 | Cross-rollup messaging |

---

## Economic Model

### Reward Sources

```
AVS pays operators in:
  → Native AVS token
  → ETH
  → Stablecoins
  → Combination

Operators split with restakers based on delegation terms
```

### Expected Yield Stack

| Layer | Source | Est. Yield |
|-------|--------|------------|
| Base staking | Ethereum protocol | ~4% APR |
| Liquid staking fee | Lido, Rocket Pool | -0.5% (cost) |
| Restaking AVS 1 | e.g., EigenDA | +1-2% |
| Restaking AVS 2 | e.g., Oracle | +0.5-1% |
| **Total** | — | ~5-7% APR |

**Yield variability**: AVS rewards depend on demand for their services.

### Slashing Risk

| Risk Type | Probability | Severity | Mitigation |
|-----------|-------------|----------|------------|
| Ethereum slashing | Very low | Up to 32 ETH | Client diversity, monitoring |
| AVS slashing | Varies | Up to full stake | Operator selection, AVS audit |
| Cascading slashing | Low | Potentially severe | AVS selection, diversification |

**Unique risk**: Restaker is slashable by ALL opted-in AVSs. One failure can trigger multiple slashings.

---

## Liquid Restaking Tokens (LRTs)

### Problem and Solution

**Problem**: Native restaking requires running nodes or trusting operators.

**Solution**: Liquid Restaking Tokens—deposit ETH or LSTs, receive tradable receipt token.

### Major LRTs (2024)

| Protocol | Token | TVL (mid-2024) | Strategy |
|----------|-------|----------------|----------|
| **EtherFi** | eETH | $5B+ | Native restaking + LST |
| **Renzo** | ezETH | $3B+ | Multi-AVS delegation |
| **Puffer** | pufETH | $2B+ | Native restaking focus |
| **Kelp** | rsETH | $1B+ | LST restaking |
| **Swell** | rswETH | $500M+ | DeFi integrations |

### LRT Dynamics

```
User deposits ETH
  → LRT protocol stakes on Ethereum
  → Stakes to Eigenlayer (or similar)
  → Delegates to curated operator set
  → User receives liquid LRT token
  → LRT usable in DeFi (collateral, LP, etc.)
```

**Yield enhancement**: LRTs can be used as collateral while earning staking + restaking rewards.

---

## Competitors and Alternatives

### Symbiotic (2024)

Backed by Lido and Paradigm; alternative restaking protocol:

| Feature | Eigenlayer | Symbiotic |
|---------|------------|-----------|
| Collateral | ETH, LSTs | Any token |
| Launch | April 2024 | Q2 2024 |
| Philosophy | ETH-centric | Permissionless collateral |
| Slashing | AVS-defined | Modular |

**Key difference**: Symbiotic accepts any token as collateral, not just ETH.

### Karak (2024)

Multi-asset restaking across multiple chains:

| Feature | Details |
|---------|---------|
| Chains | Ethereum, Arbitrum, Mantle |
| Assets | ETH, LSTs, stablecoins, BTC |
| Focus | Cross-chain restaking |

### Bitcoin Restaking (Emerging)

**Babylon** and others exploring BTC restaking:
- Bitcoin has no native staking (PoW)
- Uses time-locked BTC as slashable collateral
- Emerging in 2024-2025

---

## Technical Architecture

### Eigenlayer Components

```
┌─────────────────────────────────────────────┐
│              Restaking Layer                │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐     │
│  │Restakers│──│Operators│──│  AVSs   │     │
│  └────┬────┘  └────┬────┘  └────┬────┘     │
│       │            │            │          │
│       ▼            ▼            ▼          │
│  ┌─────────────────────────────────────┐   │
│  │         EigenLayer Contracts        │   │
│  │   (Delegation, Slashing, Rewards)   │   │
│  └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────┐
│           Ethereum Consensus Layer          │
│           (Beacon Chain Staking)            │
└─────────────────────────────────────────────┘
```

### Slashing Flow

```
AVS detects misbehavior
  → Submits fraud proof to Eigenlayer contract
  → Contract verifies proof
  → Restaker's shares slashed
  → Slashed funds distributed per AVS rules
```

---

## Risks and Concerns

### Systemic Risks

| Risk | Description | Concern Level |
|------|-------------|---------------|
| **Cascading slashing** | Failure in one AVS triggers multiple slashings | HIGH |
| **Leverage** | LRT DeFi positions amplify losses | HIGH |
| **Complexity** | Users may not understand risks | MEDIUM |
| **Concentration** | Few operators dominate | MEDIUM |
| **Ethereum weakening** | Restaking may divert stake from L1 | DEBATED |

### Vitalik's Concerns

Vitalik Buterin raised concerns about restaking potentially threatening Ethereum's social consensus:
- Ethereum shouldn't enforce non-Ethereum rules
- "Don't overload Ethereum consensus"
- Restaking should be opt-in, not assumed

[@misc_buterin_overload_2023]

### Technical Risks

| Risk | Mitigation |
|------|------------|
| Smart contract bugs | Audits, bug bounties, gradual rollout |
| Oracle manipulation | Multiple data sources, slashing for bad data |
| Operator collusion | Decentralization, monitoring |
| AVS rug pulls | Curation, due diligence |

---

## EVM Relevance

### Smart Contract Components

| Contract | Purpose |
|----------|---------|
| **StrategyManager** | Manages staking strategies |
| **DelegationManager** | Handles operator delegation |
| **Slasher** | Executes slashing logic |
| **AVS contracts** | Service-specific logic |

### Integration Points

| EVM Feature | Restaking Use |
|-------------|---------------|
| **ERC-20** | LRT tokens |
| **ERC-4626** | Vault standards for LRTs |
| **Multicall** | Batch operations |
| **Proxy patterns** | Upgradeable contracts |

### Gas Considerations

Restaking operations are gas-intensive:
- Deposits: ~100-200k gas
- Delegation: ~50-100k gas
- Withdrawals: Queue + execution

---

## Common Misattributions

### 1. "Restaking is free yield"

**Reality**: Restaking involves additional slashing risk. Higher rewards compensate for higher risk. Not "free" money.

**Confidence**: HIGH

### 2. "Eigenlayer invented shared security"

**Reality**: Merge mining (2011), Cosmos Interchain Security (2019), and Polkadot (2020) preceded Eigenlayer. Eigenlayer innovated *restaking* specifically for PoS capital.

**Confidence**: HIGH

### 3. "LRTs are the same as LSTs"

**Reality**: LSTs (stETH, rETH) represent staked ETH. LRTs (eETH, ezETH) represent *restaked* ETH with additional risk layers.

**Confidence**: HIGH

### 4. "Restaking weakens Ethereum"

**Reality**: Debated. Critics argue it adds complexity and risk; proponents argue it strengthens Ethereum's ecosystem by extending its security model.

**Confidence**: CONTESTED

---

## Open Questions

1. **Sustainable economics**: Are AVS rewards sufficient long-term, or is current yield from token incentives?

2. **Slashing cascade scenarios**: Has the ecosystem stress-tested cascading slashing events?

3. **Regulatory treatment**: Are LRTs securities? How do restaking rewards affect staking income classification?

4. **Ethereum social consensus**: Will Eigenlayer's growth create pressure to "socialize" AVS slashing decisions?

5. **Competition outcome**: Will Eigenlayer, Symbiotic, or Karak dominate, or will they coexist?

---

## Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2011 | Merge mining (Namecoin) | First shared security |
| 2019 | Cosmos Interchain Security | PoS shared security |
| 2023 | Eigenlayer whitepaper | Restaking formalized |
| Apr 2024 | Eigenlayer mainnet | First major restaking protocol |
| Q2 2024 | EigenDA launch | First major AVS |
| Q2 2024 | Symbiotic launch | Competition emerges |
| Q3 2024 | LRT proliferation | Liquid restaking matures |
| 2024-25 | Bitcoin restaking | BTC enters restaking |

---

## Citations

[@misc_eigenlayer_2023]
[@misc_buterin_overload_2023]
[@misc_symbiotic_2024]

---

## Primitive Cross-Links

- [Proof of Work](./proof_of_work.md) — Merge mining as precursor
- [Byzantine Fault Tolerance](./byzantine_fault_tolerance.md) — Consensus extension
- [L2 Rollups & Data Availability](./l2_rollups_and_data_availability.md) — EigenDA
- [Decentralized Oracles](./decentralized_oracles.md) — Oracle AVSs
- [Token Standards Evolution](./token_standards_evolution.md) — LRT tokens
