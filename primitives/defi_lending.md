# DeFi Lending

## Definition

**DeFi lending protocols** enable permissionless borrowing and lending of crypto assets through smart contracts. Unlike traditional finance, these protocols use algorithmic interest rates, over-collateralization, and automated liquidation.

**Core mechanics**:
- **Supplying**: Deposit assets to earn interest
- **Borrowing**: Collateralize assets to borrow others
- **Interest rates**: Algorithmically determined by utilization
- **Liquidation**: Automated collateral seizure when undercollateralized

**Key innovation**: Pooled liquidity with algorithmic rates replaces bilateral lending agreements.

---

## Precursor Lineage

### 1. Traditional Money Markets

Money market funds (1970s+) pool investor capital for short-term lending:
- Commercial paper
- Treasury bills
- Certificates of deposit

Key characteristic: Pooled funds, managed rates.

### 2. Peer-to-Peer Lending (2005+)

**LendingClub (2006)**, **Prosper (2005)** introduced:
- Individual-to-individual lending
- Platform-mediated credit scoring
- Still required identity, credit checks

Lesson: P2P works, but centralized platforms add friction.

### 3. ETHLend (2017)

**ETHLend** (later Aave) launched peer-to-peer crypto lending:
- Order-book style: borrowers and lenders matched directly
- Fixed terms, fixed rates
- Required finding counterparty

**Problem**: Illiquid; hard to match borrowers and lenders.

### 4. Compound (2018)

**Robert Leshner** introduced the pooled lending model:
- Suppliers deposit to shared pool
- Borrowers draw from pool
- Interest rates determined algorithmically
- No counterparty matching needed

[@online_compound_whitepaper_2019]

This design became the template for all major lending protocols.

---

## First Formalization

### Compound's Interest Rate Model

**Leshner & Hayes (2019)** formalized algorithmic money markets:

**Utilization rate**:
```
U = Total Borrows / Total Supplied
```

**Interest rate** (jump rate model):
```
If U < kink:
  Rate = base_rate + U × multiplier
If U >= kink:
  Rate = base_rate + kink × multiplier + (U - kink) × jump_multiplier
```

**Effect**:
- Low utilization → low rates → incentivize borrowing
- High utilization → high rates → incentivize supply, discourage borrowing
- "Kink" creates steep rate increase near 100% utilization

### cToken Model

**Innovation**: Receipt tokens representing deposits + accrued interest.

```solidity
// Exchange rate increases over time
exchangeRate = (totalCash + totalBorrows - reserves) / totalSupply

// User's underlying = cTokens × exchangeRate
// Interest compounds every block automatically
```

**Key insight**: Interest compounds in token value, not token quantity. Users don't receive interest payments; their cTokens become worth more.

---

## First Major Deployment

### Compound (September 2018)

**Compound V1** launched with:
- ETH, USDC, DAI, REP, BAT, ZRX
- Algorithmic interest rates
- cToken receipt tokens
- Permissionless supply/borrow

**Compound V2 (May 2019)** added:
- More assets
- Refined rate models
- Governance preparation

**COMP Token (June 2020)** launched "yield farming":
- COMP distributed to suppliers and borrowers
- Triggered DeFi Summer
- Introduced "liquidity mining" concept

### Aave (January 2020)

**Aave V1** evolved from ETHLend:
- Pooled model (like Compound)
- aTokens (rebasing, not exchange rate)
- Variable and stable rate options
- **Flash loans** (groundbreaking)

**Aave V2 (December 2020)** added:
- Credit delegation
- Improved flash loans
- Gas optimizations

**Aave V3 (March 2022)** introduced:
- Efficiency mode (E-mode) for correlated assets
- Isolation mode for new assets
- Portal for cross-chain liquidity

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2017 | ETHLend launch | P2P crypto lending |
| Sep 2018 | Compound V1 | First pooled lending protocol |
| May 2019 | Compound V2 | Refined model |
| Jan 2020 | Aave V1 | Flash loans introduced |
| Jun 2020 | **COMP distribution** | Triggers DeFi Summer |
| Aug 2020 | YFI launch | Yield aggregation |
| Dec 2020 | Aave V2 | Credit delegation |
| 2021 | Lending TVL peaks | $50B+ across protocols |
| Mar 2022 | Aave V3 | Multi-chain, efficiency modes |
| 2023 | Morpho | Peer-to-peer optimization layer |
| 2024 | Aave V4 proposals | Further modularization |

### TVL Evolution

| Date | Compound TVL | Aave TVL | Notes |
|------|--------------|----------|-------|
| Jan 2020 | ~$100M | ~$30M | Pre-DeFi Summer |
| Sep 2020 | ~$1B | ~$1.5B | Post-COMP launch |
| May 2021 | ~$10B | ~$15B | Bull market peak |
| Jun 2022 | ~$3B | ~$6B | Post-Luna crash |
| Dec 2024 | ~$2.5B | ~$20B | Aave dominant |

---

## Protocol Comparison

### Interest Rate Models

| Protocol | Supply APY | Borrow APY | Model |
|----------|------------|------------|-------|
| Compound | Variable | Variable | Jump rate |
| Aave | Variable | Variable/Stable | Kink model |
| Morpho | Optimized | Optimized | P2P matching |

### Token Mechanics

| Protocol | Receipt Token | Interest Accrual |
|----------|---------------|------------------|
| Compound | cTokens | Exchange rate increases |
| Aave V2 | aTokens | Token balance increases (rebasing) |
| Aave V3 | aTokens | Rebasing |

### Feature Comparison

| Feature | Compound | Aave | Notes |
|---------|----------|------|-------|
| Flash loans | No | Yes | Aave innovation |
| Stable rates | No | Yes | Rate stability option |
| Cross-chain | Limited | V3 Portal | Aave ahead |
| Credit delegation | No | Yes | Uncollateralized via delegation |
| Isolation mode | No | Yes | Risk containment |

---

## Flash Loans

**Aave's breakthrough innovation** (2020): Borrow any amount with no collateral, repay in same transaction.

### Mechanics

```solidity
// Flash loan flow (single transaction)
1. Borrow N tokens from pool
2. Use tokens for arbitrage/liquidation/refinancing
3. Repay N + fee tokens
4. If repayment fails, entire transaction reverts
```

### Use Cases

| Use Case | Description |
|----------|-------------|
| **Arbitrage** | Exploit price differences across DEXs |
| **Liquidations** | Liquidate without capital |
| **Collateral swaps** | Change collateral type atomically |
| **Self-liquidation** | Close underwater positions |
| **Wash trading** | Inflate volumes (problematic) |

### Flash Loan Economics

| Protocol | Fee | Max Amount |
|----------|-----|------------|
| Aave V2 | 0.09% | Pool liquidity |
| Aave V3 | 0.05% (most) | Pool liquidity |
| dYdX | 0% | Pool liquidity |
| Uniswap V2/V3 | 0.3% (swap fee) | Pool liquidity |

**Historical note**: Flash loans enabled several exploits (bZx, Harvest Finance) but also enable efficient capital use.

---

## Liquidation Mechanisms

### How Liquidations Work

```
1. Health Factor = Σ(collateral × LTV) / Total Borrows
2. If Health Factor < 1: Position is liquidatable
3. Liquidator repays some debt
4. Liquidator receives collateral + bonus
5. User's debt and collateral reduced
```

### Liquidation Parameters

| Protocol | Liquidation Threshold | Liquidation Bonus | Close Factor |
|----------|----------------------|-------------------|--------------|
| Compound | 75-90% (varies) | 5-8% | 50% max |
| Aave | 80-95% (varies) | 4-10% | 50% max |

### Liquidation Example

```
User deposits 10 ETH ($20,000)
User borrows 12,000 USDC
LTV: 80%, Liquidation threshold: 85%

ETH drops to $1,500 (10 ETH = $15,000)
Health Factor = $15,000 × 0.85 / $12,000 = 1.0625 ✓

ETH drops to $1,400 (10 ETH = $14,000)
Health Factor = $14,000 × 0.85 / $12,000 = 0.99 ✗

Liquidator can repay up to 50% of debt:
- Repays 6,000 USDC
- Receives ~4.5 ETH ($6,300 at 5% bonus)
```

### MEV and Liquidations

Liquidations are major MEV source:
- Searchers monitor positions near liquidation
- Priority gas auctions for liquidation rights
- Flashbots bundles for atomic liquidations
- ~$50M+ extracted annually from liquidations

---

## Key Innovations

### 1. Algorithmic Interest Rates

**Before Compound**: Fixed rates, bilateral negotiation
**After Compound**: Market-clearing rates, no negotiation

Implication: Capital finds its market price automatically.

### 2. Composability via Receipt Tokens

cTokens and aTokens are ERC-20:
- Can be transferred
- Can be used as collateral elsewhere
- Can be traded
- Enables "money legos"

### 3. Governance Tokens as Incentives

COMP distribution showed:
- Tokens can bootstrap liquidity
- "Yield farming" as growth mechanism
- Governance decentralization via distribution

### 4. Flash Loans Enable Capital Efficiency

Eliminating collateral requirement for atomic operations:
- Democratizes arbitrage
- Enables complex DeFi strategies
- Creates new attack vectors

---

## Common Misattributions

### 1. "DeFi lending is like traditional lending"

**Misconception**: Same mechanics, just on blockchain.

**Reality**: Fundamental differences:
- Over-collateralized (no credit scores)
- Algorithmic rates (no human underwriting)
- Instant liquidation (no collections)
- Permissionless (no KYC)

**Confidence**: HIGH

### 2. "Flash loans are primarily for attacks"

**Misconception**: Flash loans exist to enable exploits.

**Reality**: Most flash loan volume is legitimate:
- Arbitrage (market efficiency)
- Collateral swaps (user benefit)
- Liquidations (protocol health)
- Exploits are minority use case

**Confidence**: HIGH

### 3. "Higher APY means better protocol"

**Misconception**: Compare protocols by yield alone.

**Reality**: APY depends on:
- Token incentives (temporary)
- Utilization (supply/demand)
- Risk parameters
- High APY often means higher risk

**Confidence**: HIGH

### 4. "Compound invented DeFi lending"

**Misconception**: Compound was first.

**Reality**: ETHLend predates Compound, but used P2P model. Compound innovated the **pooled** model that became standard.

**Confidence**: HIGH

---

## Open Questions

1. **Capital efficiency**: Can lending protocols achieve higher utilization safely?

2. **Undercollateralized lending**: Can on-chain credit scoring enable unsecured loans?

3. **Cross-chain**: How to safely lend across chains?

4. **Real-world assets**: Should DeFi lending protocols accept RWA collateral?

5. **Rate stability**: Can protocols offer truly stable rates long-term?

6. **Liquidation cascades**: How to prevent systemic liquidation spirals?

---

## Technical Details

### Compound V2 Architecture

```
Comptroller (risk parameters)
    ├── cToken (ETH)
    ├── cToken (USDC)
    ├── cToken (DAI)
    └── ... (one per asset)

InterestRateModel (algorithmic rates)
    └── Determines supply/borrow APY

PriceOracle (Chainlink)
    └── Asset prices for collateral value
```

### Aave V3 Architecture

```
PoolAddressesProvider
    └── Pool (main lending pool)
        ├── PoolCore (supply/borrow logic)
        ├── PoolConfigurator (admin)
        └── DataProvider (views)

AaveOracle (Chainlink)
    └── Price feeds

aTokens / debtTokens
    └── Per-asset receipt tokens
```

### Interest Rate Calculation (Compound)

```solidity
// Per-block interest accrual
function accrueInterest() external {
    uint blockDelta = block.number - accrualBlockNumber;
    uint interestFactor = borrowRate * blockDelta;

    totalBorrows = totalBorrows + (totalBorrows * interestFactor / 1e18);
    totalReserves = totalReserves + (totalBorrows * interestFactor * reserveFactor / 1e18);

    // Exchange rate increases
    exchangeRate = (getCash() + totalBorrows - totalReserves) / totalSupply;
}
```

---

## Key Figures

### Robert Leshner (Compound)

**Background**: Economics, Wharton MBA; previously CFO at Postmates.

**Contributions**:
- Founded Compound (2017)
- Designed pooled lending model
- COMP governance token
- Later founded Superstate (TradFi/DeFi bridge)

**Significance**: Created the template for all DeFi money markets.

### Stani Kulechov (Aave)

**Background**: Law studies, Finland; self-taught developer.

**Contributions**:
- Founded ETHLend (2017)
- Pivoted to Aave (pooled model, 2020)
- Introduced flash loans
- Aave V2/V3 innovations
- Founded Lens Protocol (social)

**Significance**: Flash loans were paradigm-shifting for DeFi capital efficiency.

---

## EVM Relevance

### Smart Contract Patterns

| Pattern | Use in Lending |
|---------|----------------|
| **Proxy upgrades** | Protocol evolution |
| **Reentrancy guards** | Flash loan safety |
| **Pull over push** | Interest accrual |
| **Oracles** | Price feeds for collateral |

### Gas Considerations

| Operation | Approx Gas | Notes |
|-----------|------------|-------|
| Supply | 150-250k | Mint cTokens |
| Borrow | 300-400k | Health factor check |
| Repay | 150-200k | Debt reduction |
| Liquidation | 400-600k | Complex state updates |
| Flash loan | 100-200k + callback | Plus user logic |

### Integration Pattern

```solidity
// Supplying to Compound
IERC20(underlying).approve(cToken, amount);
CErc20(cToken).mint(amount);

// Borrowing
CErc20(cToken).borrow(borrowAmount);

// Flash loan (Aave)
IPool(pool).flashLoanSimple(
    address(this),  // receiver
    asset,
    amount,
    params,
    referralCode
);
```

---

## Citations

[@online_compound_whitepaper_2019]
[@online_aave_v3_2022]
[@article_daian_flashboys_2019]

---

## Cross-References

- [Stablecoins & Collateral](stablecoins_and_collateral.md) — Collateral types, MakerDAO
- [MEV & Auctions](mev_and_auctions.md) — Liquidation MEV
- [AMM Constant Product](amm_constant_product.md) — DEX integration
- [Decentralized Oracles](decentralized_oracles.md) — Price feeds
- [Token Standards Evolution](token_standards_evolution.md) — cTokens, aTokens
