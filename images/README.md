# Images

This directory contains visual assets for **Mastering EVM (2025 Edition)**.

## Structure

```
images/
├── diagrams/           # Technical diagrams and flowcharts
│   ├── ch01-*.svg      # Chapter 1 diagrams
│   ├── ch06-*.svg      # Chapter 6 diagrams
│   └── ...
├── screenshots/        # Tool and interface screenshots
│   ├── ch03-*.png      # Environment setup screenshots
│   └── ...
├── covers/             # Book cover artwork
│   ├── cover-front.png
│   ├── cover-back.png
│   └── cover-spine.png
└── icons/              # Logos and icons
    ├── ethereum-logo.svg
    └── etc-logo.svg
```

## Diagram Guidelines

### Format
- **Vector diagrams**: SVG preferred (scales for print and web)
- **Screenshots**: PNG at 2x resolution minimum
- **Cover art**: High-resolution PNG (300 DPI for print)

### Naming Convention
- Prefix with chapter number: `ch01-evm-landscape.svg`
- Use kebab-case: `ch16-amm-evolution.svg`
- Be descriptive: `ch26-dependency-tree.svg`

### Key Diagrams Needed

| Chapter | Diagram | Description |
|---------|---------|-------------|
| 1 | evm-landscape | Multi-chain EVM ecosystem map |
| 6 | transaction-flow | Transaction lifecycle |
| 7 | pow-vs-pos | Consensus comparison |
| 13 | evm-architecture | Stack, memory, storage layout |
| 16 | amm-evolution | AMM development timeline |
| 23 | l2-architecture | Rollup structure |
| 26 | dependency-tree | DeFi primitive dependencies |

### Style Guidelines

**Colors** (consistent palette):
- Primary: `#627EEA` (Ethereum blue)
- Secondary: `#3AB83A` (ETC green)
- Accent: `#F7931A` (Bitcoin orange for historical refs)
- Background: `#FFFFFF` (white)
- Text: `#1A1A1A` (near-black)

**Typography**:
- Sans-serif fonts for diagrams
- Minimum 12pt for print readability

## Cover Specifications

### Front Cover
- **Size**: 7.5" × 9.25" (trim size) + 0.125" bleed
- **Resolution**: 300 DPI minimum
- **Format**: PNG or PDF
- **Content**: Title, subtitle, author name

### Back Cover
- **Size**: Same as front
- **Content**: Description, barcode area (bottom right), author bio

### Spine
- **Width**: ~1.2" (based on ~600 pages)
- **Content**: Title, author name, publisher logo

## Creating Diagrams

Recommended tools:
- **Figma** - Collaborative, web-based
- **Excalidraw** - Hand-drawn style, exports SVG
- **draw.io** - Free, technical diagrams
- **Mermaid** - Code-based diagrams

## License

Images created for this book are licensed under CC BY-NC 4.0.

Third-party logos (Ethereum, ETC, etc.) are used under fair use for educational purposes and remain property of their respective owners.
