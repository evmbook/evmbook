# Sources Directory

This directory contains the bibliographic infrastructure for the "Mastering EVM" historical research.

## Files

| File | Purpose |
|------|---------|
| `library.bib` | BibTeX database of all cited sources |
| `source_index.md` | Human-readable index with credibility notes |

## BibTeX Format

All sources use standard BibTeX format. The library is organized by entry type:

### Entry Types

```bibtex
@article      % Peer-reviewed journal articles
@inproceedings % Conference papers
@techreport   % Technical reports, whitepapers
@misc         % Blog posts, forum posts, tweets
@book         % Books
@online       % Websites, documentation
@patent       % Patents
```

### Key Naming Convention

Keys follow the pattern: `{type}_{author}_{topic}_{year}`

```bibtex
@article{article_diffie_hellman_1976,
  author = {Diffie, Whitfield and Hellman, Martin E.},
  title = {New Directions in Cryptography},
  journal = {IEEE Transactions on Information Theory},
  year = {1976},
  volume = {22},
  number = {6},
  pages = {644--654}
}

@techreport{whitepaper_nakamoto_bitcoin_2008,
  author = {Nakamoto, Satoshi},
  title = {Bitcoin: A Peer-to-Peer Electronic Cash System},
  year = {2008},
  url = {https://bitcoin.org/bitcoin.pdf}
}
```

## Adding New Sources

### Step 1: Verify Source Quality

Before adding, check:
- Is this a primary or secondary source?
- Can the publication date be verified?
- Is the author credible for this topic?

See `docs/RESEARCH_SYSTEM.md` for source classification rules.

### Step 2: Add BibTeX Entry

Add to `library.bib` in alphabetical order by key.

Required fields vary by type:
- `@article`: author, title, journal, year
- `@techreport`: author, title, year, institution or url
- `@misc`: author, title, year, howpublished or url
- `@online`: author, title, year, url, urldate

### Step 3: Add to Source Index

Add a human-readable entry to `source_index.md` with:
- Citation key
- Full bibliographic info
- Credibility assessment
- Where it's used in the research

### Step 4: Use in Documents

Reference in markdown using: `[@key]`

Example: `[@article_diffie_hellman_1976]`

## Source Quality Tiers

### Tier 1: Primary Sources (Preferred)

- Original academic papers
- Protocol whitepapers and specifications
- EIPs/ECIPs
- Original author blog posts with verifiable dates
- Source code (git commits)
- Patents

### Tier 2: Secondary Sources (Acceptable)

- Academic surveys and reviews
- Reputable journalism (CoinDesk, The Block)
- Conference talks by non-authors
- Technical documentation

### Tier 3: Tertiary Sources (Use Sparingly)

- Wikipedia (check underlying sources)
- General reference works
- Textbooks

## Verification

Periodically verify:

1. **BibTeX syntax**: `bibtex library.bib`
2. **URL validity**: Check that URLs are still accessible
3. **Citation usage**: Ensure all keys in library.bib are actually used

## Archive Policy

For web sources that may disappear:
- Save to Internet Archive (Wayback Machine)
- Note archived URL in BibTeX `note` field
- Example: `note = {Archived: https://web.archive.org/web/...}`
