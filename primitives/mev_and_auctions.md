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

## Mechanism Design Foundations

Understanding MEV requires economic theory developed over decades in auction and mechanism design.

### Auction Theory Evolution

| Year | Work | Contribution | EVM Relevance |
|------|------|--------------|---------------|
| 1961 | Vickrey | Second-price sealed-bid auctions | Foundation for incentive-compatible mechanisms |
| 1971 | Clarke | Multipart pricing of public goods | VCG mechanism (V) |
| 1972 | Hurwicz | Informationally decentralized systems | Revelation principle foundations |
| 1973 | Groves | Incentives in teams | VCG mechanism (G) completes theory |
| 1973 | Gibbard | Manipulation impossibility | Strategy-proofness limits |
| 1981 | Myerson | Optimal auction design | Revenue-maximizing mechanisms |
| 1982 | Milgrom/Weber | Common value auctions | Winner's curse, information revelation |

[@article_vickrey_auction_1961]
[@article_clarke_multipart_1971]
[@article_groves_incentives_1973]
[@article_myerson_optimal_1981]

### VCG Mechanism

The **Vickrey-Clarke-Groves (VCG)** mechanism is incentive-compatible: truth-telling is optimal.

**Structure**:
```
1. Each agent reports valuation (can lie)
2. Mechanism chooses outcome maximizing reported welfare
3. Each agent pays: harm caused to others by their presence
4. Truth-telling is dominant strategy
```

**Blockchain application**: PBS (proposer-builder separation) aims for similar properties—builders reveal true block values through bids.

### Revelation Principle

**Hurwicz's insight**: Any mechanism can be replicated by a direct mechanism where agents report truthfully.

**Implication for MEV**: If we want MEV extraction to be "fair," the mechanism should incentivize honest reporting of opportunities and values. Private order flow auctions (MEV-Share) attempt this.

### Market Microstructure

Traditional finance research on market structure directly informs MEV:

| Year | Paper | Key Insight | MEV Parallel |
|------|-------|-------------|--------------|
| 1976 | Garman | Market maker inventory costs | AMM LP risk |
| 1985 | Kyle | Informed trading, price impact | Sandwich attacks |
| 1985 | Glosten-Milgrom | Bid-ask as adverse selection cost | AMM spread vs MEV |
| 1994 | Glosten | Limit order book competition | DEX aggregation |
| 2015 | Budish et al. | Batch auctions vs HFT | CoW Protocol design |

[@article_garman_market_1976]
[@article_kyle_continuous_1985]
[@article_glosten_milgrom_1985]
[@article_budish_hft_2015]

### Kyle Model and MEV

Kyle (1985) formalized how informed traders profit:

```
Price impact: ΔP = λ × order_size
  where λ = market depth parameter

Informed trader profit = information_value - price_impact_cost
```

**MEV translation**:
- Sandwich attackers are "informed" (see mempool)
- Victims suffer adverse selection (trade at worse prices)
- AMM liquidity providers face same cost as market makers

### Adverse Selection in AMMs

Glosten-Milgrom (1985) showed bid-ask spreads compensate for adverse selection:

```
Uninformed traders: lose to spread
Informed traders: profit from spread
Market maker: breaks even on average

AMM equivalent:
  LP fees = spread
  Arbitrageurs = informed traders
  Retail swappers = uninformed
  LPs = market makers facing adverse selection
```

This explains why AMM LPs often underperform: they're systematically trading against informed flow (arbitrageurs, MEV extractors).

### Batch Auctions as MEV Mitigation

Budish, Cramton, Shim (2015) proposed frequent batch auctions to eliminate HFT latency advantages:

```
Traditional:     Continuous order matching → speed matters
Batch auction:   Collect orders → match at uniform price → speed irrelevant
```

**DeFi implementation**: CoW Protocol (Coincidence of Wants) uses batch auctions:
- Orders collected over time window
- Solved by off-chain "solvers"
- No frontrunning possible within batch
- MEV captured for users via better prices

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
[@article_vickrey_auction_1961]
[@article_clarke_multipart_1971]
[@article_groves_incentives_1973]
[@article_myerson_optimal_1981]
[@article_milgrom_theory_1982]
[@article_garman_market_1976]
[@article_kyle_continuous_1985]
[@article_glosten_milgrom_1985]
[@article_budish_hft_2015]
[@article_klemperer_auctions_1999]

---

## Cross-References

- [AMM Constant Product](amm_constant_product.md) — Primary MEV venue
- [Fee Markets & EIP-1559](fee_markets_eip1559.md) — Priority fees and inclusion
- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — Sequencer MEV
