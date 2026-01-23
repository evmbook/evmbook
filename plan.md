# Plan: Add Agentic Coding Chapter to Mastering EVM

## Overview

Add a new **Chapter 18: Agentic Development** to evmbook-v1 that frames AI-assisted coding as a strategic advantage for resource-constrained blockchain networks like Ethereum Classic. This chapter positions ETC as a case study in how small, principled teams can leverage agentic coding to achieve what well-funded foundation teams accomplish—while staying true to decentralization principles.

## Rationale

### The ETC Case Study

Ethereum Classic operates fundamentally differently from most blockchain projects:

- **No premine, no foundation treasury** — Unlike ETH (72M premine), ETC has no central war chest
- **Small core team** — A handful of dedicated developers vs. Ethereum Foundation's 100+ engineers
- **Proof of Work integrity** — Maintains the original Ethereum vision without governance capture
- **Immutability principle** — "Code is Law" philosophy demands exceptional code quality

This resource constraint creates an opportunity: **embed network principles directly into development agents** to multiply developer effectiveness while ensuring philosophical alignment.

### Why This Fits the Book

1. **Natural progression** — Chapters 1-17 cover the EVM from basics to advanced; Chapter 18 covers *how to build on all of it efficiently*
2. **Dual-chain relevance** — Shows how ETC's constraints inspire innovation applicable to any chain
3. **Practical focus** — The book emphasizes hands-on development; agentic coding is the next evolution
4. **2025 state-of-the-art** — LLM-assisted development is now mainstream; the book should reflect this

## Content Structure

### Chapter 18: Agentic Development

**Theme**: How resource-constrained networks can use AI agents to punch above their weight while maintaining decentralization principles.

#### 18.1 Introduction: The Agentic Advantage

- The challenge: building critical infrastructure with limited resources
- ETC's reality: no foundation grants, no premine treasury, volunteer contributors
- The solution: code network principles into AI development agents
- Why this matters for all EVM developers, not just ETC

#### 18.2 Principles-First Development

- **Encoding immutability** — Teaching agents "Code is Law" thinking
- **Decentralization by default** — Avoiding patterns that centralize control
- **Backward compatibility** — ETC's ECIP process and conservative upgrade philosophy
- **Proof of Work considerations** — Designing for PoW economics

Example: A Claude Code CLAUDE.md that encodes ETC principles:

```markdown
# ETC Development Principles

You are developing software for Ethereum Classic, a proof-of-work blockchain
that follows these core principles:

1. **Immutability**: Once deployed, contracts should not be "fixed" through
   irregular state changes. Design for correctness upfront.

2. **Decentralization**: Avoid patterns that require trusted operators,
   admin keys, or centralized infrastructure.

3. **Conservative upgrades**: Prefer backward-compatible changes. Breaking
   changes require extensive review and community consensus.

4. **PoW economics**: Consider that miners secure the network. Don't design
   systems that undermine mining profitability.
```

#### 18.3 Agentic Smart Contract Development

- Using AI agents to generate, review, and audit Solidity code
- Integrating with Foundry and Hardhat workflows
- Automated test generation with property-based testing
- Security-first prompting patterns

Practical example: Generating an ERC-20 token with security checks built-in

```typescript
// Example: Using Claude to generate a secure token
const prompt = `
Generate an ERC-20 token for Ethereum Classic with:
- Fixed supply (no mint function post-deployment)
- No admin keys or owner privileges
- Reentrancy protection on any external calls
- Events for all state changes
- Full NatSpec documentation

Follow the immutability principle: once deployed, this contract
must function correctly forever without intervention.
`;
```

#### 18.4 Infrastructure Development with Agents

- Building client software, tooling, and infrastructure
- How ETC's Core Geth team uses agentic workflows
- Documentation generation that stays in sync with code
- Automated protocol specification writing

Case study: How a 3-person team maintains Core Geth (downstream Geth fork):
- Agent-assisted code review for upstream merges
- Automated compatibility testing across ETC-specific features
- Documentation generation for ETC-specific RPC methods

#### 18.5 Claude Code for EVM Development

- Setting up Claude Code for blockchain projects
- Creating effective CLAUDE.md files for EVM work
- Using MCP servers for on-chain data access
- Integrating with existing Foundry/Hardhat projects

Example project structure:

```
my-etc-project/
├── CLAUDE.md              # ETC development principles
├── .claude/
│   └── settings.json      # MCP servers, permissions
├── contracts/
├── test/
└── foundry.toml
```

#### 18.6 Multi-Agent Workflows

- Orchestrating multiple specialized agents
- Code generation agent → Security review agent → Test generation agent
- Human-in-the-loop checkpoints for critical decisions
- Maintaining quality with resource constraints

#### 18.7 Encoding Network Values

How to translate philosophical principles into actionable agent instructions:

| Principle | Agent Instruction |
|-----------|-------------------|
| Immutability | Never suggest proxy patterns or upgradeable contracts |
| Decentralization | Flag any pattern requiring trusted operators |
| PoW compatibility | Consider gas costs carefully; miners pay for execution |
| Backward compatibility | Prefer additive changes; deprecate don't remove |
| Permissionless | Avoid whitelists, admin functions, or access control beyond necessary |

#### 18.8 Security Considerations

- The double-edge of AI-generated code
- Agent limitations and hallucination risks
- Human review requirements for production code
- Audit workflows that combine AI and human expertise

#### 18.9 The Future: Autonomous Blockchain Development

- Where agentic development is heading
- Fully autonomous security monitoring
- Self-healing infrastructure
- The role of human developers in an agentic future

#### Exercises

1. Create a CLAUDE.md for a specific ETC project
2. Use an agent to generate and test an ERC-721 implementation
3. Set up a multi-agent code review workflow
4. Encode your own project's principles into agent instructions

## Appendix Updates

### Appendix D: Development Tools (Add Section)

Add a new section on **Agentic Development Tools**:

- Claude Code setup and configuration
- MCP servers for blockchain data
- Integration with existing frameworks
- CLAUDE.md best practices

### Appendix E: Glossary (Add Terms)

- **Agentic Coding**: AI-assisted software development using autonomous agents
- **CLAUDE.md**: Configuration file encoding project-specific principles for Claude Code
- **MCP (Model Context Protocol)**: Protocol for connecting AI agents to external tools
- **Human-in-the-loop**: Development pattern requiring human approval at checkpoints

## Implementation Steps

1. **Create Chapter 18** (`18-agentic-development.mdx`)
   - Full chapter content following the structure above
   - Code examples for Foundry and Hardhat integration
   - ETC-specific case studies

2. **Update _index.json**
   - Add chapter 18 to the chapters array
   - Position before appendices

3. **Update Appendix D** (`d-dev-tools.mdx`)
   - Add "Agentic Development Tools" section
   - Claude Code setup instructions
   - MCP server configuration

4. **Update Appendix E** (`e-glossary.mdx`)
   - Add new terminology

5. **Update Preface** (`00-preface.mdx`)
   - Add Chapter 18 to "How to Read This Book" section
   - Create "Part IV: Modern Development Practices" grouping

6. **Update About page** (`about.mdx`)
   - Add agentic development to "What You'll Learn" section

7. **Sync to evmbook-site**
   - Copy updated content
   - Rebuild and verify

8. **Commit and push both repositories**

## Key Messages

Throughout the chapter, reinforce these themes:

1. **Resource constraints breed innovation** — ETC's lack of foundation funding drives creative solutions
2. **Principles can be encoded** — Network values become development guardrails
3. **Small teams, big impact** — 3 developers + agents can maintain critical infrastructure
4. **Decentralization of development** — Anyone with Claude Code can contribute meaningfully
5. **Quality through automation** — Agents handle repetitive tasks; humans focus on architecture and principles

## Tone and Style

Match the existing book's voice:
- Technical but accessible
- Practical, hands-on examples
- Dual-chain perspective (show how this applies to ETH too)
- "ETC vs ETH" callouts where approaches differ
- Code examples in Solidity, TypeScript, and configuration formats

## Word Count Estimate

- Chapter 18: ~8,000-10,000 words (comparable to other deep-dive chapters)
- Appendix D additions: ~1,500 words
- Other updates: ~500 words combined

## Success Criteria

The chapter should leave readers able to:
1. Set up Claude Code for EVM development
2. Write effective principle-encoding CLAUDE.md files
3. Integrate agents into Foundry/Hardhat workflows
4. Understand how ETC uses agentic development strategically
5. Apply these patterns to their own resource-constrained projects
