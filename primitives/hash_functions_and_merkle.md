# Hash Functions & Merkle Trees

## Definition

### Hash Functions

A cryptographic hash function maps arbitrary input to fixed-size output with properties:
- **Deterministic**: Same input → same output
- **Fast**: Efficient to compute
- **Pre-image resistant**: Given h, hard to find m where H(m) = h
- **Second pre-image resistant**: Given m1, hard to find m2 ≠ m1 where H(m1) = H(m2)
- **Collision resistant**: Hard to find any m1, m2 where H(m1) = H(m2)

### Merkle Trees

A Merkle tree is a binary tree of hashes where:
- Leaves contain data hashes
- Internal nodes contain hashes of their children
- Root ("Merkle root") commits to all data

Properties:
- **Efficient verification**: Prove inclusion with O(log n) hashes
- **Tamper-evident**: Any change alters the root
- **Composable**: Trees can be combined

---

## Precursor Lineage

### 1. Hash Function Development

| Year | Algorithm | Notes |
|------|-----------|-------|
| 1979 | Merkle-Damgård | Construction for building hash functions |
| 1990 | MD4 | Ron Rivest; fast but insecure |
| 1991 | MD5 | Rivest; widely used but now broken |
| 1993 | SHA-0 | NSA design; withdrawn |
| 1995 | SHA-1 | NSA; used until ~2017 |
| 2001 | SHA-2 (SHA-256) | Current standard; used by Bitcoin |
| 2012 | Keccak (SHA-3) | NIST competition winner; used by Ethereum |

### 2. Merkle Tree Invention

**Ralph Merkle (1979)** — Invented Merkle trees in his Stanford PhD thesis. [@thesis_merkle_secrecy_1979]

Original motivation: Efficient digital signatures using hash functions (without public key crypto).

Key insight: A single hash (root) can commit to arbitrary amounts of data while enabling efficient proofs.

---

## First Formalization

**Merkle (1979)** — "Secrecy, Authentication, and Public Key Systems"

The dissertation introduced:
- Merkle puzzles (key exchange)
- Merkle trees (authenticated data structures)
- Tree-based signature schemes

---

## First Major Deployment

### Hash Functions

- **MD5**: Widely used 1990s-2000s (now considered broken)
- **SHA-1**: SSL certificates, Git (transitioning away)
- **SHA-256**: Bitcoin, TLS 1.3, most modern systems

### Merkle Trees

- **Git (2005)**: Version control uses Merkle DAGs
- **Bitcoin (2009)**: Block headers contain Merkle root of transactions
- **BitTorrent**: Piece verification uses Merkle trees
- **IPFS (2014)**: Content-addressed storage via Merkle DAGs

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 1979 | Merkle trees invented | Efficient verification structures |
| 2001 | SHA-256 published | Used by Bitcoin |
| 2009 | Bitcoin | Merkle roots in block headers |
| 2012 | Keccak standardized | Ethereum's hash function |
| 2014 | IPFS | Content addressing via Merkle DAGs |
| 2015 | Ethereum | Uses Merkle Patricia Tries for state |
| 2018 | Merkle Mountain Ranges | Used for light client proofs |
| 2024 | Verkle Trees | Proposed for Ethereum state |

---

## Hash Functions in Blockchain

### Bitcoin: SHA-256

- Block hashing: SHA-256(SHA-256(header))
- Transaction IDs: SHA-256(SHA-256(tx))
- Address derivation: RIPEMD160(SHA-256(pubkey))

### Ethereum: Keccak-256

- Block hashing: Keccak-256
- Address derivation: Keccak-256(pubkey)[12:32]
- State storage: Keccak-256 for keys

Note: Ethereum uses Keccak-256, not the standardized SHA-3. They differ in padding.

### Why Different Hashes?

Satoshi chose SHA-256 (NSA-designed, NIST standard). Ethereum chose Keccak (independent design, won NIST competition). Both are considered secure.

---

## Merkle Trees in Blockchain

### Bitcoin Block Structure

```
Block Header:
├── Version
├── Previous Block Hash
├── Merkle Root ←── commits to all transactions
├── Timestamp
├── Difficulty Target
└── Nonce

Merkle Tree:
       Root
      /    \
    H12    H34
   /  \   /  \
  H1  H2 H3  H4
  |   |  |   |
 Tx1 Tx2 Tx3 Tx4
```

### Ethereum State Trie

Ethereum uses Merkle Patricia Tries:
- Accounts stored by address (key)
- State root commits to all account states
- Enables state proofs for light clients

### Merkle Proofs

To prove Tx3 is in the block:
```
Proof = [H4, H12]
Verify: Root == Hash(H12, Hash(H3, H4))
```

Proof size: O(log n) hashes for n transactions.

---

## Common Misattributions

### 1. "Blockchain invented Merkle trees"

**Misconception**: Merkle trees are a blockchain innovation.

**Reality**: Merkle invented them in 1979, 30 years before Bitcoin. They were used in Git, certificate transparency, and other systems first.

**Confidence**: HIGH

**Sources**: [@thesis_merkle_secrecy_1979]

### 2. "SHA-3 and Keccak are the same"

**Misconception**: Ethereum uses SHA-3.

**Reality**: Ethereum uses Keccak-256, which won the SHA-3 competition but differs from the final SHA-3 standard (different padding).

**Confidence**: HIGH

### 3. "Merkle trees are only for transactions"

**Misconception**: Merkle trees only commit to transaction lists.

**Reality**: They commit to any data—account state (Ethereum), file chunks (IPFS), historical data (accumulators).

**Confidence**: HIGH

---

## Open Questions

1. **Verkle tree migration**: How will Ethereum transition from Merkle Patricia Tries to Verkle trees?

2. **Post-quantum hashes**: Are current hash functions quantum-resistant? (Generally believed yes)

3. **Optimal tree structure**: Is binary optimal, or are other arities better for specific use cases?

4. **State growth**: How can Merkle proofs remain efficient as state grows?

---

## Technical Details

### Keccak-256 (Ethereum)

```solidity
bytes32 hash = keccak256(abi.encodePacked(data));
```

Cost: 30 gas + 6 gas per word

### Merkle Patricia Trie

Ethereum's state trie combines:
- Radix trie (key compression)
- Merkle tree (cryptographic commitment)

Node types:
- Extension node: shared prefix
- Branch node: 16 children + value
- Leaf node: remaining path + value

---

## EVM Relevance

Hash functions are ubiquitous in EVM:

1. **Transaction hashing**: Every tx has unique hash
2. **Block headers**: Include state root, receipts root, transactions root
3. **Storage keys**: keccak256 for mapping slot calculation
4. **Event topics**: keccak256 of event signature
5. **CREATE2**: Deterministic deployment addresses
6. **Precompiles**: SHA-256 (0x02), RIPEMD-160 (0x03)

### Storage Slot Calculation

```solidity
// mapping(address => uint256) balances;
// balances[addr] stored at:
slot = keccak256(abi.encodePacked(addr, mappingSlot))
```

---

## Citations

[@thesis_merkle_secrecy_1979]
[@whitepaper_nakamoto_bitcoin_2008]
[@yellowpaper_wood_ethereum_2014]

---

## Cross-References

- [Public Key Cryptography](public_key_crypto.md) — Merkle invented both PKC concepts and trees
- [Proof of Work](proof_of_work.md) — Mining uses repeated hashing
- [L2 Rollups & Data Availability](l2_rollups_and_data_availability.md) — Merkle proofs for state verification
