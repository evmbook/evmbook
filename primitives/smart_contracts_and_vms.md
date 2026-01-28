# Smart Contracts & Virtual Machines

## Definition

### Smart Contracts

A smart contract is self-executing code stored on a blockchain that automatically enforces agreement terms when conditions are met. Key properties:
- **Deterministic**: Same inputs → same outputs across all nodes
- **Immutable** (usually): Code cannot be changed after deployment
- **Permissionless**: Anyone can interact
- **Transparent**: Code and state are publicly auditable

### Virtual Machines

A blockchain virtual machine (VM) is a sandboxed execution environment that:
- Runs smart contract code deterministically
- Meters execution via gas/fees
- Isolates contracts from each other and the host
- Maintains consistent state across all nodes

The EVM (Ethereum Virtual Machine) is the most widely deployed blockchain VM.

---

## Precursor Lineage

### 1. Nick Szabo's Smart Contracts Concept (1994-1997)

**Szabo (1994)** — First coined "smart contracts" to describe:

> "A smart contract is a set of promises, specified in digital form, including protocols within which the parties perform on these promises."

[@misc_szabo_smart_contracts_1994]

**Szabo (1996)** — "Smart Contracts: Building Blocks for Digital Markets" expanded the concept with examples:
- Vending machines (automated execution)
- Car liens (conditional ownership)
- Bonds and derivatives (financial agreements)

[@misc_szabo_smart_contracts_building_1996]

Szabo envisioned contracts that:
- Execute automatically
- Are tamper-resistant
- Reduce reliance on intermediaries

### 2. Virtual Machine History

| Year | VM | Significance |
|------|-----|--------------|
| 1964 | CP/CMS | Early virtualization |
| 1995 | Java VM | Bytecode portability |
| 2001 | .NET CLR | Common Language Runtime |
| 2014 | EVM | First blockchain VM |

### 3. Bitcoin Script (2009)

Bitcoin included a limited scripting language:
- Stack-based
- Non-Turing-complete (intentionally)
- Enables multisig, timelocks, simple conditions
- Cannot maintain state

Bitcoin Script was deliberately limited to reduce attack surface.

### 4. Pre-Ethereum Attempts (2011-2014)

Before Ethereum, several projects attempted to extend blockchain computation beyond Bitcoin Script's limitations. These efforts demonstrated both the demand for programmability and the constraints of building on Bitcoin.

#### Namecoin (2011)

**First altcoin and first blockchain with application logic**:
- Forked Bitcoin codebase
- Implemented decentralized DNS-like registry (.bit domains)
- Names registered via special transactions
- Demonstrated blockchain could store more than currency

[@misc_namecoin_2011]

Limitations: Single-purpose, no general programmability.

#### Mastercoin/Omni (2013)

**Colored coins and meta-protocols on Bitcoin**:
- J.R. Willett's "Second Bitcoin Whitepaper" (2012)
- Embedded metadata in Bitcoin transactions
- Enabled tokens, smart properties, decentralized exchange
- Became Omni Layer; hosts Tether (USDT-Omni)

[@misc_mastercoin_whitepaper_2012]

Limitations: Constrained by Bitcoin block size, fees, and script limitations.

#### Counterparty (2014)

**Smart contracts on Bitcoin via OP_RETURN**:
- Burned XCP for initial distribution (proof-of-burn)
- Implemented Turing-complete contracts on Bitcoin
- Created first NFTs (Rare Pepes, 2016)
- Demonstrated desire for programmability

[@misc_counterparty_2014]

Limitations: Bitcoin miners don't validate Counterparty state; limited throughput; OP_RETURN data limits.

#### NXT (2013)

**First pure proof-of-stake blockchain with built-in features**:
- Asset issuance, messaging, marketplace
- Not Bitcoin-derived codebase
- Limited scripting (not Turing-complete)

[@misc_nxt_2013]

Limitations: Fixed feature set; no general-purpose programmability.

#### Why These Weren't Enough

| Project | Approach | Limitation |
|---------|----------|------------|
| Namecoin | Purpose-specific fork | Single application only |
| Mastercoin | Meta-protocol on Bitcoin | Bitcoin fees/limits constrain |
| Counterparty | OP_RETURN embedding | Bitcoin doesn't validate state |
| NXT | Built-in features | Not programmable |

Ethereum's insight: **Build programmability into the base layer** with a Turing-complete VM, persistent contract storage, and native gas metering.

---

## First Formalization

### Smart Contracts: Szabo (1994-1996)

Szabo's papers formalized the concept of self-executing digital agreements.

### EVM: Wood (2014)

**Gavin Wood's Yellow Paper** formally specified the EVM:
- Stack-based architecture
- 256-bit word size
- Gas metering system
- Opcodes and their costs
- State transition function

[@yellowpaper_wood_ethereum_2014]

---

## First Major Deployment

### Bitcoin Script (2009)

Limited scripting for transaction conditions.

### Ethereum EVM (July 30, 2015)

The EVM launched with Ethereum mainnet:
- Turing-complete (with gas limits)
- Account-based (not UTXO)
- Persistent storage per contract
- Message-passing between contracts

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 1994-96 | Szabo's smart contracts papers | Concept defined |
| 2009 | Bitcoin Script | Limited on-chain logic |
| Apr 2011 | Namecoin | First alt-chain; .bit domains |
| Jul 2013 | Mastercoin | Meta-protocol; colored coins |
| Nov 2013 | NXT launch | First pure PoS; built-in features |
| Nov 2013 | Ethereum whitepaper | Turing-complete blockchain vision |
| Jan 2014 | Counterparty | Smart contracts on Bitcoin |
| 2014 | Ethereum Yellow Paper | Formal EVM specification |
| Jul 2015 | Ethereum mainnet | EVM deployment |
| Jun 2016 | The DAO | First major smart contract exploit |
| 2017 | Solidity matures | High-level language adoption |
| 2018 | Vyper release | Alternative EVM language |
| 2020 | DeFi Summer | Smart contracts at scale |
| 2021 | EVM equivalence L2s | Arbitrum, Optimism |
| 2024 | EOF (EVM Object Format) | EVM modernization |

---

## EVM Architecture

### Stack Machine

The EVM is stack-based:
- 1024 items max stack depth
- 256-bit (32-byte) words
- LIFO (Last In, First Out) operations

### Memory Model

| Area | Description | Gas Cost |
|------|-------------|----------|
| Stack | Temporary values; max 1024 | Low |
| Memory | Byte-array; expands quadratically | Medium |
| Storage | Persistent key-value; 256→256 bits | High |
| Calldata | Read-only input data | Low |
| Code | Contract bytecode | Fixed |

### Gas Metering

Every operation costs gas:
```
Total cost = Σ(opcode_cost) + memory_expansion + storage_writes
```

Prevents infinite loops and meters resource usage.

---

## Common Misattributions

### 1. "Vitalik Buterin invented smart contracts"

**Misconception**: Ethereum created the concept.

**Reality**: Nick Szabo coined "smart contracts" in 1994. Buterin implemented them on a decentralized platform—a significant engineering achievement, but not conceptual invention.

**Confidence**: HIGH

**Sources**: [@misc_szabo_smart_contracts_1994; @whitepaper_buterin_ethereum_2013]

### 2. "Smart contracts are legally binding contracts"

**Misconception**: Smart contracts have legal standing.

**Reality**: Smart contracts are code that executes automatically. Legal enforceability depends on jurisdiction and whether the code matches legal requirements. The name is somewhat misleading.

**Confidence**: HIGH

### 3. "The EVM is inefficient by design"

**Misconception**: The EVM is slow because it's poorly designed.

**Reality**: The EVM prioritizes determinism, security, and simplicity over raw performance. It's designed for trustless consensus, not speed.

**Confidence**: HIGH

---

## Open Questions

1. **EVM evolution**: How should the EVM evolve while maintaining compatibility?

2. **Alternative VMs**: Will WASM, RISC-V, or other VMs displace the EVM?

3. **Formal verification**: How can we prove smart contract correctness?

4. **Upgradeability**: How to balance immutability with the need for bug fixes?

5. **Cross-chain contracts**: How should contracts interact across chains?

---

## Technical Details

### Contract Deployment

```
Deployment transaction:
- to: null (0x0)
- data: init_code
- value: initial ETH (optional)

Execution:
1. Run init_code
2. init_code returns runtime_code
3. Store runtime_code at new address
```

### Address Calculation

```
CREATE:  address = keccak256(sender, nonce)[12:32]
CREATE2: address = keccak256(0xff, sender, salt, keccak256(init_code))[12:32]
```

### Message Calls

```
CALL:         standard call with ETH
STATICCALL:   read-only (no state changes)
DELEGATECALL: execute code in caller's context
```

---

## EVM Languages

| Language | Type | Notes |
|----------|------|-------|
| Solidity | High-level | Most widely used; C-like syntax |
| Vyper | High-level | Python-like; security-focused |
| Yul | Intermediate | Low-level; used in optimizer |
| Huff | Low-level | Near-assembly; maximum control |
| Fe | High-level | Rust-like; newer |

---

## Alternative Blockchain VMs

### Execution Model Comparison

| Model | State Model | Examples | Trade-offs |
|-------|-------------|----------|------------|
| **UTXO + Script** | Stateless outputs | Bitcoin | Security via simplicity; limited expressiveness |
| **Account + EVM** | Global state tree | ETH, ETC, L2s | Flexibility, tooling; state bloat |
| **eUTXO** | Extended UTXO | Cardano | Deterministic fees; concurrency limits |
| **Account + SVM** | Per-account state | Solana | Parallel execution; higher complexity |
| **Move VM** | Object-centric | Sui, Aptos | Resource safety; new paradigm |
| **DAG-based** | Varies | IOTA, Hedera | Different finality model |

### VM Characteristics

| Chain | VM | Architecture | Key Feature |
|-------|-----|--------------|-------------|
| Ethereum, ETC | EVM | Stack-based, 256-bit | Dominant ecosystem |
| Solana | SBF/BPF | LLVM-based, parallelized | High throughput |
| Cardano | Plutus | Haskell-based, functional | Formal verification |
| Polkadot | WASM | WebAssembly-based | Cross-chain |
| Near | WASM | WebAssembly-based | Sharded |
| Sui | Move VM | Linear types | Resource-oriented |
| Aptos | Move VM | Block-STM parallel | Parallel execution |
| TON | TVM | Stack-based, async | Actor model |
| Cosmos chains | WASM (CosmWasm) | WebAssembly | IBC interop |

---

## Why EVM Won

Despite its limitations, the EVM became the dominant blockchain VM. Understanding why illuminates network effects in infrastructure.

### 1. First Mover in General-Purpose Computation

Ethereum launched in 2015 as the first **production** Turing-complete blockchain. While Counterparty and others attempted smart contracts earlier, Ethereum built programmability into the base layer with:
- Native gas metering
- Persistent contract storage
- Full node validation of contract execution

### 2. Developer Tooling Ecosystem

The EVM has the most mature tooling:

| Category | Tools |
|----------|-------|
| Languages | Solidity, Vyper, Huff, Fe |
| Frameworks | Hardhat, Foundry, Brownie |
| Testing | Forge, Echidna, Slither |
| Debugging | Tenderly, Sentio |
| Indexing | The Graph, Ponder |

Competitors often have 1-2 tools per category; EVM has 5-10.

### 3. Liquidity and Network Effects

```
More users → More dApps → More developers → More users
         ↑_____________________________________|
```

By 2020, Ethereum had:
- 90%+ of DeFi TVL
- Most active developers
- Deepest liquidity

This created a gravitational pull that's hard to escape.

### 4. EVM Compatibility Standard

Rather than compete, many chains copied the EVM:
- **BSC (2020)**: Binance's EVM fork
- **Polygon (2020)**: EVM sidechain
- **Avalanche C-Chain (2020)**: EVM subnet
- **Fantom (2019)**: EVM-compatible
- **Arbitrum/Optimism (2021)**: EVM rollups

Result: Developers write once, deploy everywhere. The EVM became the "x86 of blockchain."

### 5. Schelling Point for Standards

ERC-20, ERC-721, ERC-1155, ERC-4626 became **the** token standards. Other chains often implement EVM compatibility just to access these standards and the tooling built around them.

### The Trade-off

EVM dominance came at a cost:
- **256-bit words**: Wasteful for most operations
- **Stack-based**: Harder to optimize than register-based
- **Storage model**: Expensive state growth
- **Serial execution**: Limited parallelization

Newer VMs (Move, SVM) address these, but must overcome network effects.

---

## Bitcoin Programmability Renaissance (2023-2025)

After years of focusing solely on monetary use, Bitcoin experienced renewed interest in programmability:

### BitVM (October 2023)

**Robin Linus's proposal** enables general computation on Bitcoin via fraud proofs:

**Core insight**: Bitcoin Script can verify fraud proofs. Any computation can be expressed as a fraud-provable commitment.

**Architecture**:
```
1. Prover commits to computation result
2. If honest: Result accepted
3. If dishonest: Verifier creates fraud proof
4. Fraud proof executable in Bitcoin Script
```

**Limitations**:
- Requires 1-of-n honest verifier assumption
- Complex setup for each program
- High on-chain costs for disputes
- Two-party initial design (BitVM 2 expands)

[@misc_bitvm_2023]

**BitVM 2 (2024)**: Improved design allowing:
- Multi-party verification
- More efficient disputes
- Bridge applications

### OP_CAT Revival (2024)

**BIP-420**: Proposal to re-enable OP_CAT opcode (disabled in 2010).

**What OP_CAT does**: Concatenates two stack elements.

**Why it matters**: Enables covenants (restrictions on how UTXOs can be spent).

**Covenant applications**:
- Vaults (time-locked withdrawals)
- Congestion control
- Trustless bridges
- Rollup settlement

**Controversy**:
- Proponents: Enables Bitcoin smart contracts without hard fork complexity
- Opponents: May enable "undesirable" use cases (tokens, MEV)

**Status (2024-2025)**: Active debate; no activation timeline.

### Citrea (2024)

**First Bitcoin ZK-validity rollup**:

| Aspect | Design |
|--------|--------|
| **Execution** | EVM-compatible |
| **Settlement** | Bitcoin |
| **Data availability** | Bitcoin inscriptions |
| **Proofs** | ZK-STARKs |

**How it works**:
1. Users transact on Citrea (EVM environment)
2. ZK proofs generated off-chain
3. Proofs verified via BitVM on Bitcoin
4. State roots anchored to Bitcoin

**Significance**: Brings EVM smart contracts to Bitcoin security model.

[@misc_citrea_2024]

### Other Bitcoin L2s

| Project | Approach | Status |
|---------|----------|--------|
| **Stacks (STX)** | Clarity language; anchored to Bitcoin | Live since 2021 |
| **Liquid** | Federated sidechain | Live; limited adoption |
| **RSK (RBTC)** | Merge-mined sidechain; EVM | Live since 2018 |
| **Lightning** | Payment channels | Live; non-programmable |
| **RGB** | Client-side validation | Developing |

### Ordinals & Inscriptions (2023)

**Casey Rodarmor's innovation**: Embed arbitrary data in Bitcoin transactions.

| Type | Content | Example |
|------|---------|---------|
| **Ordinals** | Individual satoshi identity | Sat numbering |
| **Inscriptions** | Data embedded in witness | Images, text |
| **BRC-20** | Token standard on inscriptions | Meme tokens |

**Controversy**:
- Proponents: Bitcoin should be permissionless
- Opponents: "Spam" that increases fees, fills blocks

**Impact**: Demonstrated demand for Bitcoin programmability; drove fee revenue; sparked ecosystem development.

### Bitcoin vs. EVM Programmability

| Aspect | Bitcoin (BitVM/Citrea) | Ethereum/EVM |
|--------|------------------------|--------------|
| **Base layer** | Limited Script | Full VM |
| **L2 approach** | Validity proofs, fraud proofs | Optimistic, ZK rollups |
| **Settlement** | High security, slow | Fast, high throughput |
| **Ecosystem** | Emerging | Mature |
| **Tooling** | Limited | Extensive |

**Philosophical divide**:
- **Bitcoin**: Conservatism; don't break what works; L2 for complexity
- **Ethereum**: Pragmatism; upgrade base layer; L2 for scale

---

## EVM Client Implementations

The EVM specification is implemented by multiple independent clients. This client diversity is critical for network security—a bug in one client won't take down the entire network.

### Client Timeline

| Year | Client | Team/Origin | Notes |
|------|--------|-------------|-------|
| 2014 | **Aleth (cpp-ethereum)** | Ethereum Foundation | Original C++ implementation; deprecated 2020 |
| 2015 | **Geth (go-ethereum)** | Ethereum Foundation | Go implementation; dominant client |
| 2015 | **Parity Ethereum** | Parity Technologies | Rust implementation; fastest sync |
| 2016 | **Hyperledger Besu** | ConsenSys/Hyperledger | Java; enterprise features |
| 2019 | **Nethermind** | Nethermind | C#/.NET; performance focus |
| 2020 | **Erigon** | Ledgerwatch (ex-TurboGeth) | Go; archival efficiency |
| 2020 | **OpenEthereum** | OpenEthereum DAO | Parity fork; sunset 2023 |
| 2023 | **Reth** | Paradigm | Rust; modular design |

### Key Clients in Detail

#### Geth (go-ethereum)

**The reference implementation** and most widely deployed client:

**Team**: Ethereum Foundation; led by Péter Szilágyi (@karalabe) and Guillaume Ballet.

**Technical contributions**:
- Defines de facto EVM behavior when spec is ambiguous
- Introduced snap sync protocol (2021)
- First to implement EIP-4844 blobs
- LevelDB → Pebble database migration (2024)

**Market share**: ~65-80% of consensus layer validators use Geth (varies by measure).

**Concern**: Supermajority concentration is a centralization risk.

#### Parity Ethereum → OpenEthereum

**Fastest client of its era**, written in Rust by Parity Technologies:

**History**:
- 2015-2019: Parity Ethereum under Gavin Wood/Parity
- November 2019: Transitioned to OpenEthereum DAO
- 2023: Deprecated in favor of Erigon and Reth

**Technical contributions**:
- Warp sync (fast state sync)
- First Rust Ethereum implementation
- Foundation for Polkadot's Substrate

**Notable incidents**:
- July 2017: Multi-sig wallet bug; $30M+ frozen
- November 2017: Parity wallet library freeze; $150M+ locked

#### Erigon (formerly TurboGeth)

**Archival-optimized client** focused on disk efficiency:

**Team**: Ledgerwatch (Alexey Akhunov @realLedgerwatch); spun out of Geth.

**Technical innovations**:
- Flat database layout (not MPT-based storage)
- Archive node in ~2TB vs. ~12TB for Geth archive
- Staged sync architecture
- OtterSync for faster data transfer

**Use case**: Archival nodes, indexers, researchers needing historical state.

#### Nethermind

**High-performance C#/.NET implementation**:

**Team**: Nethermind (Tomasz Stańczak); funded by Ethereum Foundation and others.

**Technical contributions**:
- Fast sync innovations
- RPC performance optimizations
- Extensive tracing APIs
- Used by many staking providers

**Ecosystem**: Active in research; contributes to Verkle trees, statelessness.

#### Hyperledger Besu

**Enterprise-focused Java client**:

**Team**: Originally ConsenSys; now Hyperledger Foundation.

**Features**:
- Privacy groups (for private transactions)
- Permissioning modules
- Mainnet and private network support
- GraphQL API

**Use case**: Enterprises needing compliance features.

#### Reth

**Newest major client**, designed for modularity:

**Team**: Paradigm (Georgios Konstantopoulos @gakonst); open-sourced 2023.

**Design philosophy**:
- Clean Rust codebase
- Modular components (can swap consensus, execution)
- Designed for rollup builders to customize
- Fast sync and execution

**Status (2024-2025)**: Production-ready; gaining adoption.

### Client Diversity Problem

| Client | Consensus Layer Share (2024) | Risk |
|--------|------------------------------|------|
| Geth | ~65-70% | Supermajority |
| Nethermind | ~15-20% | — |
| Besu | ~8-10% | — |
| Erigon | ~5-7% | — |
| Reth | Growing | — |

**Supermajority risks**:
- If Geth has a consensus bug, >66% of validators could be slashed
- Network could finalize an invalid chain
- No recovery mechanism in PoS for supermajority bugs

**Mitigation efforts**:
- Client diversity campaigns by EF
- Staking pools (Lido) diversifying clients
- Protocol incentives under discussion

### Key Figures in Client Development

#### Péter Szilágyi (Geth)

**Background**: Lead developer of Geth since early Ethereum.

**Technical contributions**:
- EVM and p2p networking improvements
- Snap sync protocol
- Database layer optimizations

**Role**: De facto arbiter of EVM implementation details when specification is ambiguous.

#### Gavin Wood (Parity/Polkadot)

**Background**: Co-founder of Ethereum; author of Yellow Paper.

**Contributions to clients**:
- Founded Parity Technologies
- Oversaw Parity Ethereum development
- Later pivoted to Polkadot/Substrate

#### Alexey Akhunov (Erigon)

**Background**: Former Geth contributor; state management researcher.

**Contributions**:
- TurboGeth → Erigon development
- Research on state expiry, statelessness
- Verkle tree implementation work

**Significance**: Demonstrated that EVM clients can be radically more efficient.

### Client Architecture Comparison

| Component | Geth | Erigon | Nethermind | Besu | Reth |
|-----------|------|--------|------------|------|------|
| **Language** | Go | Go | C# | Java | Rust |
| **Database** | Pebble | MDBX | RocksDB | RocksDB | MDBX |
| **Sync modes** | Full, Snap, Light | Staged | Fast, Full | Fast, Full | Full |
| **Archive size** | ~12 TB | ~2 TB | ~8 TB | ~10 TB | ~2.5 TB |
| **Best for** | General use | Archives | Performance | Enterprise | Modularity |

### ETC Client Landscape

Ethereum Classic has its own client implementations:

| Client | Base | Status |
|--------|------|--------|
| **Core-geth** | Geth fork | Primary client |
| **Hyperledger Besu** | Java | Supports ETC |

**Historical note**: Post-Merge, ETC clients diverged significantly from Ethereum clients. ETC maintained PoW consensus while Ethereum moved to PoS.

### Underlying Software Primitives

Blockchain clients build on decades of distributed systems research. Key foundational components include:

| Category | Primitives | Blockchain Usage |
|----------|------------|------------------|
| **Peer discovery** | Kademlia DHT (2002) | Ethereum devp2p, IPFS |
| **Block propagation** | GossipSub (2019) | Ethereum consensus layer |
| **Storage** | LevelDB, RocksDB, MDBX | All major clients |
| **Cryptography** | libsecp256k1, BLST | Signatures, PoS |
| **Networking** | libp2p | Post-Merge consensus |

For detailed lineage of these components, see [Node Software Primitives](node_software_primitives.md).

---

## EVM Relevance

This primitive *is* the EVM. Understanding smart contracts and VMs means understanding:

1. **Gas optimization**: Minimize opcode and storage costs
2. **Security patterns**: Reentrancy guards, access control
3. **Upgradeability**: Proxy patterns, diamonds
4. **Composability**: Contract-to-contract calls
5. **Testing**: Fuzzing, formal verification
6. **Client diversity**: Running minority clients improves network health

---

## Citations

[@misc_szabo_smart_contracts_1994]
[@misc_szabo_smart_contracts_building_1996]
[@whitepaper_buterin_ethereum_2013]
[@yellowpaper_wood_ethereum_2014]
[@misc_namecoin_2011]
[@misc_mastercoin_whitepaper_2012]
[@misc_counterparty_2014]
[@misc_nxt_2013]

---

## Cross-References

- [Node Software Primitives](node_software_primitives.md) — P2P networking, databases, crypto libraries
- [Fee Markets & EIP-1559](fee_markets_eip1559.md) — Gas economics
- [MEV & Auctions](mev_and_auctions.md) — Transaction ordering attacks
- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — EVM execution on L2s
- [Token Standards Evolution](token_standards_evolution.md) — ERC standards on EVM
- [Zero Knowledge Proofs](zero_knowledge_proofs.md) — zkEVM implementations
- [Governance & DAOs](governance_and_daos.md) — On-chain governance contracts
