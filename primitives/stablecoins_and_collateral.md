# Stablecoins & Collateral

## Definition

Stablecoins are cryptocurrencies designed to maintain a stable value, typically pegged to fiat currency (USD) or commodities (gold). Main types:

1. **Fiat-backed**: Reserves held in banks (USDC, USDT, TUSD, GUSD, PYUSD)
2. **Crypto-backed**: Over-collateralized with crypto (DAI, LUSD)
3. **Algorithmic**: Mechanism-based stability (failed: UST, NuBits)
4. **Hybrid**: Partial collateral + algorithmic adjustment (FRAX)
5. **Synthetic**: Protocol-minted via overcollateralized positions (sUSD)
6. **Delta-neutral**: Hedged positions (USDe)
7. **Commodity-backed**: Physical asset reserves (PAXG, XAUT)
8. **RWA-backed**: Tokenized real-world assets (USDY, BUIDL yields)

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

### 2. BitUSD (July 21, 2014)

**BitShares** introduced the first crypto-collateralized stablecoin:
- Created by **Charles Hoskinson** and **Dan Larimer** (later of EOS, Steemit, Cardano)
- Launched on BitShares decentralized exchange
- **200% collateralization** in BTS required
- Escrow-type smart contract ensured repurchase near par
- Shorting mechanism: acquirer shorts USD/BTS by posting collateral

**Design flaw**: Protected against BTS price falls but not against BitUSD price drops below peg.

**Failure timeline**:
- April 2015: Market cap peaked >$1M
- November 2015: Fell below $200k
- **November 25, 2018**: "Global settlement" triggered — too under-collateralized
- Currently trades ~$0.80

### 3. NuBits (September 2014)

**Nu** introduced the first algorithmic/seigniorage stablecoin:
- Dual-token system: NuBits (USNBT) + NuShares (NSR)
- Uncollateralized, algorithmically backed
- Supply expansion/contraction to maintain peg
- "Parking" rates to incentivize holding during contraction

**2016 crash** (May-June):
- Bitcoin price spiked
- Holders mass-sold NuBits to buy BTC
- Peg broke; stayed broken 3 months
- Recovered eventually

**2018 crash** (December 2017 - early 2018):
- Bitcoin's "Christmas crash" drove people INTO NuBits
- Market cap grew 1,500% ($950k → $14M)
- Price peaked ~$1.50 (Dec 20-28)
- Then collapse when sentiment reversed
- Never recovered

**Design flaw**: Fractional reserve couldn't handle demand fluctuations. No diversified collateral to absorb sell pressure.

**Current status**: Trades ~$0.03-0.30 (varies); effectively dead.

**Significance**: First pure algorithmic stablecoin. Both crashes presaged UST collapse — demonstrated that seigniorage models fail under bank-run dynamics without adequate reserves.

### 4. MakerDAO & DAI (2017)

**MakerDAO (2017)** launched single-collateral DAI (SAI):
- Collateralized by ETH only
- 150%+ collateralization ratio
- Stability fee (interest rate)
- Liquidation mechanism

[@online_makerdao_whitepaper_2017]

**Multi-Collateral DAI (2019)** expanded to multiple collateral types.

### 5. Centralized Stablecoins (2014+)

**Tether (USDT, 2014)** — Earliest fiat-backed; controversial reserves
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

**NuBits (2014)** was the first deployed algorithmic stablecoin:
- Seigniorage-based supply management
- Dual-token system (NuBits + NuShares)
- Failed 2016 and 2018 due to insufficient reserves

**Basis (2017)** proposed but never launched:
- Basis tokens, Bonds, Shares
- Algorithmic expansion/contraction
- Shut down due to regulatory concerns

Similar models (UST/Luna) failed spectacularly in 2022.

---

## First Major Deployment

| Date | Stablecoin | Type | Notes |
|------|------------|------|-------|
| Jul 2014 | BitUSD | Crypto-collateralized | First stablecoin; 200% BTS collateral |
| Sep 2014 | NuBits | Algorithmic | First seigniorage model; failed 2018 |
| Oct 2014 | Tether (USDT) | Fiat-backed | First major fiat-backed |
| 2017 | SAI (Single DAI) | Crypto-backed | ETH-only collateral |
| 2018 | USDC | Fiat-backed | Fully reserved, regulated |
| 2018 | TUSD | Fiat-backed | TrueUSD; daily attestations |
| 2018 | GUSD | Fiat-backed | Gemini Dollar; NYDFS regulated |
| 2018 | USDP | Fiat-backed | Pax Dollar; Paxos (formerly PAX) |
| 2018 | Pax Gold (PAXG) | Commodity-backed | First gold-backed stablecoin |
| 2019 | DAI (Multi) | Crypto-backed | Multiple collaterals |
| 2019 | sUSD | Synthetic | Synthetix; crypto-collateralized synthetic |
| 2019 | FRAX | Hybrid | Partial collateral + algorithmic |
| 2020 | UST | Algorithmic | Collapsed May 2022 |
| 2020 | LUSD | Crypto-backed | Liquity; ETH-only, immutable |
| Jun 2021 | MIM | Crypto-backed | Abracadabra; ibToken collateral; Sifu scandal 2022 |
| 2023 | PYUSD | Fiat-backed | PayPal's stablecoin |
| 2024 | USDe | Delta-neutral | Ethena; hedged positions |
| 2024 | FDUSD | Fiat-backed | First Digital; top 10 by cap |
| 2024 | RLUSD | Fiat-backed | Ripple's stablecoin |
| Apr 2025 | USD1 | Fiat-backed | World Liberty Financial |

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| Jul 2014 | BitUSD launch | First crypto-collateralized stablecoin |
| Sep 2014 | NuBits launch | First algorithmic stablecoin |
| Oct 2014 | Tether launch | First fiat-backed stablecoin |
| Jun 2016 | NuBits first depeg | Recovered after 3 months |
| 2017 | MakerDAO SAI | First decentralized stablecoin on Ethereum |
| 2018 | USDC launch | Regulated fiat-backed |
| 2018 | Pax Gold (PAXG) launch | First gold-backed stablecoin |
| Nov 2018 | BitUSD global settlement | Under-collateralization failure |
| Dec 2017-2018 | NuBits final collapse | Never recovered |
| 2019 | Multi-collateral DAI | Expanded collateral types |
| 2019 | FRAX launch | First hybrid collateral/algorithmic model |
| 2020 | Stablecoin TVL explodes | DeFi Summer |
| 2020 | Liquity (LUSD) launch | Immutable, ETH-only CDP |
| Jun 2021 | Abracadabra MIM launch | ibToken-backed; peaked $4.6B market cap |
| Oct 2021 | MIM crosses $1B | 7th largest stablecoin |
| Jan 2022 | **MIM/Wonderland Sifu scandal** | CFO revealed as QuadrigaCX co-founder |
| May 2022 | **UST/Luna collapse** | $40B+ destroyed |
| Mar 2023 | USDC depeg (SVB) | Temporary 87¢ floor; recovered same week |
| Aug 2023 | PayPal PYUSD launch | First major fintech stablecoin |
| 2024 | Ethena USDe | Delta-neutral model; rapid growth |
| 2024 | MakerDAO → Sky | Rebrand to Sky, DAI → USDS |
| 2024 | FDUSD, RLUSD launch | New institutional stablecoins |
| Apr 2025 | USD1 launch | World Liberty Financial entry |

### Stablecoin Market Cap

| Date | Total Supply | Top Stablecoins |
|------|--------------|-----------------|
| 2020 | ~$20B | USDT, USDC, DAI |
| 2021 | ~$140B | USDT, USDC, BUSD |
| 2022 | ~$150B (peak) | Pre-UST collapse |
| 2023 | ~$130B | Post-collapse recovery |
| 2024 | ~$170B | USDT, USDC, USDe, DAI |
| 2025 | ~$200B+ | USDT dominant; new entrants growing |

**2025 Market Leaders**:
1. USDT — Dominant market share (~60%)
2. USDC — Regulated, transparent
3. DAI/USDS — Decentralized, crypto-backed
4. USDe — Fastest-growing delta-neutral
5. FDUSD — New institutional entrant

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

## Stablecoin Design Variations

### Hybrid Model (FRAX)

**Frax (2019)** pioneered the hybrid approach:
- Partial collateralization (adjustable 50-100%)
- Algorithmic supply adjustment for remainder
- Collateral ratio increases during instability
- More capital-efficient than fully collateralized
- Survived where pure algorithmic models failed

### Commodity-Backed

Gold-backed stablecoins tokenize physical reserves:

| Stablecoin | Backing | Storage | Notes |
|------------|---------|---------|-------|
| PAXG | 1 troy oz gold | London vaults | Redeemable for physical |
| XAUT | 1 troy oz gold | Swiss vaults | Tether's gold offering |

Use cases: Inflation hedge, gold exposure without custody.

### Immutable Protocols (LUSD)

**Liquity (2020)** introduced immutable lending:
- No governance; code is final
- ETH-only collateral
- 110% minimum collateralization
- Recovery mode for systemic risk
- Cannot be upgraded or shut down

Trade-off: Inflexibility vs. censorship resistance.

### Interest-Bearing Token Model (MIM)

**Abracadabra.money (June 2021)** introduced borrowing against yield-bearing collateral:
- Collateral: Interest-bearing tokens (yvUSDC, xSUSHI, yvWETH)
- Users unlock liquidity from "stranded capital" in yield farms
- Multi-chain deployment (Ethereum, Avalanche, Fantom, BSC, Arbitrum)
- SPELL governance token; stakers receive 75% of fees
- Founders: Daniele Sestagalli + "Squirrel" (pseudonymous)

**Rise and fall**:
- Oct 2021: MIM crosses $1B, becomes 7th largest stablecoin
- Peak: $4.6B market cap, part of "Frog Nation" ecosystem (with Wonderland, Popsicle)
- Jan 27, 2022: **Sifu scandal** — Wonderland CFO "Sifu" revealed as Michael Patryn (QuadrigaCX co-founder, convicted fraudster)
- Impact: MIM depegged, SPELL collapsed 84%, Wonderland TIME fell 97%
- Market cap dropped from $4.6B to ~$2.85B
- Governance vote (55%) kept project alive; Sifu removed
- Current: ~$100M market cap; protocol still operational

**Lesson**: Protocol reputation risk is real. Anonymous team members can hide problematic histories.

### Institutional Stablecoins (2023-2025)

Traditional finance entered the market:

| Stablecoin | Issuer | Launch | Significance |
|------------|--------|--------|--------------|
| PYUSD | PayPal | Aug 2023 | First major fintech |
| FDUSD | First Digital | 2024 | Institutional focus |
| RLUSD | Ripple | 2024 | Cross-border payments |
| USD1 | World Liberty Financial | Apr 2025 | Newest major entrant |

Trend: Regulated entities launching compliant stablecoins to capture market share.

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
- [RWA Tokenization](rwa_tokenization.md) — Tokenized treasuries, yield-bearing stables
- [DeFi Lending](defi_lending.md) — Stablecoin lending markets
