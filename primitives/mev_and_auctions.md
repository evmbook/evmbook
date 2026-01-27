# MEV & Auctions

## Definition

**MEV (Maximal Extractable Value)** is the profit extractable by reordering, inserting, or censoring transactions within a block. Originally "Miner Extractable Value" (PoW era), now "Maximal" (PoS era).

Common MEV strategies:
- **Frontrunning**: Insert transaction before victim's
- **Backrunning**: Insert transaction after target (e.g., liquidations)
- **Sandwiching**: Frontrun and backrun simultaneously
- **Arbitrage**: Profit from price differences across venues

MEV is extracted through **priority gas auctions** or **block builder markets**.

---

## Precursor Lineage

### 1. Traditional Finance Front-Running

Front-running existed in traditional markets:
- Brokers trading ahead of client orders
- High-frequency trading latency races
- "Flash Boys" (Michael Lewis, 2014) documented stock market MEV

### 2. Blockchain Mempool Observation

Public mempools create MEV opportunity:
- Pending transactions are visible
- Anyone can submit higher-fee competing transaction
- No regulatory prohibition (code is law)

### 3. Flash Boys 2.0 (2019)

**Daian et al. (2019)** — "Flash Boys 2.0" formally analyzed MEV:
- Coined "Miner Extractable Value"
- Quantified MEV on Ethereum
- Identified consensus instability risks
- Proposed auction mechanisms

[@article_daian_flashboys_2019]

This paper catalyzed MEV research and mitigation efforts.

---

## First Formalization

**Daian et al. (2019)** — IEEE Symposium on Security and Privacy

The paper:
- Defined MEV mathematically
- Measured DEX arbitrage profits
- Analyzed priority gas auctions
- Identified "time-bandit" attacks on PoW

---

## First Major Deployment

### MEV Extraction: Always existed

MEV extraction began with the first DEX trades, but scaled with DeFi Summer (2020).

### MEV Infrastructure: Flashbots (2020)

**Flashbots** created infrastructure to:
- Channel MEV extraction off-chain
- Reduce network congestion from failed MEV txs
- Enable fairer MEV distribution

Key products:
- **MEV-Geth**: Modified client for sealed-bid auctions
- **MEV-Boost**: Proposer-builder separation (post-Merge)
- **MEV-Share**: User protection via order flow auctions

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2019 | Flash Boys 2.0 paper | MEV formalized |
| 2020 | Flashbots founded | MEV infrastructure begins |
| 2020 | DeFi Summer | MEV extraction explodes |
| 2021 | MEV-Geth adoption | ~90% of miners use |
| 2022 | The Merge + MEV-Boost | Proposer-builder separation |
| 2023 | MEV-Share launches | User protection protocols |
| 2024 | PBS research | Protocol-enshrined PBS proposals |

### MEV Extracted

| Year | Estimated MEV | Notes |
|------|---------------|-------|
| 2020 | ~$300M | DeFi Summer |
| 2021 | ~$750M | Peak activity |
| 2022 | ~$600M | Bear market |
| 2023 | ~$300M | Lower volumes |

---

## MEV Supply Chain

Post-Merge Ethereum:

```
Users → Searchers → Builders → Relays → Validators
  |         |          |         |          |
Txs      Bundles     Blocks   Forward    Propose
```

1. **Searchers**: Find MEV opportunities
2. **Builders**: Construct optimal blocks
3. **Relays**: Facilitate sealed-bid auctions
4. **Validators**: Propose highest-value blocks

---

## Common Misattributions

### 1. "MEV is theft"

**Misconception**: MEV extraction is stealing from users.

**Reality**: MEV is a consequence of blockchain design (public mempool, deterministic ordering). It's better described as "arbitrage" or "rent extraction." Whether it's ethical is debated, but it's not straightforward theft.

**Confidence**: HIGH (descriptive; ethics debated)

### 2. "Flashbots eliminated MEV"

**Misconception**: Flashbots solved the MEV problem.

**Reality**: Flashbots *channeled* MEV, reducing negative externalities (failed txs, gas wars) but didn't eliminate extraction. MEV still exists; it's just extracted more efficiently.

**Confidence**: HIGH

### 3. "PoS eliminates MEV"

**Misconception**: MEV was a PoW problem.

**Reality**: MEV depends on transaction ordering, not consensus mechanism. PoS validators can extract MEV just like PoW miners. The name changed from "Miner" to "Maximal" Extractable Value.

**Confidence**: HIGH

---

## Open Questions

1. **Protocol-level MEV solutions**: Should PBS (proposer-builder separation) be enshrined in protocol?

2. **User protection**: How can users protect themselves from MEV?

3. **MEV redistribution**: Should MEV be redistributed to users or burned?

4. **Cross-chain MEV**: How does MEV work across bridges and L2s?

5. **MEV and censorship**: Does builder concentration enable censorship?

---

## Technical Details

### Sandwich Attack

```
1. Victim submits: buy TOKEN with ETH
2. Attacker frontruns: buy TOKEN (price increases)
3. Victim's tx executes: at worse price
4. Attacker backruns: sell TOKEN (profit)
```

Protection: Use private mempools, set tight slippage.

### Liquidation MEV

```
1. Loan becomes undercollateralized
2. Searchers race to liquidate
3. Liquidator gets discount on collateral
4. Fastest transaction wins
```

This is "good" MEV—incentivizes healthy protocol state.

### Arbitrage MEV

```
1. Price difference between DEX A and DEX B
2. Searcher atomically:
   - Buy on cheaper DEX
   - Sell on expensive DEX
3. Profit from spread
```

This is "neutral" MEV—improves market efficiency.

---

## MEV Protection Strategies

| Strategy | How It Works | Trade-off |
|----------|--------------|-----------|
| Private mempools | Submit to MEV-protected relay | Centralization |
| Just-in-time liquidity | LP waits until needed | Complex |
| Batch auctions | CoW Protocol style | Latency |
| Commit-reveal | Hide tx content | UX complexity |
| MEV-Share | Searchers share profits | Partial protection |

---

## EVM Relevance

MEV affects every DeFi transaction:

1. **Slippage settings**: Protection against sandwiches
2. **Transaction timing**: Backrun opportunities
3. **Gas pricing**: Priority fees for inclusion
4. **Contract design**: MEV-resistant patterns
5. **Protocol revenue**: Some protocols capture MEV

### MEV-Aware Contracts

```solidity
// Flashbots-style coinbase transfer
block.coinbase.transfer(bribe);

// Private mempool submission
// (off-chain, submit to MEV-protected relay)
```

---

## Citations

[@article_daian_flashboys_2019]

---

## Cross-References

- [AMM Constant Product](amm_constant_product.md) — Primary MEV venue
- [Fee Markets & EIP-1559](fee_markets_eip1559.md) — Priority fees and inclusion
- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — Sequencer MEV
