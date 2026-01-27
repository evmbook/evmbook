# DeFi Derivatives

## Definition

**DeFi derivatives** are on-chain financial instruments whose value is derived from underlying assets, enabling exposure to price movements, volatility, or other metrics without holding the underlying. Key forms include perpetual swaps, options, and structured products.

**Core innovation**: Smart contracts enable trustless, permissionless derivative creation and settlement without traditional clearinghouses or counterparty risk.

---

## Precursor Lineage

### 1. Traditional Derivatives (1970s+)

| Development | Year | Significance |
|-------------|------|--------------|
| Black-Scholes | 1973 | Options pricing formula |
| Chicago Board Options Exchange | 1973 | First listed options exchange |
| Perpetual futures | 1992 | Shiller proposal; no expiry |
| BitMEX XBTUSD | 2016 | First crypto perpetual swap |

**BitMEX innovation**: Introduced funding rate mechanism to anchor perpetual price to spot without expiry or physical settlement.

### 2. AMM-Derivatives Connection (2020+)

Key insight from academic research:

**LP positions replicate options**. A Uniswap V2 LP position has payoff structure similar to a short straddle. Uniswap V3 concentrated liquidity positions replicate **perpetual put and call options**.

[@article_replicating_portfolio_2020]

---

## First Formalization

### Perpetual Swap Mechanics

**Funding rate** keeps perp price anchored to index:

```
If perp_price > index_price: Longs pay shorts (positive funding)
If perp_price < index_price: Shorts pay longs (negative funding)

Funding payment = position_size × funding_rate × (perp_price / index_price - 1)
```

**Effect**: Arbitrageurs trade the basis, keeping perpetual close to spot.

### Virtual AMM (vAMM)

**Perpetual Protocol** (2020) introduced vAMM:
- No real liquidity in the AMM
- Virtual reserves track positions
- Funding rate from vAMM price vs oracle
- Insurance fund backs liquidations

```
Trade → Updates virtual reserves → New mark price
Funding rate = (mark_price - index_price) / index_price × time_factor
```

[@misc_perpetual_protocol]

---

## Protocol Taxonomy

### Perpetual Swaps

| Protocol | Design | Launch | Notes |
|----------|--------|--------|-------|
| **dYdX** | Orderbook + StarkEx | 2021 | Largest DEX perps by volume |
| **Perpetual Protocol** | vAMM | 2020 | First vAMM perpetual |
| **GMX** | GLP pool | 2021 | Zero slippage, oracle-based |
| **Gains Network** | Synthetic DAI | 2021 | Up to 150x leverage |
| **Drift** | Dynamic AMM | 2021 | Solana; hybrid orderbook |
| **Hyperliquid** | Orderbook | 2023 | L1 for perpetuals |

### Options

| Protocol | Design | Launch | Notes |
|----------|--------|--------|-------|
| **Hegic** | Liquidity pool | 2020 | Early on-chain options |
| **Opyn** | 0x orderbook | 2020 | oTokens standard |
| **Lyra** | Dynamic vol AMM | 2021 | Black-Scholes based |
| **Dopex** | Single staking | 2021 | Atlantic options |
| **Premia** | Orderbook + pool | 2021 | Vol surface pricing |
| **Panoptic** | Uniswap V3 LP | 2023 | Oracle-free perp options |

### Structured Products

| Protocol | Product | Notes |
|----------|---------|-------|
| **Ribbon Finance** | Covered call vaults | Automated option selling |
| **Friktion** | Strategy vaults | Solana; volt system |
| **Thetanuts** | Exotic options | Multi-chain vaults |
| **Cega** | Fixed coupon | Exotic payoffs |

---

## Key Innovations

### 1. Replicating Market Makers (RMM)

**Stanford research** showed AMMs can replicate arbitrary payoffs:

```
RMM trading function: φ(R_x, R_y) = 0

For any desired payoff V(S):
  Construct φ such that LP position replicates V(S)
```

[@article_rmm_stanford]

**Primitive Finance** implemented RMM-01 for options replication without oracles.

### 2. Power Perpetuals (Squeeth)

**Paradigm** introduced power perpetuals:

```
Squeeth payoff = ETH²

Unlike linear perps:
- Convex payoff (always positive exposure)
- Built-in gamma (acceleration)
- Hedges LP impermanent loss
```

[@misc_paradigm_power_perps]

**Opyn Squeeth**: First power perpetual implementation (2022).

### 3. Perpetual Options (Panoptic)

**Key insight**: Uniswap V3 LP positions ARE perpetual options:

```
LP position in range [p_a, p_b]:
- Short put below p_a
- Short call above p_b
- Collect "theta" via trading fees
```

Panoptic enables:
- Buying and selling perpetual options
- No oracle needed (uses Uniswap prices)
- Greeks derived from LP position

[@article_panoptic_2022]

### 4. JIT (Just-in-Time) Liquidity

```
Atomic sequence:
1. Observe pending trade
2. Deposit liquidity
3. Trade executes against your liquidity
4. Withdraw liquidity + fees

Effect: Concentrated liquidity provision for single trade
```

Bridges AMM and orderbook models.

---

## Economic Model

### Funding Rates

| Protocol | Funding Frequency | Calculation |
|----------|-------------------|-------------|
| dYdX | 1 hour | TWAP mark - index |
| GMX | Continuous | OI imbalance |
| Perpetual | 1 hour | vAMM mark - oracle |

### Fee Structures

| Protocol | Maker | Taker | Notes |
|----------|-------|-------|-------|
| dYdX | 0.02% | 0.05% | Fee tiers by volume |
| GMX | 0.1% | 0.1% | Flat fee |
| Gains | 0.08% | 0.08% | Dynamic spread |

### Insurance Funds

```
Liquidation cascade:
1. Position margin depleted
2. Liquidator takes over
3. If underwater: Insurance fund covers
4. If insurance depleted: Auto-deleverage (ADL)
```

---

## Risk Vectors

| Risk | Description | Mitigation |
|------|-------------|------------|
| **Oracle manipulation** | Index price attack | Multiple oracles, TWAP |
| **Liquidation cascades** | Mass liquidations spike gas | Dynamic fees, ADL |
| **Insurance depletion** | Large loss event | Capped OI, diversified collateral |
| **Smart contract risk** | Bug in protocol | Audits, insurance |
| **Funding rate risk** | Extreme rates | Caps, rebalancing incentives |

---

## Common Misattributions

### 1. "DeFi perps are like traditional futures"

**Reality**: DeFi perpetuals use funding rates and oracle prices, not physical delivery or expiry. They're more similar to CFDs (contracts for difference).

**Confidence**: HIGH

### 2. "vAMM provides liquidity"

**Reality**: vAMM is virtual—no real tokens. It's a pricing mechanism, not a liquidity source. Liquidity comes from LPs staking collateral or insurance funds.

**Confidence**: HIGH

### 3. "Options on-chain are just like TradFi options"

**Reality**: Most DeFi options are European-style, cash-settled, and often perpetual (no expiry). Oracle dependencies and gas costs create different dynamics.

**Confidence**: HIGH

---

## Open Questions

1. **Capital efficiency**: Can DeFi derivatives match centralized exchange capital efficiency?

2. **Composability risks**: How do derivative protocols interact in stress scenarios?

3. **Regulatory classification**: Are perpetuals securities, swaps, or something new?

4. **Oracle reliability**: Can derivatives survive oracle failure gracefully?

5. **L2 fragmentation**: Will derivatives liquidity fragment across L2s?

---

## Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2016 | BitMEX XBTUSD | First crypto perpetual |
| 2020 | Hegic launch | Early on-chain options |
| 2020 | Perpetual Protocol | First vAMM perpetual |
| 2020 | RMM research | AMM-options connection formalized |
| 2021 | dYdX L2 | StarkEx scaling for orderbook |
| 2021 | GMX launch | Oracle-based perps |
| 2021 | Paradigm Power Perps | Squeeth concept |
| 2022 | Opyn Squeeth | First power perpetual |
| 2023 | Panoptic | Perpetual options on Uniswap V3 |

---

## EVM Relevance

### Smart Contract Patterns

| Pattern | Use Case |
|---------|----------|
| **Proxy upgrades** | Protocol evolution |
| **Multicall** | Atomic position management |
| **Flash loans** | Arbitrage, liquidations |
| **ERC-20 collateral** | Position tokens |

### Gas Considerations

| Operation | Approx Gas | Notes |
|-----------|------------|-------|
| Open position | 200-400k | Depends on protocol |
| Close position | 150-300k | May trigger liquidation |
| Liquidation | 300-500k | Complex state updates |

L2 deployment essential for active trading.

---

## Citations

[@article_replicating_portfolio_2020]
[@article_rmm_stanford]
[@article_panoptic_2022]
[@misc_paradigm_everlasting_options]
[@misc_paradigm_power_perps]
[@misc_defi_derivatives]

---

## Primitive Cross-Links

- [AMM Constant Product](./amm_constant_product.md) — LP as options
- [MEV & Auctions](./mev_and_auctions.md) — Liquidation MEV
- [Stablecoins & Collateral](./stablecoins_and_collateral.md) — Margin collateral
- [Decentralized Oracles](./decentralized_oracles.md) — Price feeds
- [Fee Markets & EIP-1559](./fee_markets_eip1559.md) — Gas for derivatives
