# Governance & DAOs

## Definition

**On-chain governance** is the process of making collective decisions about protocol parameters, treasury allocation, and upgrades through transparent, verifiable mechanisms enforced by smart contracts.

**DAOs (Decentralized Autonomous Organizations)** are entities coordinated through smart contracts where:
- Rules are encoded as code
- Decisions are made by token holders or members
- Execution is automatic and transparent

Key governance components:
- **Voting mechanisms**: How decisions are made
- **Proposal systems**: How changes are suggested
- **Execution**: How decisions are implemented
- **Treasury management**: How funds are controlled

---

## Precursor Lineage

### 1. Corporate Governance (Traditional)

Traditional governance concepts that influenced DAOs:
- Shareholder voting (one share, one vote)
- Board of directors (delegated authority)
- Proxy voting (vote delegation)
- Quorum requirements

### 2. The DAO (2016)

**The DAO (April-June 2016)** — First major attempt at a DAO:
- Raised ~$150M in ETH
- Decentralized venture fund concept
- Exploited via reentrancy attack (~$60M drained)
- Led to Ethereum/Ethereum Classic fork

The DAO demonstrated both the potential and risks of on-chain governance.

### 3. Early On-Chain Governance

**Dash (2015)** — First blockchain with on-chain governance:
- Masternode voting on proposals
- Treasury funded by block rewards
- Influenced later designs

**Tezos (2018)** — Self-amending blockchain:
- On-chain voting for protocol upgrades
- Formal verification focus

---

## First Formalization

### Compound Governor (2020)

**Compound's Governor Alpha/Bravo** formalized on-chain governance:
- Proposal creation with threshold
- Voting period with quorum
- Timelock for execution delay
- Delegation mechanism

This became the de facto standard, later adopted by OpenZeppelin.

[@misc_compound_governance_2020]

### MolochDAO (2019)

**MolochDAO** introduced minimalist DAO design:
- Rage quit mechanism (exit with share of treasury)
- Guild kicks (remove members)
- Proposal deposit (anti-spam)
- Simple and auditable

Influenced Nouns, DAOhaus, and many others.

---

## First Major Deployment

### Governance Evolution

| Date | Protocol | Innovation |
|------|----------|------------|
| 2016 | The DAO | First major DAO; failed due to exploit |
| 2017 | Aragon | DAO framework and tools |
| 2019 | MolochDAO | Minimalist design; rage quit |
| 2020 | Compound Governor | Standard governance framework |
| 2020 | Snapshot | Off-chain voting |
| 2021 | ENS DAO | Large-scale airdrop + governance |
| 2021 | ConstitutionDAO | Crowdfunding experiment |
| 2022 | Optimism Collective | Two-house governance |
| 2023 | Arbitrum DAO | L2 governance at scale |

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2015 | Dash masternodes | First blockchain governance |
| 2016 | The DAO launch | First Ethereum DAO |
| 2016 | The DAO hack | Exposed smart contract risks |
| 2017 | Aragon launches | DAO tooling framework |
| 2018 | Tezos mainnet | Self-amending blockchain |
| 2019 | MolochDAO | Minimalist DAO design |
| 2020 | Compound governance | Governor Alpha standard |
| 2020 | YFI fair launch | Governance token distribution |
| 2020 | Snapshot | Gas-free voting |
| 2021 | DAO treasury explosion | $10B+ in DAO treasuries |
| 2022 | Legal DAOs | Wyoming DAO LLC recognition |
| 2023 | Governance fatigue | Low voter turnout concerns |

---

## Governance Mechanisms

### 1. Voting Systems

| System | Description | Trade-offs |
|--------|-------------|------------|
| Token voting | 1 token = 1 vote | Plutocratic; whale dominance |
| Quadratic voting | Cost = votes² | Sybil-vulnerable without identity |
| Conviction voting | Vote weight grows over time | Rewards long-term commitment |
| Holographic consensus | Boosted proposals | Scalable attention |
| Optimistic governance | Approve unless vetoed | Fast but risky |

### 2. Delegation

```
Token holder → Delegate → Vote
```

- Holders delegate voting power
- Delegates vote on their behalf
- Can be revoked at any time
- Enables specialization

### 3. Timelocks

```
Proposal passes → Timelock delay → Execution
```

- Delay between approval and execution
- Allows users to exit if they disagree
- Standard: 24-48 hours
- Critical: 7+ days

### 4. Multi-sig vs Token Voting

| Aspect | Multi-sig | Token Voting |
|--------|-----------|--------------|
| Speed | Fast (hours) | Slow (days) |
| Decentralization | Limited (n signers) | High (all holders) |
| Coordination | Easy | Difficult |
| Use case | Emergency actions | Major decisions |

---

## Common Misattributions

### 1. "DAOs are fully decentralized"

**Misconception**: DAOs eliminate all centralization.

**Reality**: Most DAOs have centralization vectors:
- Core teams control development
- Large token holders dominate votes
- Multi-sigs often have emergency powers
- Off-chain coordination shapes outcomes

**Confidence**: HIGH

### 2. "Token voting is democratic"

**Misconception**: Governance tokens create democracy.

**Reality**: Token voting is plutocratic—more tokens, more power. This may or may not be desirable depending on goals. True democracy requires one-person-one-vote, which needs identity/Sybil resistance.

**Confidence**: HIGH

### 3. "Compound invented on-chain governance"

**Misconception**: Compound created DAO governance.

**Reality**: Dash (2015), Tezos, and MakerDAO preceded Compound. Compound's contribution was a *standardized, reusable framework* that others could adopt.

**Confidence**: HIGH

### 4. "Low voter turnout means governance is broken"

**Misconception**: High participation is always necessary.

**Reality**: Low turnout may indicate:
- Satisfaction with current direction
- Effective delegation
- Rational apathy (costs > benefits)
- Not necessarily a problem if outcomes are good

**Confidence**: MEDIUM

---

## Open Questions

1. **Voter apathy**: How to encourage meaningful participation?

2. **Plutocracy concerns**: Is token-weighted voting appropriate?

3. **Legal status**: What legal protections do DAO members have?

4. **Governance attacks**: How to prevent hostile takeovers?

5. **Cross-chain governance**: How should multi-chain DAOs govern?

6. **AI in governance**: Should AI agents participate in DAOs?

---

## Technical Details

### Governor Contract (Simplified)

```solidity
contract Governor {
    struct Proposal {
        uint256 id;
        address proposer;
        uint256 forVotes;
        uint256 againstVotes;
        uint256 startBlock;
        uint256 endBlock;
        bool executed;
    }

    mapping(uint256 => Proposal) public proposals;

    function propose(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas
    ) public returns (uint256) {
        require(
            getVotes(msg.sender) >= proposalThreshold(),
            "Below threshold"
        );
        // Create proposal...
    }

    function castVote(uint256 proposalId, uint8 support) public {
        // Record vote weighted by token balance...
    }

    function execute(uint256 proposalId) public {
        require(state(proposalId) == ProposalState.Succeeded);
        // Execute via timelock...
    }
}
```

### Snapshot (Off-chain Voting)

```
1. Proposal created on Snapshot
2. Block number set for vote snapshot
3. Voters sign messages (no gas)
4. Votes tallied off-chain
5. Result executed via multi-sig or on-chain
```

### Gnosis Safe Multi-sig

```solidity
// n-of-m signature requirement
function execTransaction(
    address to,
    uint256 value,
    bytes calldata data,
    // ... signatures
) public returns (bool success) {
    bytes32 txHash = getTransactionHash(...);
    checkSignatures(txHash, signatures);
    // Execute if threshold met
}
```

---

## DAO Treasury Statistics

| DAO | Treasury (2024) | Governance Model |
|-----|-----------------|------------------|
| Uniswap | ~$3B | Governor Bravo |
| Arbitrum | ~$2.5B | Token voting |
| Optimism | ~$1.5B | Two-house (Token + Citizens) |
| Lido | ~$400M | Token voting |
| ENS | ~$300M | Governor + delegates |

---

## EVM Relevance

Governance is essential for EVM protocol development:

1. **Protocol upgrades**: EIPs require rough consensus; DAOs formalize this
2. **Treasury management**: Grants, funding, operations
3. **Parameter changes**: Fee adjustments, risk parameters
4. **Emergency responses**: Pausing contracts, migrations
5. **Ecosystem coordination**: Standards, integrations

### OpenZeppelin Governor (Standard Implementation)

```solidity
import "@openzeppelin/contracts/governance/Governor.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorTimelockControl.sol";

contract MyGovernor is Governor, GovernorVotes, GovernorTimelockControl {
    constructor(
        IVotes _token,
        TimelockController _timelock
    ) Governor("MyGovernor")
      GovernorVotes(_token)
      GovernorTimelockControl(_timelock)
    {}

    function votingDelay() public pure override returns (uint256) {
        return 1 days;
    }

    function votingPeriod() public pure override returns (uint256) {
        return 1 weeks;
    }

    function quorum(uint256) public pure override returns (uint256) {
        return 4e18; // 4% of total supply
    }
}
```

---

## Citations

[@misc_compound_governance_2020]
[@misc_moloch_dao_2019]
[@misc_aragon_whitepaper_2017]

---

## Cross-References

- [Token Standards Evolution](token_standards_evolution.md) — Governance tokens (ERC-20)
- [Smart Contracts & VMs](smart_contracts_and_vms.md) — DAO smart contract architecture
- [MEV & Auctions](mev_and_auctions.md) — Governance attack vectors
