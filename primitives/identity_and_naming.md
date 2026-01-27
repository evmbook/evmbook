# Identity & Naming

## Definition

**On-chain identity** encompasses systems for:
- **Naming**: Human-readable addresses (ENS, Lens handles)
- **Attestations**: Verifiable claims about addresses
- **Reputation**: Historical behavior records
- **Credentials**: Proof of membership, skills, achievements

The challenge: Providing identity benefits (reputation, recovery, compliance) while preserving pseudonymity and privacy.

---

## Precursor Lineage

### 1. DNS (Domain Name System)

Traditional internet naming:
- Human-readable → IP address mapping
- Centralized registries (ICANN)
- Hierarchical structure

### 2. Namecoin (2011)

**First blockchain naming system**:
- `.bit` domains on Bitcoin fork
- Decentralized registration
- Limited adoption due to usability

### 3. Zooko's Triangle (1990s-2001)

**Zooko Wilcox-O'Hearn** articulated the trade-off:
- Human-meaningful
- Secure (cryptographically verifiable)
- Decentralized

Originally thought impossible to achieve all three; blockchain naming systems proved otherwise.

---

## First Formalization

### ENS (Ethereum Name Service) - 2017

**Nick Johnson** launched ENS:
- `.eth` names on Ethereum
- Registry + resolver architecture
- Reverse resolution (address → name)
- Multi-coin support

[@misc_ens_2017]

ENS demonstrated that Zooko's Triangle can be solved with blockchain + social consensus.

---

## First Major Deployment

### Identity Systems Evolution

| Date | System | Innovation |
|------|--------|------------|
| 2011 | Namecoin | First decentralized naming |
| 2017 | ENS | Ethereum naming standard |
| 2019 | 3Box | Decentralized profiles |
| 2020 | BrightID | Sybil-resistant identity |
| 2022 | Lens Protocol | Social graph on-chain |
| 2022 | Soulbound Tokens | Non-transferable credentials |
| 2023 | Worldcoin | Biometric identity |
| 2023 | EAS | Ethereum Attestation Service |

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2011 | Namecoin | First blockchain DNS |
| 2017 | ENS launch | Ethereum naming |
| 2019 | ENS short names | Three-letter domains |
| 2021 | ENS governance token | $ENS airdrop |
| 2022 | Lens Protocol | Decentralized social |
| 2022 | Vitalik's "Soulbound" paper | Non-transferable tokens |
| 2023 | ENS offchain names | L2 and gasless resolution |
| 2023 | ERC-6551 | NFTs as identity containers |

---

## Identity Primitives

### 1. ENS Architecture

```
Registry (owns names)
    ↓
Resolver (stores records)
    ↓
Records (addresses, text, contenthash)
```

**Registration**:
- Auction-based (expired) / instant registration
- Annual renewal fees
- Subdomains: `sub.name.eth`

**Resolution**:
```solidity
// Forward: name → address
address owner = ens.resolve("vitalik.eth");

// Reverse: address → name
string name = ens.reverse(address);
```

### 2. Soulbound Tokens (SBTs)

Non-transferable tokens representing:
- Educational credentials
- Employment history
- Citizenship/membership
- Reputation scores

**Proposed by**: Vitalik Buterin, Glen Weyl, Puja Ohlhaver (2022)

**Key properties**:
- Cannot be transferred or sold
- Revocable by issuer
- Composable with other credentials

### 3. Attestations

**Format**: "Issuer attests that Subject has Property"

Examples:
- "University X attests that Alice graduated 2023"
- "Protocol Y attests that Bob is KYC verified"
- "User Z attests that Carol is trustworthy"

**EAS (Ethereum Attestation Service)** standardizes on-chain attestations.

### 4. Social Graphs

**Lens Protocol** architecture:
```
Profile NFT (identity)
    ↓
Follow NFTs (social graph)
    ↓
Publication NFTs (content)
```

Portable, user-owned social identity across applications.

---

## Common Misattributions

### 1. "ENS is just DNS on blockchain"

**Misconception**: ENS only does name resolution.

**Reality**: ENS provides:
- Multi-coin addresses (BTC, ETH, etc.)
- IPFS content hashes
- Text records (Twitter, email, avatar)
- Subname delegation
- Decentralized websites

**Confidence**: HIGH

### 2. "On-chain identity is incompatible with privacy"

**Misconception**: Blockchain identity means full transparency.

**Reality**: Privacy-preserving approaches exist:
- Selective disclosure
- ZK proofs of credentials
- Off-chain attestations with on-chain verification
- Separate identities for different contexts

**Confidence**: HIGH

### 3. "Soulbound tokens are just non-transferable NFTs"

**Misconception**: SBTs are a simple technical change.

**Reality**: SBTs represent a paradigm shift:
- From tradeable assets to personal credentials
- Enable undercollateralized lending (reputation as collateral)
- Challenge "everything should be liquid" ethos

**Confidence**: HIGH

---

## Open Questions

1. **Sybil resistance**: How to prove unique personhood without biometrics?

2. **Recovery**: How should soulbound tokens handle key loss?

3. **Privacy**: How to balance transparency and privacy in credentials?

4. **Interoperability**: Should identities work across all blockchains?

5. **Legal recognition**: Will governments accept on-chain credentials?

6. **Reputation portability**: Should reputation transfer across contexts?

---

## Technical Details

### ENS Resolution

```solidity
// ENS registry interface
interface ENS {
    function resolver(bytes32 node) external view returns (address);
    function owner(bytes32 node) external view returns (address);
}

// Resolver interface
interface Resolver {
    function addr(bytes32 node) external view returns (address);
    function text(bytes32 node, string key) external view returns (string);
    function contenthash(bytes32 node) external view returns (bytes);
}

// Usage
bytes32 node = namehash("vitalik.eth");
address resolver = ens.resolver(node);
address ethAddress = Resolver(resolver).addr(node);
string twitter = Resolver(resolver).text(node, "com.twitter");
```

### Namehash Algorithm

```javascript
function namehash(name) {
    if (name === '') return bytes32(0);
    const labels = name.split('.');
    let node = bytes32(0);
    for (let i = labels.length - 1; i >= 0; i--) {
        node = keccak256(node + keccak256(labels[i]));
    }
    return node;
}
// namehash("vitalik.eth") =
// keccak256(keccak256(0 + keccak256("eth")) + keccak256("vitalik"))
```

### Soulbound Token (Minimal)

```solidity
contract SoulboundToken {
    mapping(address => uint256) public balanceOf;
    mapping(uint256 => address) public ownerOf;

    function mint(address to, uint256 tokenId) external onlyIssuer {
        ownerOf[tokenId] = to;
        balanceOf[to]++;
    }

    function revoke(uint256 tokenId) external onlyIssuer {
        address owner = ownerOf[tokenId];
        delete ownerOf[tokenId];
        balanceOf[owner]--;
    }

    // No transfer functions - intentionally omitted
}
```

### Attestation Schema (EAS)

```solidity
struct Attestation {
    bytes32 uid;           // Unique identifier
    bytes32 schema;        // Schema definition
    address attester;      // Who made the attestation
    address recipient;     // Who it's about
    uint64 time;           // When created
    uint64 expirationTime; // When it expires
    bool revocable;        // Can be revoked
    bytes data;            // Schema-specific data
}
```

---

## EVM Relevance

Identity is becoming critical infrastructure:

1. **DeFi**: Undercollateralized lending with reputation
2. **Governance**: Sybil-resistant voting (one person, one vote)
3. **Airdrops**: Targeting real users vs. farmers
4. **Compliance**: KYC attestations for regulated protocols
5. **Social**: Decentralized social networks

### ENS Integration Example

```solidity
import "@ensdomains/ens-contracts/contracts/registry/ENS.sol";

contract ENSAware {
    ENS public ens = ENS(0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e);

    function resolveENS(string memory name) public view returns (address) {
        bytes32 node = namehash(name);
        address resolver = ens.resolver(node);
        return Resolver(resolver).addr(node);
    }

    function getProfile(string memory name) public view returns (
        address ethAddress,
        string memory twitter,
        string memory avatar
    ) {
        bytes32 node = namehash(name);
        address resolver = ens.resolver(node);
        Resolver r = Resolver(resolver);

        ethAddress = r.addr(node);
        twitter = r.text(node, "com.twitter");
        avatar = r.text(node, "avatar");
    }
}
```

---

## Citations

[@misc_ens_2017]
[@misc_soulbound_2022]
[@misc_lens_protocol_2022]

---

## Cross-References

- [Token Standards Evolution](token_standards_evolution.md) — NFTs as identity
- [Governance & DAOs](governance_and_daos.md) — Identity for voting
- [Privacy Protocols](privacy_protocols.md) — Private credentials
