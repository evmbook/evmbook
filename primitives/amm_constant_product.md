# AMM Constant Product (x*y=k)

## Definition

The constant product formula maintains that the product of two token reserves remains constant during swaps:

```
x * y = k
```

Where:
- `x` = reserve of token A
- `y` = reserve of token B
- `k` = constant (invariant)

When a trader swaps Δx of token A for token B, the new reserves must satisfy:
```
(x + Δx) * (y - Δy) = k
```

This creates a convex bonding curve where price impact increases with trade size, ensuring the pool never runs out of either asset.

---

## Precursor Lineage

### 1. Market Microstructure (1970s-1980s)

The economics of market making were formalized decades before DeFi:

**Garman (1976)** — "Market Microstructure" introduced inventory models for market makers, analyzing how dealers manage risk while providing liquidity. [@article_garman_market_1976]

**Amihud & Mendelson (1980)** — "Dealership Market" formalized bid-ask spread theory and the economics of inventory-based market making. [@article_amihud_dealership_1980]

**Relevance**: These papers established that market makers face inventory risk and must be compensated through spreads. AMMs automate this function with algorithmic pricing.

### 2. Prediction Market AMMs (2003)

**Robin Hanson's LMSR (2003)** — "Combinatorial Information Market Design" introduced the Logarithmic Market Scoring Rule, an automated market maker for prediction markets. [@article_hanson_lmsr_2003]

The LMSR uses a cost function:
```
C(q) = b * ln(Σ exp(q_i/b))
```

**Key insight**: A mathematical function can replace human market makers, providing continuous liquidity for any trade size.

**Relevance**: LMSR demonstrated that AMMs were viable for pricing assets. It was implemented in prediction markets (Gnosis, Augur) before DeFi.

### 3. Ethereum AMM Development (2015-2017)

The precise intellectual lineage within the Ethereum community:

| Date | Contributor | Contribution |
|------|-------------|--------------|
| **Sep 2, 2015** | Martin Köppelmann | Proposed integrating market maker into orderbook (Gnosis) |
| **Sep 26, 2016** | Nick Johnson | Introduced "Euler" concept—single token paired against all |
| **Oct 3, 2016** | Vitalik Buterin | Reddit post connecting prior concepts; suggested AMMs like prediction markets |
| **Mar 6, 2017** | Alan Lu (Gnosis) | Explored various invariant designs |
| **Jun 2017** | Bancor | Launched bonding curves for continuous liquidity |
| **Mar 2, 2018** | Vitalik Buterin | Revisited earlier post; discussed Martin Köppelmann's x*y=k formula |

[@misc_adjacent_amm_history]

### 4. Bonding Curves (2017)

**Bancor (June 2017)** — Introduced bonding curves for continuous token liquidity via smart contracts. [@whitepaper_bancor_2017]

Bancor's formula:
```
Price = Reserve / (Supply * CRR)
```

Where CRR (Connector Reserve Ratio) determines price sensitivity.

**Key innovation**: On-chain, permissionless liquidity without order books.

**Relevance**: Bancor proved the concept but was more complex than necessary for simple token swaps.

---

## First Formalization

### Köppelmann's x*y=k

**Martin Köppelmann** (Gnosis) proposed the constant product formula, which Vitalik Buterin discussed in a March 2, 2018 post. The formula's elegance—its simplicity and guaranteed liquidity—made it ideal for implementation.

### Uniswap V1 (November 2018)

**Hayden Adams** launched Uniswap with the constant product formula. [@blog_adams_uniswap_2018]

The formalization was remarkably simple:
- ETH/ERC-20 pairs only
- No governance token
- 0.3% fee to liquidity providers
- Fully permissionless pool creation
- Received Ethereum Foundation grant (August 2018)

Adams was directly inspired by Vitalik's October 3, 2016 Reddit post suggesting AMMs should work like prediction market makers.

---

## First Major Deployment

**Uniswap V1 Mainnet** — November 2, 2018

Initial characteristics:
- Deployed on Ethereum mainnet
- Gas-efficient (~100k gas per swap)
- No admin keys or upgradeability
- Entirely automated liquidity provision

Adoption was gradual until DeFi Summer 2020.

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| Jun 2017 | Bancor ICO | First on-chain continuous liquidity ($153M raised) |
| Nov 2018 | Uniswap V1 launch | Constant product formula; simpler than Bancor |
| May 2020 | Uniswap V2 launch | ERC-20/ERC-20 pairs, flash swaps, TWAP oracles |
| Jan 2020 | Curve launch (StableSwap) | Specialized invariant for like-assets |
| Sep 2020 | SushiSwap fork | "Vampire attack"; SUSHI token |
| May 2021 | Uniswap V3 launch | Concentrated liquidity; capital efficiency |
| Feb 2022 | Solidly launch | ve(3,3) tokenomics |
| 2024-25 | Uniswap V4 | Hooks for customizable pools |

### TVL Progression

| Date | Uniswap TVL | Context |
|------|-------------|---------|
| Jan 2020 | ~$40M | Pre-DeFi Summer |
| Aug 2020 | ~$300M | DeFi Summer begins |
| Dec 2020 | ~$2B | Post-SUSHI war |
| May 2021 | ~$10B | V3 launch |
| Nov 2021 | ~$15B | Market peak |
| 2024 | ~$5-8B | Post-bear market |

---

## Common Misattributions

### 1. "Uniswap invented AMMs"

**Misconception**: Uniswap created the concept of automated market makers.

**Reality**: AMMs existed in prediction markets (Hanson's LMSR, 2003) and on-chain (Bancor, 2017) before Uniswap. Uniswap's contribution was radical simplification, not invention.

**Confidence**: HIGH

**Sources**: [@whitepaper_bancor_2017; @article_hanson_lmsr_2003]

### 2. "The constant product formula is novel to DeFi"

**Misconception**: x*y=k is a crypto-native innovation.

**Reality**: Constant function market makers have theoretical roots in economics. The specific application to token swaps was novel, but the mathematical concept was not.

**Confidence**: MEDIUM

**Notes**: The extent of direct influence from academic literature on Adams is unclear. He may have independently arrived at the formula.

### 3. "Hayden Adams invented x*y=k"

**Misconception**: Adams derived the formula himself.

**Reality**: Adams has credited a Vitalik Buterin Reddit post as inspiration. The formula is simple enough to be independently discovered by many. The innovation was implementation and UX, not the math.

**Confidence**: MEDIUM

**Sources**: Adams interviews; Buterin Reddit posts (need primary source verification)

---

## Open Questions

1. **Direct lineage from Hanson**: Did Adams or the Uniswap team study LMSR or prediction market AMMs? Or was x*y=k an independent rediscovery?

2. **Bancor → Uniswap relationship**: Did Uniswap consciously simplify Bancor's model, or develop independently?

3. **Optimal invariant design**: Is constant product optimal for general-purpose swaps, or are specialized invariants (Curve, Balancer) strictly better for their use cases?

4. **Impermanent loss attribution**: Who first identified and named "impermanent loss"? This term emerged in the community but lacks clear attribution.

5. **Capital efficiency limits**: Uniswap V3's concentrated liquidity improves capital efficiency but introduces new risks. What's the theoretical limit?

---

## Technical Details

### Price Calculation

Given reserves (x, y), the marginal price is:
```
Price of Y in terms of X = x / y
```

After a swap of Δx:
```
Δy = y - k / (x + Δx)
Δy = y * Δx / (x + Δx)  // simplified
```

### Slippage

Price impact for large trades:
```
Slippage = Δy / y_ideal - 1
```

Where `y_ideal = Δx * (y/x)` (no-slippage price).

### Fee Implementation

Uniswap applies fees before the swap:
```
Δx_effective = Δx * (1 - fee)
```

The fee accrues to k, increasing LP returns.

---

## Variants and Extensions

| Protocol | Invariant | Use Case |
|----------|-----------|----------|
| Uniswap V2 | x*y=k | General-purpose swaps |
| Curve StableSwap | Modified to reduce slippage near peg | Stablecoins, like-assets |
| Balancer | Σ(w_i * x_i) = k | Multi-asset weighted pools |
| Uniswap V3 | Concentrated x*y=k | Capital-efficient ranges |

---

## EVM Relevance

The constant product AMM is perhaps the most important DeFi primitive:

1. **Composability**: AMMs are building blocks for complex DeFi protocols
2. **Oracles**: TWAP (time-weighted average price) from AMMs provides on-chain price feeds
3. **Flash loans**: AMM liquidity can be borrowed within a single transaction
4. **MEV**: AMM trades are primary MEV extraction targets

Understanding x*y=k is essential for:
- Building DeFi protocols
- Security auditing (sandwich attacks, oracle manipulation)
- Gas optimization (efficient swap routing)
- Protocol governance (fee parameters, liquidity incentives)

---

## Citations

[@article_hanson_lmsr_2003]
[@whitepaper_bancor_2017]
[@blog_adams_uniswap_2018]
[@whitepaper_uniswap_v2_2020]
[@whitepaper_curve_stableswap_2020]
[@whitepaper_uniswap_v3_2021]
[@article_garman_market_1976]
[@article_amihud_dealership_1980]

---

## Cross-References

- [Fee Markets & EIP-1559](fee_markets_eip1559.md) — Gas economics affect AMM trade viability
- [MEV & Auctions](mev_and_auctions.md) — AMMs are primary MEV extraction targets
- [Stablecoins & Collateral](stablecoins_and_collateral.md) — Curve's specialized AMM for stables
