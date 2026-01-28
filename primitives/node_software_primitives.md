# Node Software Primitives

## Definition

Blockchain clients are built atop decades of distributed systems research. This primitive documents the foundational software components that influenced Bitcoin Core, Geth, and other blockchain node implementations.

**Core categories**:
- **Peer-to-peer networking**: How nodes discover and communicate
- **Storage engines**: How blockchain data is persisted
- **Cryptographic libraries**: How signatures and hashes are computed
- **Sync protocols**: How new nodes catch up to chain tip
- **RPC interfaces**: How applications interact with nodes

---

## Precursor Lineage

### 1. Distributed Hash Tables (2001-2002)

DHTs solved decentralized peer discovery—critical for permissionless networks.

#### Chord (2001)

**Stoica, Morris, Karger, Kaashoek, Balakrishnan** — MIT/Berkeley:
- First practical DHT with provable performance
- O(log N) lookups in N-node network
- Consistent hashing for load balancing
- Ring-based topology

[@inproceedings_stoica_chord_2001]

#### Kademlia (2002)

**Maymounkov & Mazières** — NYU:
- XOR-based distance metric
- Iterative lookups (more robust than recursive)
- Peer liveness inferred from normal traffic
- Self-healing routing tables

[@inproceedings_maymounkov_kademlia_2002]

**Blockchain adoption**:
| System | DHT Usage |
|--------|-----------|
| BitTorrent | Mainline DHT (Kademlia variant) |
| IPFS | Kademlia for content routing |
| Ethereum (devp2p) | Kademlia-based peer discovery |
| Bitcoin | Custom protocol (not DHT-based) |

**Key insight**: Kademlia's XOR metric allows efficient routing without global coordination—a precursor to trustless p2p networks.

### 2. BitTorrent & Incentive-Compatible P2P (2001-2003)

**Bram Cohen's BitTorrent** introduced incentive-compatible file sharing:

**Tit-for-tat protocol**:
- Peers who upload get download priority
- Free-riders naturally throttled
- No central enforcement needed

[@inproceedings_cohen_bittorrent_incentives_2003]

**Blockchain influence**:
- Block propagation patterns (compact blocks, BIP 152)
- Peer scoring systems
- Bandwidth management strategies
- Incentive design philosophy

**Historical note**: Bram Cohen worked at Mojo Nation before BitTorrent, and later founded Chia Network (2017).

### 3. Log-Structured Merge Trees (2006+)

LSM-trees became the dominant storage architecture for blockchain clients.

#### LevelDB (2011)

**Jeff Dean & Sanjay Ghemawat** — Google:
- Open-source LSM-tree implementation
- Write-optimized (sequential writes)
- Used by Bitcoin Core, early Geth

**Characteristics**:
```
Write path: Memory → Log → SSTable (sorted)
Read path:  Memory → L0 → L1 → ... → Ln
Compaction: Background merging of levels
```

**Limitations for blockchain**:
- Single-threaded compaction
- Memory pressure during large writes
- No native support for range deletes

#### RocksDB (2012)

**Facebook** fork of LevelDB:
- Multi-threaded compaction
- Column families (logical separation)
- Better memory management
- Used by Nethermind, Besu, many others

**Blockchain improvements**:
- Parallel compaction for large state
- Configurable compression per level
- Better write amplification control

#### LMDB (2011) / MDBX (2015+)

**Howard Chu** — OpenLDAP / Leonid Yuriev:
- Memory-mapped B+tree
- Copy-on-write (no compaction)
- Single-file database
- Used by Erigon, Reth

**Advantages for blockchain**:
- Instant crash recovery
- No write amplification
- Efficient random reads (important for state access)
- Much smaller archive size

| Engine | Geth Archive | Erigon Archive | Difference |
|--------|--------------|----------------|------------|
| LevelDB/RocksDB | ~12 TB | — | — |
| MDBX | — | ~2 TB | 6x smaller |

### 4. Elliptic Curve Libraries

Blockchain cryptography depends on efficient ECC implementations.

#### libsecp256k1 (2013+)

**Pieter Wuille** — Bitcoin Core:
- Optimized secp256k1 curve implementation
- 4-10x faster than OpenSSL for Bitcoin operations
- Constant-time to prevent timing attacks
- Used by Bitcoin, Ethereum, most blockchains

**Optimizations**:
- Endomorphism acceleration
- Batch verification
- Custom field arithmetic
- Assembly for critical paths

[@misc_libsecp256k1]

#### BLST (2020)

**Supranational / EF / Protocol Labs**:
- BLS12-381 signature library
- Required for Ethereum PoS
- Signature aggregation support
- Used by all consensus clients

**Why BLS matters**:
- Aggregate thousands of signatures into one
- Enables efficient validator attestations
- Required for PoS efficiency

### 5. libp2p (2014+)

**Protocol Labs** — modular networking stack:

**Components**:
| Module | Function |
|--------|----------|
| **Transports** | TCP, QUIC, WebSocket, WebRTC |
| **Multiplexing** | yamux, mplex |
| **Security** | Noise, TLS 1.3 |
| **Peer discovery** | Kademlia, mDNS, Rendezvous |
| **PubSub** | GossipSub (used for block propagation) |

**Blockchain adoption**:
- IPFS (original use case)
- Ethereum consensus layer (post-Merge)
- Polkadot, Filecoin, Celestia

**GossipSub**:
- Epidemic broadcast protocol
- Mesh-based topology
- Score-based peer management
- Designed for blockchain block/attestation propagation

[@misc_libp2p]

---

## First Formalization

### P2P Networking

| Paper | Year | Contribution |
|-------|------|--------------|
| Chord | 2001 | First DHT with O(log N) lookup |
| Kademlia | 2002 | XOR distance, parallel lookups |
| BitTorrent | 2003 | Incentive-compatible P2P |
| GossipSub | 2019 | Blockchain-optimized pubsub |

### Storage

| System | Year | Contribution |
|--------|------|--------------|
| LSM-trees | 1996 | Write-optimized storage |
| LevelDB | 2011 | Practical LSM implementation |
| LMDB | 2011 | Memory-mapped B+tree |

---

## First Major Deployment

### Bitcoin Core (2009)

**Satoshi's implementation** combined:
- Custom P2P protocol (not Kademlia)
- BerkeleyDB → LevelDB (0.8.0, 2013)
- OpenSSL cryptography (later replaced)

### Geth (2015)

**Ethereum's reference client**:
- devp2p (Kademlia-based discovery + RLPx transport)
- LevelDB storage
- Custom EVM implementation
- JSON-RPC interface

---

## Crypto Adoption Timeline

| Year | Event | Significance |
|------|-------|--------------|
| 2001 | Chord DHT | Decentralized lookup |
| 2001 | BitTorrent | Incentive-compatible P2P |
| 2002 | Kademlia | XOR-based DHT |
| 2009 | Bitcoin P2P | First blockchain network |
| 2011 | LevelDB released | Standard blockchain storage |
| 2011 | LMDB released | Memory-mapped alternative |
| 2012 | RocksDB fork | High-performance LSM |
| 2013 | libsecp256k1 | Optimized crypto |
| 2013 | Bitcoin → LevelDB | Storage upgrade |
| 2014 | libp2p started | Modular networking |
| 2015 | Ethereum devp2p | Kademlia + RLPx |
| 2019 | GossipSub | Blockchain pubsub |
| 2020 | Erigon MDBX | Archival efficiency |
| 2020 | BLST library | BLS for PoS |
| 2021 | ETH consensus uses libp2p | Post-Merge networking |
| 2024 | Geth → Pebble | New storage engine |

---

## Technical Details

### devp2p (Ethereum Networking)

Ethereum's networking stack has two layers:

**Discovery v4/v5** (peer finding):
```
Based on Kademlia DHT
- 256-bit node IDs (public key hash)
- 16 k-buckets
- UDP for discovery
- ENR (Ethereum Node Records) in v5
```

**RLPx** (session layer):
```
- ECIES encryption
- RLP-encoded messages
- Multiplexed subprotocols (eth, snap, les)
```

**Post-Merge split**:
| Layer | Protocol | Purpose |
|-------|----------|---------|
| Execution | devp2p/RLPx | Transaction/block sync |
| Consensus | libp2p/GossipSub | Attestations, proposals |

### Sync Protocols

| Protocol | Client | Method |
|----------|--------|--------|
| **Full sync** | All | Download and execute every block |
| **Fast sync** | Geth (old) | Download state at pivot, verify from there |
| **Snap sync** | Geth | Download flat state, generate MPT |
| **Warp sync** | Parity (deprecated) | Download state snapshots |
| **Staged sync** | Erigon | Pipeline: headers → bodies → senders → execution |
| **Checkpoint sync** | Consensus | Start from trusted checkpoint |

### JSON-RPC Interface

Standard interface for dApp interaction:

```json
// Request
{
  "jsonrpc": "2.0",
  "method": "eth_blockNumber",
  "params": [],
  "id": 1
}

// Response
{
  "jsonrpc": "2.0",
  "result": "0x12a05f200",
  "id": 1
}
```

**RPC Categories**:
| Namespace | Purpose |
|-----------|---------|
| `eth_` | Core blockchain operations |
| `net_` | Network status |
| `web3_` | Client metadata |
| `debug_` | Tracing, profiling |
| `trace_` | Transaction traces |
| `admin_` | Node administration |

---

## Common Misattributions

### 1. "Bitcoin invented P2P networking"

**Misconception**: Bitcoin's P2P network was a novel invention.

**Reality**: Bitcoin built on decades of P2P research (Napster 1999, Gnutella 2000, Kademlia 2002, BitTorrent 2001). Satoshi's innovation was applying P2P to consensus, not inventing P2P.

**Confidence**: HIGH

### 2. "LevelDB was designed for blockchains"

**Misconception**: LevelDB was built for Bitcoin/blockchain use.

**Reality**: LevelDB was created at Google for general key-value storage. Bitcoin adopted it in 2013 as a performance improvement over BerkeleyDB. Blockchain use was incidental.

**Confidence**: HIGH

### 3. "Ethereum uses Kademlia"

**Misconception**: Ethereum's networking is pure Kademlia.

**Reality**: Ethereum uses Kademlia concepts for peer discovery only. The actual communication uses RLPx (custom protocol) and post-Merge, libp2p for consensus. The DHT is for finding peers, not routing messages.

**Confidence**: HIGH

---

## Open Questions

1. **Database future**: Will specialized blockchain databases replace general-purpose LSM/B+tree engines?

2. **libp2p vs. custom**: Should new chains use libp2p or build custom networking?

3. **State management**: How should clients handle growing state (Verkle trees, state expiry)?

4. **Hardware acceleration**: Will crypto accelerators (HSMs, specialized chips) become standard?

5. **Modular architecture**: Will clients become more modular (execution ↔ consensus ↔ storage)?

---

## Key Figures

### Pieter Wuille (libsecp256k1, Bitcoin Core)

**Background**: Physics/computer science, KU Leuven. Bitcoin Core developer since 2011.

**Contributions**:
- libsecp256k1 elliptic curve library
- Segregated Witness (SegWit)
- Bech32 address format
- Taproot/Schnorr

**Significance**: His cryptographic library is used by virtually every blockchain.

### Jeff Dean & Sanjay Ghemawat (LevelDB)

**Background**: Google Senior Fellows; co-architects of MapReduce, BigTable, Spanner.

**Contribution**: LevelDB open-source release enabled efficient blockchain storage.

### Petar Maymounkov (Kademlia)

**Background**: Ph.D. NYU; worked on information theory and distributed systems.

**Contribution**: Kademlia DHT paper (with David Mazières) became foundational for decentralized peer discovery.

### Bram Cohen (BitTorrent, Chia)

**Background**: Programmer; worked at Mojo Nation before BitTorrent.

**Contributions**:
- BitTorrent protocol (2001)
- Incentive-compatible P2P design
- Chia Network (proof-of-space blockchain, 2017)

**Influence**: Tit-for-tat incentive design influenced blockchain economics.

---

## EVM Relevance

Understanding node software primitives matters for:

1. **Node operation**: Choosing database, sync mode, networking configuration
2. **dApp development**: RPC interface patterns, reliability
3. **L2 development**: Building custom execution clients
4. **Performance optimization**: Understanding bottlenecks
5. **Client diversity**: Appreciating different architectural choices

### Storage Choice Impact

| Choice | Trade-off |
|--------|-----------|
| RocksDB (Nethermind, Besu) | Mature, well-understood, larger archives |
| MDBX (Erigon, Reth) | Smaller archives, different access patterns |
| Pebble (Geth 2024+) | Go-native, better integration |

---

## Citations

[@inproceedings_stoica_chord_2001]
[@inproceedings_maymounkov_kademlia_2002]
[@inproceedings_cohen_bittorrent_incentives_2003]
[@misc_libsecp256k1]
[@misc_libp2p]
[@misc_leveldb]
[@misc_rocksdb]

---

## Cross-References

- [Smart Contracts & VMs](smart_contracts_and_vms.md) — EVM client implementations
- [Byzantine Fault Tolerance](byzantine_fault_tolerance.md) — Consensus protocols
- [Public Key Cryptography](public_key_crypto.md) — Underlying crypto
- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — L2 client requirements
