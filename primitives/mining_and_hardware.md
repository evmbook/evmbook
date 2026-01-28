# Mining & Hardware Evolution

## Definition

Mining is the process of expending computational resources to validate transactions and produce new blocks in proof-of-work blockchains. This primitive traces the evolution from hobbyist CPU mining to industrial-scale ASIC operations, covering hardware development, pooling mechanisms, geographic shifts, and the economic forces driving specialization.

**Core concepts**:
- **Hash rate**: Computational power measured in hashes per second
- **Difficulty adjustment**: Automatic calibration to maintain target block time
- **Mining pools**: Cooperative mining with shared rewards
- **ASIC resistance**: Algorithm designs intended to prevent hardware specialization

---

## Precursor Lineage

### 1. Hashcash (1997)

**Adam Back's** hashcash introduced the computational puzzle concept:
- Find a nonce such that H(header || nonce) has leading zeros
- Adjustable difficulty via required zeros
- Originally for email spam prevention

[@misc_back_hashcash_1997]

**Key insight**: Hashcash established that computational work could be verified cheaply while being expensive to produce—the fundamental asymmetry underlying all PoW mining.

### 2. RPOW (2004)

**Hal Finney's** Reusable Proofs of Work:
- Built on hashcash
- Allowed PoW tokens to be transferred
- Used trusted hardware for verification
- Direct precursor to Bitcoin mining

[@misc_finney_rpow_2004]

---

## Hardware Evolution Timeline

### Era 1: CPU Mining (2009-2010)

**Bitcoin's first miners** used standard computer processors:

| Period | Hardware | Hash Rate | Power | Notes |
|--------|----------|-----------|-------|-------|
| Jan 2009 | Intel Core 2 | ~2 MH/s | 65W | Satoshi's mining |
| 2009 | Various CPUs | 1-20 MH/s | 50-150W | Early adopters |

**Key characteristics**:
- Satoshi mined the first 1+ million BTC on CPUs
- Anyone with a computer could participate
- Electricity costs negligible vs. block rewards
- Solo mining was viable

**First known non-Satoshi miner**: Hal Finney (received first Bitcoin transaction, block 170)

### Era 2: GPU Mining (2010-2013)

**July 2010**: First GPU miner released by ArtForz (pseudonym)

| Hardware | Hash Rate | Power | Efficiency |
|----------|-----------|-------|------------|
| ATI Radeon 5870 | 400 MH/s | 188W | 2.1 MH/W |
| Nvidia GTX 480 | 120 MH/s | 250W | 0.48 MH/W |
| ATI Radeon 7970 | 700 MH/s | 250W | 2.8 MH/W |

**Why GPUs dominated**:
- Massively parallel architecture (hundreds of cores)
- SHA-256 is parallelizable
- 10-50x more efficient than CPUs
- Consumer hardware, readily available

**ArtForz**: Anonymous developer who created the first GPU mining software. At peak, reportedly controlled ~25% of Bitcoin hashrate with a "farm" of GPUs.

### Era 3: FPGA Mining (2011-2012)

**Field-Programmable Gate Arrays** offered a transitional step:

| Hardware | Hash Rate | Power | Efficiency |
|----------|-----------|-------|------------|
| Xilinx Spartan | 200-400 MH/s | 10-20W | 20 MH/W |
| BFL Single | 830 MH/s | 80W | 10.4 MH/W |

**Advantages**:
- 5-10x more power-efficient than GPUs
- Reprogrammable (unlike ASICs)
- Lower heat output

**Limitations**:
- Expensive development
- Limited production scale
- Quickly obsoleted by ASICs

**Key figure**: **Ngzhang (Zhang Nangeng)** — designed early FPGA miners; later co-founded Canaan Creative.

### Era 4: ASIC Dominance (2013-Present)

**Application-Specific Integrated Circuits** revolutionized mining:

**First Bitcoin ASICs** (2013):
- **Avalon** (Canaan): First commercial ASIC, Jan 2013
- **Butterfly Labs**: Delayed deliveries, FTC lawsuit
- **ASICMiner**: Self-funded, mined with own chips

**ASIC Evolution (SHA-256)**:

| Year | Chip | Process | Efficiency | Notes |
|------|------|---------|------------|-------|
| 2013 | Avalon A1 | 110nm | 9.3 J/TH | First commercial |
| 2014 | Antminer S3 | 28nm | 0.77 J/TH | Bitmain emergence |
| 2016 | Antminer S9 | 16nm | 0.098 J/TH | Dominated for years |
| 2018 | Antminer S15 | 7nm | 0.057 J/TH | Process node race |
| 2020 | Antminer S19 | 7nm | 0.0345 J/TH | Industrial scale |
| 2022 | Antminer S19 XP | 5nm | 0.0215 J/TH | Current generation |
| 2024 | Antminer S21 | 5nm | 0.0175 J/TH | Latest efficient |

**Efficiency gains**: ~500x improvement from 2013 to 2024

---

## Mining Algorithms

### SHA-256 (Bitcoin, 2009)

**Satoshi's choice**:
- NSA-designed hash function
- Well-analyzed, no known weaknesses
- Highly parallelizable → ASIC-friendly

**ASIC dominance**: Complete since 2013. No CPU/GPU mining viable.

### Scrypt (Litecoin, 2011)

**Colin Percival's** memory-hard function:
- Requires significant RAM access
- Designed to be ASIC-resistant
- Intended to favor GPUs

**Result**: ASICs arrived 2014 (Gridseed, Zeus). Memory requirements simply built into ASICs.

### Ethash (Ethereum, 2015)

**Dagger-Hashimoto** derivative:
- 4GB+ DAG (Directed Acyclic Graph) in memory
- Memory-bandwidth bound, not compute-bound
- DAG grows over time (was ~5GB by 2022)

**ASIC resistance**: Partially successful until 2018 (Bitmain E3). Memory requirements made ASICs less advantageous than for SHA-256.

**Ethereum Classic note**: ETC uses ETCHash (modified Ethash) with smaller DAG growth to maintain GPU mining viability.

### RandomX (Monero, 2019)

**CPU-optimized algorithm**:
- Random program execution
- Exploits CPU branch prediction, caches
- Memory-hard with random access patterns

**Result**: Most successful ASIC-resistant algorithm. CPU mining remains viable.

### Equihash (Zcash, 2016)

**Memory-hard** algorithm using generalized birthday problem:
- Multiple memory-hard parameters (n, k)
- ASICs emerged 2018 (Bitmain Z9)
- Some forks (Zcash) accepted ASICs; others (Zcash-derived coins) forked away

### ProgPoW (Proposed, Never Deployed)

**Programmatic Proof of Work**:
- Designed to utilize all GPU components
- Proposed for Ethereum, contentious
- Rendered moot by Ethereum's move to PoS

---

## ASIC Manufacturers

### Bitmain (2013)

**Founded**: Beijing, 2013
**Founders**: Jihan Wu, Micree Zhan

**Key products**:
- Antminer series (S1 through S21+)
- Antpool mining pool
- Litecoin miners (L3, L7)
- ETH miners (E3)

**Market position**: Dominant manufacturer 2014-2020; estimated 70-80% market share at peak.

**Controversies**:
- AsicBoost patent/covert use debate
- BCH/BTC hash war participation
- IPO failures (Hong Kong 2018, US 2021)
- Internal leadership disputes

**Key figures**:
- **Jihan Wu** — Co-founder, CEO (profile in international_adoption.md)
- **Micree Zhan** — Co-founder, chip design lead; ousted 2019, legal battle

### Canaan Creative (2013)

**Founded**: Beijing, 2013
**Founder**: Zhang Nangeng (Ngzhang)

**Key products**:
- Avalon series (A1 through A14)
- First commercial Bitcoin ASIC (Jan 2013)

**Market position**: Second largest manufacturer; ~10-15% market share.

**Corporate history**:
- IPO: Nasdaq 2019 (first crypto mining company on US exchange)
- Survived market cycles better than competitors

**Key figure**: **Zhang Nangeng** — FPGA/ASIC pioneer; designed first commercial Bitcoin ASIC.

### MicroBT (2016)

**Founded**: Shenzhen, 2016
**Founder**: Yang Zuoxing

**Key products**:
- WhatsMiner series (M10 through M60)
- Competitive efficiency with Bitmain

**Market position**: Rose to ~25-35% market share by 2020; strong in North American market.

**Key figure**: **Yang Zuoxing** — Former Bitmain chip designer; founded MicroBT after departing. Bitmain sued for trade secrets (settled).

### Innosilicon (2014)

**Founded**: China, 2014

**Key products**:
- A10 series (ETH)
- T2 series (BTC)
- Various altcoin miners

**Market position**: Third-tier manufacturer; focused on diverse algorithms.

### Other Manufacturers

| Manufacturer | Founded | Notable For |
|--------------|---------|-------------|
| **Ebang** | 2010 | Ebit series; Nasdaq IPO 2020 |
| **Halong Mining** | 2017 | DragonMint T1; security controversy |
| **Spondoolies-Tech** | 2013 | Israeli manufacturer; closed 2016 |
| **KnCMiner** | 2013 | Swedish; Neptune series; bankrupt 2016 |
| **Butterfly Labs** | 2011 | Early ASIC promises; FTC shutdown |

---

## Mining Pools

### Why Pools Exist

**Variance problem**: With rising difficulty, solo mining became a lottery with months or years between wins.

**Solution**: Cooperative mining where:
- Miners contribute hash power
- Pool finds blocks more frequently
- Rewards distributed proportionally
- Small, regular payouts vs. rare large ones

### Pool Evolution Timeline

| Year | Milestone |
|------|-----------|
| 2010 | **Slush Pool** — First mining pool (Nov 2010) |
| 2011 | Multiple pools emerge (BTCGuild, Eligius) |
| 2013 | GHash.IO briefly exceeds 50% hashrate |
| 2014 | Pool centralization concerns peak |
| 2016 | Antpool, F2Pool dominate |
| 2020 | Geographic shift accelerates |
| 2021 | China ban reshuffles pool landscape |
| 2024 | Foundry USA, AntPool, F2Pool lead |

### Major Pools

**Slush Pool / Braiins Pool (2010)**
- Founded by Marek Palatinus (slush)
- Czech Republic
- First pool; pioneered pooled mining protocol
- Rebranded to Braiins Pool (2022)
- Developed Stratum mining protocol

**F2Pool (2013)**
- Founded by Wang Chun, Mao Shixing
- China → Global
- Among largest pools historically
- Multi-coin support

**Antpool (2014)**
- Bitmain-operated
- Vertical integration: manufacturer + pool
- Consistent top-3 hashrate share

**Foundry USA (2019)**
- Digital Currency Group subsidiary
- US-based
- Grew to #1 after China ban (2021)
- Regulatory-compliant focus

**ViaBTC (2016)**
- Founded by Yang Haipo
- China → Global
- Supported Bitcoin Cash launch
- Multi-coin, including ETH (pre-merge)

### Payout Schemes

| Scheme | Description | Risk |
|--------|-------------|------|
| **PPS** (Pay Per Share) | Fixed payment per share submitted | Pool bears variance |
| **PPLNS** (Pay Per Last N Shares) | Payment based on recent shares when block found | Miner bears variance |
| **PPS+** | PPS + transaction fees | Hybrid |
| **FPPS** (Full Pay Per Share) | PPS including expected tx fees | Pool bears full variance |

### Pool Centralization Concerns

**GHash.IO crisis (July 2014)**: Pool briefly exceeded 50% hashrate, raising 51% attack concerns. Voluntary hashrate reduction followed.

**Current state (2024)**:
- Top 3 pools: ~55% of Bitcoin hashrate
- Geographic diversification improved post-China ban
- Stratum V2 aims to decentralize block construction

---

## Geographic Evolution

### Phase 1: Distributed (2009-2013)

Early mining was geographically diverse:
- North America, Europe dominant
- Hobbyist miners with GPUs
- Data center operations emerged

### Phase 2: China Dominance (2014-2021)

**Why China dominated**:
- Cheap electricity (Sichuan hydropower, Xinjiang coal)
- Manufacturing proximity (Bitmain, Canaan)
- Loose early regulation
- Entrepreneurial mining culture

**Peak**: ~65-75% of global hashrate (2019-2020)

**Key regions**:
| Region | Season | Power Source | Cost |
|--------|--------|--------------|------|
| Sichuan | Wet (summer) | Hydropower | $0.02-0.03/kWh |
| Xinjiang | Year-round | Coal | $0.03-0.04/kWh |
| Inner Mongolia | Year-round | Coal | $0.03-0.04/kWh |
| Yunnan | Wet season | Hydropower | $0.02-0.03/kWh |

### Phase 3: The Great Migration (2021)

**China mining ban** (May-June 2021):
- Inner Mongolia ban (March 2021)
- National ban on mining (May 2021)
- Enforcement escalated through June

**Hash rate collapse**: ~50% drop in global hashrate over weeks

**Destination countries**:
| Country | Post-Ban Share | Advantages |
|---------|---------------|------------|
| **United States** | ~38% | Regulatory clarity, capital access |
| **Kazakhstan** | ~18% | Cheap power, geographic proximity |
| **Russia** | ~11% | Cold climate, cheap energy |
| **Canada** | ~7% | Hydropower, cold climate |
| **Malaysia** | ~4% | Low costs, unclear regulation |
| **Iran** | ~3% | Subsidized electricity |

### Phase 4: Current State (2024)

**United States dominance**:
- Texas: Largest mining state (ERCOT grid, wind/solar)
- Georgia, New York, Kentucky: Secondary hubs
- Foundry USA pool reflects US miner concentration

**Emerging trends**:
- Stranded gas / flared gas mining
- Bitcoin mining at renewable sites (load balancing)
- Nuclear-powered mining discussions
- Middle East expansion (UAE, Saudi Arabia)

---

## Key Figures

### Jihan Wu (Bitmain)

See detailed profile in [International Adoption](international_adoption.md).

**Mining-specific contributions**:
- Scaled ASIC manufacturing to industrial level
- Antpool vertical integration
- Controversial AsicBoost implementation
- BCH advocacy divided mining community

### Zhang Nangeng (Canaan)

**Background**: Engineering; FPGA designer before Bitcoin.

**Contributions**:
- First commercial Bitcoin ASIC (Avalon, Jan 2013)
- Proved ASICs were commercially viable
- Built second-largest mining hardware company

**Significance**: Without Canaan's Avalon, Bitcoin's industrial mining era might have developed differently.

### Marek Palatinus (Slush)

**Background**: Czech programmer; early Bitcoin adopter.

**Contributions**:
- Created first mining pool (Slush Pool, Nov 2010)
- Invented Stratum mining protocol
- BIP 0032 (HD wallets) co-author with Pavol Rusnak

**Significance**: Pool mining made Bitcoin accessible to small miners who couldn't compete solo.

### Yang Zuoxing (MicroBT)

**Background**: Chip designer; former Bitmain employee.

**Contributions**:
- WhatsMiner series competes with Antminer
- Broke Bitmain's near-monopoly
- Improved mining hardware competition

**Significance**: MicroBT's competition improved efficiency and pricing across the industry.

---

## Technical Details

### Mining Hardware Architecture

**ASIC Design Layers**:
```
1. Hashing cores (SHA-256 engines)
   └── Optimized for specific algorithm

2. Control logic
   └── Nonce iteration, difficulty checking

3. Power delivery
   └── VRM design, heat management

4. I/O interface
   └── Network, controller communication
```

**Efficiency factors**:
- Process node (7nm, 5nm, 3nm)
- Chip architecture optimization
- Power delivery efficiency
- Cooling design

### Stratum Protocol

**Stratum V1** (2012, by slush):
- JSON-RPC over TCP
- Pool sends work templates
- Miners submit shares
- Widely adopted standard

**Stratum V2** (2019+):
- Binary protocol (efficiency)
- Encrypted connections
- **Job negotiation**: Miners can construct blocks
- Aims to decentralize block template creation

### Difficulty Adjustment

**Bitcoin**:
- Adjusts every 2016 blocks (~2 weeks)
- Target: 10-minute block time
- Maximum adjustment: 4x (up or down)

**Ethereum Classic**:
- Adjusts every block
- Target: ~13-second block time
- MESS (Modified Exponential Subjective Scoring) for security

---

## Economic Considerations

### Mining Economics

**Revenue**:
```
Block reward + Transaction fees = Gross revenue
```

**Costs**:
```
Electricity + Hardware depreciation + Facilities + Labor = Operating costs
```

**Break-even analysis**:
```
Hash price = Revenue per TH/s per day
Break-even = Operating cost per TH/s per day

Profitable if: Hash price > Break-even
```

### Halving Events

**Bitcoin halvings**:
| Event | Date | Block Reward | Effect |
|-------|------|--------------|--------|
| Genesis | Jan 2009 | 50 BTC | — |
| Halving 1 | Nov 2012 | 25 BTC | Price rose ~100x within year |
| Halving 2 | Jul 2016 | 12.5 BTC | Price rose ~30x within 18 months |
| Halving 3 | May 2020 | 6.25 BTC | Price rose ~7x within year |
| Halving 4 | Apr 2024 | 3.125 BTC | Ongoing |

**Miner impact**: Each halving eliminates less-efficient miners, driving hardware upgrades.

### Hash Rate vs. Price Correlation

Historical pattern:
1. Price rises → Mining becomes more profitable
2. More miners enter / existing miners expand
3. Hash rate increases
4. Difficulty adjusts upward
5. Less-efficient miners squeezed out
6. Cycle repeats

---

## Common Misattributions

### 1. "Satoshi invented mining"

**Reality**: The computational puzzle concept came from hashcash (Back, 1997). Satoshi's innovation was using PoW for distributed consensus, not the PoW puzzle itself.

**Confidence**: HIGH

### 2. "ASICs ruined Bitcoin decentralization"

**Reality**: Mining was already centralizing under GPUs (ArtForz's farm). ASICs accelerated industrialization but didn't cause centralization. Economic forces (electricity costs, capital requirements) drive centralization regardless of hardware type.

**Confidence**: MEDIUM — Debated; ASICs raised capital requirements

### 3. "China controlled Bitcoin through mining"

**Reality**: While China hosted 65-75% of hashrate, no evidence of state coordination to attack Bitcoin. Miners are economically incentivized to maintain network integrity. The 2021 ban demonstrated miners could relocate within months.

**Confidence**: HIGH

### 4. "Mining is purely wasteful"

**Reality**: Mining provides:
- Sybil resistance (costly to attack)
- Fair distribution mechanism
- Economic security proportional to value secured

Whether this is "waste" depends on valuation of the secured network.

**Confidence**: PHILOSOPHICAL — Depends on perspective

---

## EVM Relevance

### Ethereum Mining (2015-2022)

**Ethash era**:
- GPU-dominated mining
- Large mining community
- 4GB+ memory requirement limited ASICs
- DAG growth maintained ASIC resistance

**The Merge (Sept 2022)**:
- Ethereum transitioned to Proof of Stake
- All ETH mining ended
- Hardware migrated to ETC, other chains

### Ethereum Classic

**Post-Merge significance**:
- Largest remaining Ethash-compatible chain
- Absorbed significant former ETH hashrate
- ETCHash modification for long-term GPU viability

### Mining for EVM Developers

Understanding mining matters for:
1. **Block production**: How transactions enter blocks
2. **MEV**: Miners/validators extract value (see MEV primitive)
3. **Finality**: PoW chains have probabilistic finality
4. **Uncle/ommer blocks**: Ethereum's GHOST implementation
5. **Network security**: Hash rate as security metric

---

## Open Questions

1. **Post-quantum mining**: Will SHA-256 need replacement?

2. **Renewable mining**: Can mining become majority renewable?

3. **Mining centralization floor**: Is there a minimum viable decentralization?

4. **ASIC resistance**: Is true ASIC resistance possible or just delayed ASICization?

5. **Mining geography**: Will mining continue diversifying or reconcentrate?

---

## Citations

[@misc_back_hashcash_1997]
[@misc_finney_rpow_2004]
[@article_nakamoto_bitcoin_2008]
[@misc_bitmain_antminer]
[@misc_canaan_avalon]
[@misc_stratum_v2]

---

## Cross-References

- [Proof of Work](proof_of_work.md) — PoW primitive and history
- [International Adoption](international_adoption.md) — Jihan Wu, geographic context
- [Node Software Primitives](node_software_primitives.md) — Client requirements
- [MEV & Auctions](mev_and_auctions.md) — Miner extractable value
- [Byzantine Fault Tolerance](byzantine_fault_tolerance.md) — Consensus context
