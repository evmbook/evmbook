# GitHub Copilot Instructions

## Project Context

This is the **Mastering EVM** book series repository—educational content about Ethereum Virtual Machine development.

## Content Type

- MDX files (Markdown + JSX components)
- Technical documentation about blockchain/EVM
- Code examples in Solidity, JavaScript/TypeScript
- Both Ethereum (ETH) and Ethereum Classic (ETC) coverage

## Code Standards

### Solidity
- Version 0.8.26 or later
- Use SPDX license identifiers
- Prefer explicit visibility modifiers
- Use custom errors over require strings
- Follow Checks-Effects-Interactions pattern

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Example {
    error InsufficientBalance(uint256 requested, uint256 available);

    function withdraw(uint256 amount) external {
        // Checks
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance(amount, balances[msg.sender]);
        }
        // Effects
        balances[msg.sender] -= amount;
        // Interactions
        payable(msg.sender).transfer(amount);
    }
}
```

### JavaScript/TypeScript
- Use ethers.js v6 syntax (not v5)
- Prefer viem for new code
- TypeScript preferred over JavaScript
- Use async/await over .then()

```typescript
// ethers.js v6
import { ethers } from "ethers";
const provider = new ethers.JsonRpcProvider(url);
const balance = await provider.getBalance(address);

// viem
import { createPublicClient, http } from "viem";
import { mainnet } from "viem/chains";
const client = createPublicClient({ chain: mainnet, transport: http() });
```

## MDX Components

Use these components in MDX files:

```mdx
<Callout type="info">
Informational note
</Callout>

<Callout type="warning">
Warning about potential issues
</Callout>

<Note>
Brief aside or tip
</Note>

<Tip>
Helpful suggestion
</Tip>
```

## Key Technical Context

### EIP-1559 Differences
- **Ethereum**: Base fee is burned
- **Ethereum Classic** (Olympia): Base fee goes to treasury

### New Opcodes (2024-2025)
- `PUSH0` (0x5F): Push zero, saves gas
- `MCOPY` (0x5E): Memory copy
- `TLOAD`/`TSTORE` (0x5C/0x5D): Transient storage
- `BASEFEE` (0x48): Block base fee

### Transaction Types
- Type 0: Legacy (gasPrice)
- Type 1: Access list (EIP-2930)
- Type 2: EIP-1559 (maxFeePerGas, maxPriorityFeePerGas)
- Type 3: Blob (EIP-4844, ETH only)

## Writing Guidelines

- Be technically accurate
- Include practical code examples
- Explain both ETH and ETC where relevant
- Document historical context and lessons from failures
- Use consistent terminology from the glossary
