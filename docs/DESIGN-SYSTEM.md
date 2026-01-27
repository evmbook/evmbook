# Mastering EVM - Design System

## Diagram Specifications

### Dimensions
- Standard: 800×500px (16:10 ratio)
- Wide: 1000×400px
- Tall: 600×800px

### Color Palette

**Primary Colors:**
| Color | Hex | Usage |
|-------|-----|-------|
| Ethereum Blue | #627EEA | Primary, headers, arrows |
| ETC Green | #3AB83A | Secondary, success states |
| Purple | #8B5CF6 | Accents, highlights |
| Orange | #F59E0B | Warnings, alerts |
| Red | #EF4444 | Errors, critical |

**Backgrounds:**
- Light: `linear-gradient(135deg, #FAFBFC 0%, #F0F4F8 100%)`
- Dark: `linear-gradient(135deg, #1a1a3a 0%, #0f0f2f 100%)`

**Neutrals:** #1a1a3a, #374151, #6B7280, #9CA3AF, #E5E7EB

### Typography

| Element | Size | Weight | Color |
|---------|------|--------|-------|
| Main title | 20px | Bold | #1a1a3a |
| Section headers | 14px | Semibold | #374151 |
| Component labels | 11px | Medium | #4B5563 |
| Annotations | 9px | Regular | #6B7280 |
| Code/technical | 10px | Monospace | #1F2937 |

### Visual Elements

**Drop Shadow:**
```xml
<filter id="dropShadow">
  <feDropShadow dx="0" dy="4" stdDeviation="8" flood-opacity="0.1"/>
</filter>
```

**Containers:** Rounded corners (rx=12), subtle drop shadows

**Flow Indicators:** Numbered circles (①②③)

---

## Chapter Conventions

### Era Numbering
All evolution chapters start at **Era 0** (early experimental phase):
- Era 0: Early experiments, primitives
- Era 1+: Progressive maturity

### Code Examples
- Located in `/code/` directory
- Foundry-based (foundry.toml config)
- Chapters 8-12 have linked callout boxes

### File References
Use markdown links: `[filename.ts](src/filename.ts)`
For specific lines: `[filename.ts:42](src/filename.ts#L42)`

---

## Publishing Specs

| Spec | Value |
|------|-------|
| Trim Size | 7.5 × 9.25 inches |
| Page Count | ~600 |
| Paper | 60# white offset |
| Binding | Perfect bound |
| Cover | Matte laminated |
