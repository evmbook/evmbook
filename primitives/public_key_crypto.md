# Public Key Cryptography

## Definition

Public key cryptography (asymmetric cryptography) uses mathematically related key pairs:
- **Private key**: Secret; used to sign messages and decrypt data
- **Public key**: Shareable; used to verify signatures and encrypt data

The fundamental property: deriving the private key from the public key is computationally infeasible.

In blockchain contexts:
- Private key → signs transactions (proves ownership)
- Public key → derives address (identifies account)
- Digital signature → authorizes state changes

---

## Precursor Lineage

### 1. Symmetric Cryptography Limitations (Pre-1976)

Before public key crypto, all encryption was symmetric:
- Same key encrypts and decrypts
- Key distribution problem: how to share keys securely?
- Doesn't enable digital signatures

### 2. Independent Discovery at GCHQ (1970-1974)

**Classified**: British cryptographers at GCHQ independently discovered public key concepts:
- James Ellis (1970) — Key concept of asymmetric encryption
- Clifford Cocks (1973) — Algorithm equivalent to RSA
- Malcolm Williamson (1974) — Algorithm equivalent to Diffie-Hellman

This remained classified until 1997, so had no public influence.

### 3. Public Discovery (1976-1978)

**Diffie & Hellman (1976)** — "New Directions in Cryptography" publicly introduced:
- Public key cryptography concept
- Diffie-Hellman key exchange protocol
- Vision for digital signatures

[@article_diffie_hellman_1976]

**Merkle (1974-1978)** — Ralph Merkle independently developed:
- Public key concepts (Merkle puzzles, 1974)
- Merkle trees (1979)

[@thesis_merkle_secrecy_1979]

**RSA (1977-1978)** — Rivest, Shamir, Adleman created the first practical public key cryptosystem using prime factorization.

[@article_rivest_rsa_1978]

---

## First Formalization

**Diffie & Hellman (1976)** — IEEE Transactions on Information Theory

The paper:
- Formalized the concept of asymmetric key pairs
- Described Diffie-Hellman key exchange
- Outlined requirements for digital signature schemes
- Predicted the transformative impact on secure communication

---

## First Major Deployment

### Academic/Commercial: RSA (1978+)

RSA was the first widely implemented public key system:
- Patented in the US (expired 2000)
- Formed RSA Security (company)
- Used in PGP, SSL/TLS, and countless applications

### Elliptic Curve Cryptography (1985-1987)

**Koblitz & Miller (1985-1987)** independently proposed ECC:
- Same security with smaller keys
- Faster computation
- Lower bandwidth

[@article_koblitz_elliptic_1987; @article_miller_elliptic_1985]

### Blockchain: Bitcoin (2009)

Bitcoin uses ECDSA on the secp256k1 curve:
- 256-bit private keys
- 512-bit public keys (compressed to 264 bits)
- 160-bit addresses (RIPEMD-160 of SHA-256 of public key)

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 1976 | Diffie-Hellman paper | Public key crypto published |
| 1978 | RSA paper | First practical PKC system |
| 1979 | Merkle trees | Efficient verification structures |
| 1985-87 | ECC discovery | Efficient public key crypto |
| 1991 | PGP released | Consumer encryption |
| 1995 | SSL/TLS | Web encryption |
| 2000 | secp256k1 defined | Curve used by Bitcoin |
| 2009 | Bitcoin | PKC for decentralized money |
| 2015 | Ethereum | PKC for smart contract accounts |

---

## Common Misattributions

### 1. "Diffie-Hellman invented public key cryptography"

**Misconception**: Diffie and Hellman were the sole inventors.

**Reality**: Ralph Merkle independently developed PKC concepts, and GCHQ cryptographers discovered it earlier (classified). Diffie-Hellman were the first to publish publicly.

**Confidence**: HIGH

**Sources**: GCHQ declassification (1997); [@thesis_merkle_secrecy_1979]

### 2. "RSA and Diffie-Hellman are the same thing"

**Misconception**: These are interchangeable systems.

**Reality**:
- Diffie-Hellman: Key exchange protocol
- RSA: Encryption and signature scheme
They solve different (related) problems.

**Confidence**: HIGH

### 3. "Blockchain invented new cryptography"

**Misconception**: Bitcoin required cryptographic innovations.

**Reality**: Bitcoin uses standard cryptographic primitives (ECDSA, SHA-256, RIPEMD-160) that existed for years. The innovation was combining them with economic incentives.

**Confidence**: HIGH

---

## Open Questions

1. **Post-quantum cryptography**: Will quantum computers break ECC? When should blockchains migrate?

2. **secp256k1 choice**: Why did Satoshi choose secp256k1 over NIST curves? Was it prescient (NIST backdoor concerns) or coincidental?

3. **Signature aggregation**: How can many signatures be verified more efficiently (BLS, Schnorr)?

4. **Account abstraction**: How should signature verification change with smart contract accounts?

---

## Technical Details

### ECDSA (Ethereum/Bitcoin)

Key generation:
```
private_key = random 256-bit integer
public_key = private_key × G  (point multiplication)
```

Where G is the secp256k1 generator point.

Signing:
```
(r, s) = ECDSA_sign(private_key, message_hash)
```

Verification:
```
recovered_pubkey = ECDSA_recover(message_hash, r, s, v)
valid = (recovered_pubkey == expected_pubkey)
```

### Address Derivation (Ethereum)

```
public_key = secp256k1(private_key)
address = keccak256(public_key)[12:32]  // last 20 bytes
```

---

## EVM Relevance

Public key cryptography is foundational to EVM:

1. **Account ownership**: Private keys control accounts
2. **Transaction authorization**: Every transaction requires signature
3. **ecrecover precompile**: 0x01; recovers signer from signature
4. **CREATE2 addresses**: Deterministic contract deployment
5. **EIP-712**: Typed structured data signing
6. **Account abstraction**: Custom signature verification

### Key EVM Operations

| Precompile | Address | Function |
|------------|---------|----------|
| ecrecover | 0x01 | Recover signer from ECDSA signature |
| SHA256 | 0x02 | SHA-256 hash |
| RIPEMD160 | 0x03 | RIPEMD-160 hash |
| identity | 0x04 | Data copy |
| modexp | 0x05 | Modular exponentiation |
| ecAdd | 0x06 | BN256 point addition |
| ecMul | 0x07 | BN256 scalar multiplication |
| ecPairing | 0x08 | BN256 pairing check |

---

## Citations

[@article_diffie_hellman_1976]
[@article_rivest_rsa_1978]
[@thesis_merkle_secrecy_1979]
[@article_koblitz_elliptic_1987]
[@article_miller_elliptic_1985]
[@whitepaper_nakamoto_bitcoin_2008]

---

## Cross-References

- [Hash Functions & Merkle Trees](hash_functions_and_merkle.md) — Merkle invented both
- [Byzantine Fault Tolerance](byzantine_fault_tolerance.md) — Signatures enable authenticated messages
- [Smart Contracts & VMs](smart_contracts_and_vms.md) — Contract accounts and signatures
