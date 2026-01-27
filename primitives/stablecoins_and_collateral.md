# Stablecoins & Collateral

## Definition

Stablecoins are cryptocurrencies designed to maintain a stable value, typically pegged to fiat currency (USD). Main types:

1. **Fiat-backed**: Reserves held in banks (USDC, USDT)
2. **Crypto-backed**: Over-collateralized with crypto (DAI)
3. **Algorithmic**: Mechanism-based stability (failed: UST)
4. **Delta-neutral**: Hedged positions (USDe)

Collateralization refers to assets backing a position, critical for:
- Stablecoin minting
- Lending protocols
- Derivatives

---

## Precursor Lineage

### 1. Digital Cash Attempts (1990s)

**eCash (DigiCash, 1990s)** — David Chaum's digital cash:
- Centralized issuer
- Bank-backed value
- Failed commercially

Lesson: Centralized digital dollars have existed; the challenge is decentralization.

### 2. BitUSD (2014)

**BitShares** introduced the first crypto-collateralized stablecoin:
- Collateralized by BTS
- Algorithmic price feeds
- Peg maintenance via incentives

Partially successful, proved the concept.

### 3. MakerDAO & DAI (2017)

**MakerDAO (2017)** launched single-collateral DAI (SAI):
- Collateralized by ETH only
- 150%+ collateralization ratio
- Stability fee (interest rate)
- Liquidation mechanism

[@online_makerdao_whitepaper_2017]

**Multi-Collateral DAI (2019)** expanded to multiple collateral types.

### 4. Centralized Stablecoins (2018+)

**Tether (USDT)** — Earliest; controversial reserves
**USDC (2018)** — Circle; fully reserved, transparent
**BUSD (2019)** — Paxos/Binance; regulatory issues led to discontinuation

---

## First Formalization

### Crypto-Collateralized

**MakerDAO whitepaper (2017)** formalized:
- CDP (Collateralized Debt Position) mechanics
- Liquidation ratios and penalties
- Stability fee and DSR (DAI Savings Rate)
- Governance via MKR token

### Algorithmic (Failed Model)

**Basis (2017)** proposed seigniorage shares model:
- Basis tokens, Bonds, Shares
- Algorithmic expansion/contraction
- Never launched (regulatory)

Similar models (UST/Luna) failed spectacularly.

---

## First Major Deployment

| Date | Stablecoin | Type | Notes |
|------|------------|------|-------|
| 2014 | Tether (USDT) | Fiat-backed | First major stablecoin |
| 2017 | SAI (Single DAI) | Crypto-backed | ETH-only collateral |
| 2018 | USDC | Fiat-backed | Fully reserved |
| 2019 | DAI (Multi) | Crypto-backed | Multiple collaterals |
| 2020 | UST | Algorithmic | Collapsed May 2022 |
| 2024 | USDe | Delta-neutral | Hedged positions |

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2014 | Tether launch | First major stablecoin |
| 2017 | MakerDAO SAI | Decentralized stablecoin |
| 2018 | USDC launch | Regulated fiat-backed |
| 2019 | Multi-collateral DAI | Expanded collateral |
| 2020 | Stablecoin TVL explodes | DeFi Summer |
| Mar 2023 | USDC depeg (SVB) | Temporary 87¢ floor |
| May 2022 | **UST/Luna collapse** | $40B+ destroyed |
| 2024 | Ethena USDe | Delta-neutral model |
| 2024 | MakerDAO → Sky | Rebrand |

### Stablecoin Market Cap

| Date | Total Supply | Top 3 |
|------|--------------|-------|
| 2020 | ~$20B | USDT, USDC, DAI |
| 2021 | ~$140B | USDT, USDC, BUSD |
| 2022 | ~$150B (peak) | Pre-UST collapse |
| 2023 | ~$130B | Post-collapse |
| 2024 | ~$160B | Recovery |

---

## The UST Collapse (May 2022)

**Terra/UST** used algorithmic stability:
- UST pegged via LUNA burn/mint
- Anchor Protocol offered 20% APY
- No real collateral backing

Collapse sequence:
1. Large UST sell pressure (May 7-8)
2. Peg breaks below $1
3. LUNA minting accelerates (death spiral)
4. Both tokens go to near-zero
5. ~$40B value destroyed

Lesson: Algorithmic stablecoins without collateral are fragile.

---

## Common Misattributions

### 1. "All stablecoins are the same risk"

**Misconception**: USDC, DAI, and UST had equivalent risk.

**Reality**: Vastly different:
- USDC: Bank-held reserves; SVB risk (realized briefly)
- DAI: Over-collateralized; liquidation risk
- UST: Algorithmic; death spiral risk (realized catastrophically)

**Confidence**: HIGH

### 2. "Algorithmic stablecoins can work"

**Misconception**: UST failed due to execution, not design.

**Reality**: Multiple algorithmic stables have failed similarly (Iron Finance, Basis Cash). The design is inherently fragile under bank-run dynamics.

**Confidence**: HIGH

### 3. "Over-collateralization is wasteful"

**Misconception**: 150% collateral is inefficient.

**Reality**: Over-collateralization provides the safety margin that makes DAI resilient. The "waste" is the cost of decentralized stability.

**Confidence**: HIGH

---

## Open Questions

1. **Regulatory classification**: Are stablecoins securities, commodities, or something else?

2. **Decentralization vs. stability**: Can fully decentralized stables achieve tight pegs?

3. **Collateral diversity**: What's the optimal collateral basket?

4. **Real-world assets (RWA)**: Should crypto stables hold US Treasuries?

5. **CBDC competition**: Will central bank digital currencies replace stablecoins?

---

## Technical Details

### MakerDAO Vault Mechanics

```solidity
// Collateralization ratio
ratio = (collateral_value / debt) * 100

// Minimum: 150% (for ETH)
// Liquidation: < 150% triggers auction

// Stability fee: Interest on DAI debt
// DSR: Interest earned on DAI savings
```

### Liquidation Process

```
1. Position falls below liquidation ratio
2. Keeper triggers liquidation
3. Collateral auctioned
4. Debt repaid + penalty
5. Excess returned to user (if any)
```

### Delta-Neutral (Ethena Model)

```
1. Deposit stETH as collateral
2. Protocol shorts ETH perpetual
3. Position is delta-neutral (no ETH price exposure)
4. Yield from staking + funding rates
5. USDe minted against position
```

Risk: Funding rate reversal, exchange counterparty risk.

---

## EVM Relevance

Stablecoins are fundamental to DeFi:

1. **Trading pairs**: Most liquidity is in stablecoin pairs
2. **Lending collateral**: USDC, DAI commonly deposited
3. **Payment rails**: On-chain dollar payments
4. **Yield generation**: Stablecoin farming
5. **Risk management**: Hedging volatile positions

### Stablecoin Standards

Most stablecoins use ERC-20, but with extensions:
- **Blacklisting**: USDC can freeze addresses
- **Upgradeability**: Most use proxy patterns
- **Permit**: EIP-2612 for gasless approvals

---

## Citations

[@online_makerdao_whitepaper_2017]

---

## Cross-References

- [AMM Constant Product](amm_constant_product.md) — Stablecoin pairs, Curve
- [Fee Markets & EIP-1559](fee_markets_eip1559.md) — Transaction costs affect usage
- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — Stablecoin bridging
