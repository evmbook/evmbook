# Pre-Phase 14 Review Notes

**Date:** 2026-01-28

This document captures the pre-Phase 14 (PDF/EPUB Build) review findings.

---

## Summary

| Item | Status | Notes |
|------|--------|-------|
| CLAIMS_LEDGER.md | ✅ Current | 150 claims, comprehensive coverage |
| ERA_MAP.md | ✅ Current | 13 eras, 5 parallel tracks, citations |
| Appendices (8 files) | ✅ Current | All reviewed, up to date through 2025 |
| Meta files | ✅ Current | about.mdx, colophon.mdx properly formatted |
| README.md | ✅ Current | 149 lines, comprehensive |
| MARKETING.md | ✅ Current | 228 lines, good marketing copy |
| icons/ directory | ⚠️ Does not exist | May not be needed |
| screenshots/ directory | ⚠️ Does not exist | May not be needed |
| Diagrams (15 SVGs) | ⚠️ Needs manual review | Visibility/overlap issues reported |

---

## Diagrams Requiring Manual Review

The following 15 SVG diagrams have been reported to have visibility issues (overlaps that hide information). These require manual inspection and correction:

| Diagram | Chapter | Issue Type |
|---------|---------|------------|
| ch01-evm-landscape.svg | 01 | Check label overlaps |
| ch04-cryptography-flow.svg | 04 | Check label overlaps |
| ch05-account-model.svg | 05 | Check label overlaps |
| ch06-transaction-flow.svg | 06 | Check label overlaps |
| ch07-pow-vs-pos.svg | 07 | Check label overlaps |
| ch09-proxy-patterns.svg | 09 | Check label overlaps |
| ch13-evm-architecture.svg | 13 | Check label overlaps |
| ch14-gas-cost-hierarchy.svg | 14 | Check label overlaps |
| ch16-amm-evolution.svg | 16 | Check label overlaps |
| ch17-lending-protocol.svg | 17 | Check label overlaps |
| ch18-dao-governance.svg | 18 | Check label overlaps |
| ch22-oracle-architecture.svg | 22 | Check label overlaps |
| ch23-l2-architecture.svg | 23 | Check label overlaps |
| ch24-zk-proof-flow.svg | 24 | Check label overlaps |
| ch26-dependency-tree.svg | 26 | Check label overlaps |

**Recommended Actions:**
1. Open each SVG in a browser or vector editor
2. Check for text/element overlaps that hide information
3. Adjust positioning, font sizes, or use leader lines where needed
4. Consider print-specific concerns (PDF rendering)

---

## Missing Directories

### icons/
- Does not exist at `/home/dev/dev/etc-suite/products/evmbook-v1/icons/`
- **Action:** Determine if icons are needed for the book. If so, create directory and add required icons.

### screenshots/
- Does not exist at `/home/dev/dev/etc-suite/products/evmbook-v1/screenshots/`
- **Action:** Determine if screenshots are needed. The book references tools like Foundry, MetaMask, etc. Screenshots may enhance Chapter 3 (Environment Setup) and appendices.

---

## Files Reviewed and Found Current

### Research Infrastructure
- **history/CLAIMS_LEDGER.md** — 150 verified claims with confidence levels
- **history/ERA_MAP.md** — 13 eras (Pre-1900 through 2025+) with 5 parallel tracks

### Appendices (8 total, 2,256 lines)
| File | Lines | Content |
|------|-------|---------|
| a-fork-history.mdx | 280 | ETH/ETC fork history |
| b-eip-standards.mdx | 483 | EIP reference |
| c-opcodes.mdx | 756 | EVM opcode reference |
| d-dev-tools.mdx | 1,299 | Development tools |
| e-glossary.mdx | 927 | Terminology |
| f-regulatory-timeline.mdx | 717 | Regulatory events (through 2025) |
| g-key-figures.mdx | 900 | Historical figures |
| h-essential-reading.mdx | 900 | Reading list |

### Meta Files
- **content/meta/about.mdx** — 69 lines, project overview
- **content/meta/colophon.mdx** — 105 lines, attribution and licensing

### Project Documentation
- **README.md** — 149 lines, current project overview
- **MARKETING.md** — 228 lines, marketing copy and features

---

## Phase 14 Ready Checklist

- [x] All chapters reviewed and expanded
- [x] Research infrastructure complete (27 primitives, 13 era chapters)
- [x] Appendices current
- [x] Meta files current
- [x] README.md current
- [x] MARKETING.md current
- [ ] Diagrams manually reviewed for visibility issues
- [ ] Determine if icons/screenshots directories needed
- [ ] Cover font preference (author noted font concern)

---

## Next Steps

1. **Manual diagram review** — Open each SVG and fix visibility/overlap issues
2. **Cover design** — Review author name font choice
3. **Directory decision** — Create icons/ and screenshots/ if needed
4. **Proceed to Phase 14** — PDF/EPUB build once above items resolved
