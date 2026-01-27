# Fee Markets & EIP-1559

## Definition

EIP-1559 reformed Ethereum's transaction fee mechanism, replacing first-price auctions with:

- **Base fee**: Algorithmically determined; burned (destroyed)
- **Priority fee** (tip): User-set; paid to block producer
- **Max fee**: User's ceiling for total fee

Formula:
```
Transaction fee = (base_fee + priority_fee) * gas_used
Base fee goes to: burned
Priority fee goes to: block producer
```

The base fee adjusts dynamically to target 50% block utilization.

---

## Precursor Lineage

### 1. First-Price Auction Model (2009-2021)

Bitcoin and pre-1559 Ethereum used first-price auctions:
- Users bid gas prices
- Highest bidders included first
- Creates uncertainty and overpaying

Problems:
- Fee volatility
- Poor UX (estimating optimal gas price)
- MEV extraction via fee manipulation

### 2. Mechanism Design Research

**Auction theory** (Vickrey, Milgrom) established:
- First-price auctions lead to inefficient bidding
- Second-price auctions (Vickrey) are incentive-compatible
- Optimal mechanisms depend on context

### 3. EIP-1559 Proposal (2019)

**Buterin et al. (2019)** — EIP-1559 proposed:
- Elastic block sizes (target vs. max)
- Algorithmic base fee
- Fee burning to align incentives

[@eip_buterin_1559_2019]

**Roughgarden (2020)** — Economic analysis proved:
- EIP-1559 is incentive-compatible under assumptions
- Improves UX through predictable base fee
- Doesn't necessarily reduce average fees

[@article_roughgarden_eip1559_2020]

---

## First Formalization

**EIP-1559 (2019)** — "Fee Market Change for ETH 1.0 Chain"

Authors: Vitalik Buterin, Eric Conner, Rick Dudley, Matthew Slipper, Ian Norden, Abdelhamid Bakhta

Key mechanism:
```
if block_gas_used > target:
    base_fee increases by up to 12.5%
if block_gas_used < target:
    base_fee decreases by up to 12.5%
```

---

## First Major Deployment

**Ethereum London Hard Fork** — August 5, 2021 (Block 12,965,000)

Immediate effects:
- Base fee visible in block headers
- ETH burning began
- Wallets updated gas estimation

**Ethereum Classic Olympia** (2025) — Adapted EIP-1559 with treasury allocation instead of pure burning.

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2009 | Bitcoin first-price auction | Original fee model |
| 2015 | Ethereum inherits model | Gas price bidding |
| 2019 | EIP-1559 proposed | New mechanism design |
| 2020 | Roughgarden analysis | Economic validation |
| Aug 2021 | London hard fork | EIP-1559 activation |
| Sep 2022 | The Merge | Priority fees to validators |
| 2024 | EIP-4844 | Blob fee market (separate) |
| 2025 | ETC Olympia | EIP-1559 with treasury |

### ETH Burned

| Date | Cumulative ETH Burned | Notes |
|------|----------------------|-------|
| Aug 2021 | 0 | London activation |
| Jan 2022 | ~1.5M ETH | NFT boom |
| Sep 2022 | ~2.5M ETH | Pre-Merge |
| Jan 2024 | ~4M ETH | Post-bear market |

---

## Common Misattributions

### 1. "EIP-1559 reduces gas fees"

**Misconception**: EIP-1559 makes transactions cheaper.

**Reality**: EIP-1559 makes fees more *predictable*, not necessarily lower. Average fees depend on network demand. During high demand, fees can still spike.

**Confidence**: HIGH

**Sources**: [@article_roughgarden_eip1559_2020]

### 2. "The burned ETH is wasted"

**Misconception**: Fee burning is inefficient.

**Reality**: Burning aligns incentives (prevents block producers from stuffing blocks to inflate fees) and creates deflationary pressure. The "waste" is intentional economic design.

**Confidence**: HIGH

### 3. "EIP-1559 eliminates MEV"

**Misconception**: The new fee model prevents MEV extraction.

**Reality**: EIP-1559 doesn't address transaction ordering. MEV remains; only the fee structure changed.

**Confidence**: HIGH

---

## Open Questions

1. **Optimal base fee adjustment**: Is 12.5% per block optimal, or should it adjust differently?

2. **Multi-dimensional fees**: Should different resources (compute, storage, bandwidth) have separate fees?

3. **L2 fee markets**: How should rollups design their fee mechanisms?

4. **Cross-chain fees**: How do fee markets work with bridges?

5. **Treasury vs. burning**: Is ETC's treasury model better than Ethereum's burning?

---

## Technical Details

### Base Fee Calculation

```python
def calc_base_fee(parent):
    if parent.gas_used == parent.gas_target:
        return parent.base_fee
    elif parent.gas_used > parent.gas_target:
        gas_delta = parent.gas_used - parent.gas_target
        fee_delta = parent.base_fee * gas_delta // parent.gas_target // 8
        return parent.base_fee + max(fee_delta, 1)
    else:
        gas_delta = parent.gas_target - parent.gas_used
        fee_delta = parent.base_fee * gas_delta // parent.gas_target // 8
        return parent.base_fee - fee_delta
```

### Transaction Types

| Type | Description | Fields |
|------|-------------|--------|
| 0 (Legacy) | Pre-1559 | gasPrice |
| 1 (2930) | Access lists | gasPrice + accessList |
| 2 (1559) | EIP-1559 | maxFeePerGas + maxPriorityFeePerGas |
| 3 (4844) | Blob txs | + maxFeePerBlobGas |

### Effective Gas Price

```
effective_gas_price = min(max_fee, base_fee + priority_fee)
refund = max_fee - effective_gas_price
```

---

## EVM Relevance

EIP-1559 affects every EVM transaction:

1. **Gas estimation**: Simpler with predictable base fee
2. **Transaction replacement**: Higher priority fee replaces pending tx
3. **MEV protection**: Base fee provides cost floor
4. **Block building**: Producers maximize priority fees
5. **Economic security**: Burning reduces circulating supply

### BASEFEE Opcode

EIP-1559 introduced:
```
BASEFEE (0x48): Push current block's base fee to stack
```

Used in contracts for:
- Gas price assertions
- Fee-dependent logic
- MEV protection patterns

---

## ETC's ECIP-1111 Variant

Ethereum Classic's Olympia upgrade implements EIP-1559 with modifications:
- 80% burned
- 20% to treasury
- Funds protocol development

This represents an alternative to pure burning.

---

## Citations

[@eip_buterin_1559_2019]
[@article_roughgarden_eip1559_2020]

---

## Cross-References

- [MEV & Auctions](mev_and_auctions.md) — Priority fees and block building
- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — L2 fee mechanisms
- [Smart Contracts & VMs](smart_contracts_and_vms.md) — Gas metering
