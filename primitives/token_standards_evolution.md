# Token Standards Evolution

## Definition

**Tokens** are ledger abstractions representing ownership, rights, or value on a blockchain. Token standards define common interfaces for:
- **Transfer**: Moving tokens between addresses
- **Approval**: Authorizing others to spend tokens
- **Balance queries**: Checking ownership
- **Metadata**: Name, symbol, decimals, URI

Token standards enable composability—any compliant token works with any compliant application.

---

## Precursor Lineage

### 1. Colored Coins (2012-2013)

**Colored coins** on Bitcoin:
- Mark specific satoshis to represent assets
- Limited by Bitcoin Script constraints
- No smart contract logic

Projects: Mastercoin (Omni), Counterparty

### 2. Pre-Standard Ethereum Tokens (2015)

Before ERC-20, custom token contracts existed with incompatible interfaces:
- Different function names
- Different event signatures
- No standard for approval mechanism

---

## First Formalization

### ERC-20 (November 2015)

**Fabian Vogelsteller and Vitalik Buterin** proposed ERC-20:
- Standard interface for fungible tokens
- `transfer`, `approve`, `transferFrom` functions
- `balanceOf` and `allowance` queries
- `Transfer` and `Approval` events

[@eip_erc20_2015]

This became the foundation for the ICO boom and DeFi.

---

## Token Standard Evolution

### The ERC Family

| Standard | Year | Type | Key Innovation |
|----------|------|------|----------------|
| ERC-20 | 2015 | Fungible | Standard interface |
| ERC-721 | 2017 | Non-fungible | Unique token IDs |
| ERC-777 | 2017 | Fungible+ | Hooks, operators |
| ERC-1155 | 2018 | Multi-token | Batch transfers, mixed types |
| ERC-4626 | 2022 | Vault | Yield-bearing token standard |
| ERC-6551 | 2023 | Token-bound accounts | NFTs own assets |

---

## First Major Deployment

### ERC-20 Tokens

| Date | Token | Significance |
|------|-------|--------------|
| 2015 | Augur (REP) | Early ERC-20 |
| 2016 | The DAO | Governance token |
| 2017 | ICO explosion | Thousands of ERC-20s |
| 2018 | Stablecoins | USDT, USDC on ERC-20 |
| 2020 | DeFi governance | UNI, COMP, AAVE |

### ERC-721 NFTs

| Date | Project | Significance |
|------|---------|--------------|
| 2017 | CryptoKitties | First viral NFT |
| 2018 | Decentraland | Virtual land NFTs |
| 2021 | Beeple sale | $69M NFT |
| 2021 | BAYC | PFP phenomenon |
| 2022 | Ordinals | NFTs on Bitcoin |

---

## Crypto Adoption Timeline

| Date | Event | Significance |
|------|-------|--------------|
| 2012-13 | Colored coins | Asset representation on Bitcoin |
| Nov 2015 | ERC-20 proposed | Fungible token standard |
| Sep 2017 | ERC-721 finalized | NFT standard |
| Nov 2017 | CryptoKitties | NFT mainstream awareness |
| Jun 2018 | ERC-1155 finalized | Multi-token standard |
| 2020 | DeFi Summer | ERC-20 at scale |
| 2021 | NFT explosion | $25B+ NFT market |
| Apr 2022 | ERC-4626 finalized | Vault standard |
| May 2023 | ERC-6551 finalized | Token-bound accounts |

---

## Standard Details

### ERC-20: Fungible Tokens

```solidity
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
```

**Key properties**:
- All tokens are identical (fungible)
- Divisible to `decimals` places (usually 18)
- Two-step approval: `approve` then `transferFrom`

### ERC-721: Non-Fungible Tokens

```solidity
interface IERC721 {
    function balanceOf(address owner) external view returns (uint256);
    function ownerOf(uint256 tokenId) external view returns (address);
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
    function transferFrom(address from, address to, uint256 tokenId) external;
    function approve(address to, uint256 tokenId) external;
    function setApprovalForAll(address operator, bool approved) external;
    function getApproved(uint256 tokenId) external view returns (address);
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
}
```

**Key properties**:
- Each token has unique `tokenId`
- Not divisible (whole units only)
- `safeTransferFrom` checks receiver capability
- Metadata extension for URI

### ERC-1155: Multi-Token

```solidity
interface IERC1155 {
    function balanceOf(address account, uint256 id) external view returns (uint256);
    function balanceOfBatch(address[] calldata accounts, uint256[] calldata ids) external view returns (uint256[] memory);
    function safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes calldata data) external;
    function safeBatchTransferFrom(address from, address to, uint256[] calldata ids, uint256[] calldata amounts, bytes calldata data) external;
    function setApprovalForAll(address operator, bool approved) external;
    function isApprovedForAll(address account, address operator) external view returns (bool);
}
```

**Key properties**:
- Single contract holds multiple token types
- Efficient batch transfers
- Mix fungible and non-fungible
- Game items, collectible sets

### ERC-4626: Tokenized Vaults

```solidity
interface IERC4626 {
    function asset() external view returns (address);
    function totalAssets() external view returns (uint256);
    function convertToShares(uint256 assets) external view returns (uint256);
    function convertToAssets(uint256 shares) external view returns (uint256);
    function deposit(uint256 assets, address receiver) external returns (uint256 shares);
    function withdraw(uint256 assets, address receiver, address owner) external returns (uint256 shares);
}
```

**Key properties**:
- Standard for yield-bearing tokens
- Deposit/withdraw with share accounting
- Enables vault composability

### ERC-6551: Token Bound Accounts

```solidity
interface IERC6551Account {
    function token() external view returns (uint256 chainId, address tokenContract, uint256 tokenId);
    function state() external view returns (uint256);
    function isValidSigner(address signer, bytes calldata context) external view returns (bytes4);
}
```

**Key properties**:
- Every NFT can own assets
- NFT becomes a wallet
- Enables complex composability

---

## Common Misattributions

### 1. "NFTs are just art/JPEGs"

**Misconception**: NFTs are only useful for digital art.

**Reality**: NFT (ERC-721/1155) is a primitive for any unique digital asset:
- Domain names (ENS)
- Financial positions (Uniswap V3 LP)
- Event tickets
- Identity credentials
- Game items

**Confidence**: HIGH

### 2. "ERC-20 is obsolete"

**Misconception**: ERC-777 or newer standards replaced ERC-20.

**Reality**: ERC-20 remains dominant due to:
- Universal support
- Simple, audited implementations
- Hooks in ERC-777 introduced reentrancy vectors
- Network effects

**Confidence**: HIGH

### 3. "Tokens are only for speculation"

**Misconception**: Tokens have no utility beyond trading.

**Reality**: Tokens enable:
- Governance rights
- Protocol revenue sharing
- Access control
- Coordination mechanisms
- Collateral for lending

**Confidence**: HIGH

---

## Open Questions

1. **Soul-bound tokens**: Should non-transferable tokens be standardized?

2. **Cross-chain tokens**: How should tokens work across multiple chains?

3. **Regulatory compliance**: Should transfer restrictions be in the standard?

4. **Gas optimization**: Can standards be more efficient?

5. **Metadata standards**: How should on-chain vs off-chain metadata work?

---

## Technical Details

### Token Economics Patterns

| Pattern | Description | Examples |
|---------|-------------|----------|
| Fixed supply | No minting after deployment | BTC, UNI |
| Inflationary | Continuous minting | ETH (PoS rewards) |
| Deflationary | Burn mechanism | BNB burns |
| Rebasing | Supply adjusts automatically | AMPL, OHM |
| Elastic | Supply changes, price stable | RAI |

### Approval Patterns

**Classic Two-Step**:
```solidity
token.approve(spender, amount);
spender.transferFrom(owner, recipient, amount);
```

**Permit (EIP-2612)**:
```solidity
// Sign off-chain, execute in one tx
token.permit(owner, spender, value, deadline, v, r, s);
spender.transferFrom(owner, recipient, amount);
```

### Safe Transfer Pattern

```solidity
// Check if receiver can handle NFTs
function safeTransferFrom(address from, address to, uint256 tokenId) external {
    _transfer(from, to, tokenId);
    require(
        _checkOnERC721Received(from, to, tokenId, ""),
        "Transfer to non-receiver"
    );
}
```

---

## EVM Relevance

Token standards are foundational to all EVM applications:

1. **DeFi**: All protocols interact with ERC-20/721
2. **Governance**: ERC-20 with voting extensions
3. **NFT marketplaces**: ERC-721/1155 ecosystem
4. **Yield aggregation**: ERC-4626 composability
5. **Identity**: NFTs as credentials, ENS as identity

### OpenZeppelin Implementation

```solidity
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
```

---

## Citations

[@eip_erc20_2015]
[@eip_erc721_2018]
[@eip_erc1155_2018]
[@eip_erc4626_2022]

---

## Cross-References

- [Governance & DAOs](governance_and_daos.md) — Governance tokens
- [AMM Constant Product](amm_constant_product.md) — Token pairs in DEXs
- [Stablecoins & Collateral](stablecoins_and_collateral.md) — Stablecoin tokens
- [Identity & Naming](identity_and_naming.md) — NFTs for identity
