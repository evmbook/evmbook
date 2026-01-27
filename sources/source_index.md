# Source Index

Human-readable index of sources in `library.bib` with credibility assessments and usage notes.

## Legend

**Credibility Tiers:**
- **T1**: Primary source (original paper, whitepaper, specification)
- **T2**: Secondary source (academic survey, reputable journalism)
- **T3**: Tertiary source (reference work, textbook)

**Verification Status:**
- **Verified**: Date and attribution confirmed via multiple sources
- **Unverified**: Single source only; needs corroboration
- **Contested**: Multiple credible competing claims

---

## Era 0: Pre-1900 — Ancient Cryptography

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `book_kahn_codebreakers_1967` | Kahn, D. (1967). *The Codebreakers* | T2 | Verified | Definitive history of cryptography; secondary but authoritative |
| `article_kerckhoffs_cryptographie_1883` | Kerckhoffs, A. (1883). La cryptographie militaire | T1 | Verified | Primary source; Kerckhoffs's principle origin |

---

## Era 1: 1900-1945 — Early Computing & Enigma

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_turing_computable_1936` | Turing, A.M. (1936). On Computable Numbers | T1 | Verified | Foundation of computer science; Turing machines |

---

## Era 2: 1945-1975 — Information Theory

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_shannon_communication_1948` | Shannon, C.E. (1948). A Mathematical Theory of Communication | T1 | Verified | Foundation of information theory |
| `article_shannon_secrecy_1949` | Shannon, C.E. (1949). Communication Theory of Secrecy Systems | T1 | Verified | Mathematical cryptography foundation; proves one-time pad security |

---

## Era 3: 1976-1990 — Public Key Revolution

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_diffie_hellman_1976` | Diffie, W. & Hellman, M.E. (1976). New Directions in Cryptography | T1 | Verified | Introduced public-key crypto to academia; IEEE Trans. Info. Theory |
| `article_rivest_rsa_1978` | Rivest, R.L., Shamir, A., & Adleman, L. (1978). RSA | T1 | Verified | First practical public-key cryptosystem |
| `thesis_merkle_secrecy_1979` | Merkle, R.C. (1979). Secrecy, Authentication, and Public Key Systems | T1 | Verified | Stanford PhD thesis; Merkle trees, independent PKC discovery |
| `article_lamport_byzantine_1982` | Lamport, L., Shostak, R., & Pease, M. (1982). Byzantine Generals Problem | T1 | Verified | **Critical source**; foundation for all blockchain consensus |
| `inproceedings_chaum_blind_1982` | Chaum, D. (1982). Blind Signatures for Untraceable Payments | T1 | Verified | Crypto '82; foundation for digital cash |
| `thesis_chaum_security_1982` | Chaum, D. (1982). PhD Dissertation, UC Berkeley | T1 | Verified | Extended digital cash concepts |
| `article_koblitz_elliptic_1987` | Koblitz, N. (1987). Elliptic Curve Cryptosystems | T1 | Verified | Math. Comp.; ECC foundation |
| `article_miller_elliptic_1985` | Miller, V.S. (1985). Use of Elliptic Curves in Cryptography | T1 | Verified | CRYPTO '85; independent ECC discovery |

---

## Era 4: 1990-2008 — Cypherpunks, P2P & Digital Cash

### P2P & Distributed Systems Track

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `misc_napster_1999` | Fanning, S. (1999). Napster | T2 | Verified | First major P2P file sharing; centralized index model |
| `inproceedings_gnutella_2000` | Ripeanu, M. (2001). Gnutella Network | T1 | Verified | Fully decentralized P2P; influenced DHT research |
| `misc_wilcox_mojonation_2000` | Wilcox-O'Hearn, Z. (2000). Mojo Nation | T2 | Unverified | **Key precursor**: Token incentives for file sharing; needs primary source |
| `inproceedings_stoica_chord_2001` | Stoica, I. et al. (2001). Chord | T1 | Verified | ACM SIGCOMM; foundational DHT paper |
| `inproceedings_maymounkov_kademlia_2002` | Maymounkov, P. & Mazières, D. (2002). Kademlia | T1 | Verified | DHT used by BitTorrent, IPFS, Ethereum |
| `misc_cohen_bittorrent_2001` | Cohen, B. (2001). BitTorrent | T2 | Verified | Incentive-compatible P2P; tit-for-tat |
| `inproceedings_cohen_bittorrent_incentives_2003` | Cohen, B. (2003). Incentives Build Robustness in BitTorrent | T1 | Verified | Economic incentive design paper |

### Cryptographic Digital Cash Track

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `inproceedings_dwork_pricing_1992` | Dwork, C. & Naor, M. (1992). Pricing via Processing | T1 | Verified | CRYPTO '92; **first PoW formalization** |
| `misc_hughes_manifesto_1993` | Hughes, E. (1993). A Cypherpunk's Manifesto | T1 | Verified | Philosophical foundation; widely archived |
| `misc_szabo_smart_contracts_1994` | Szabo, N. (1994). Smart Contracts | T1 | Unverified | Original concept; date disputed (1994 vs 1996) |
| `misc_szabo_smart_contracts_building_1996` | Szabo, N. (1996). Smart Contracts: Building Blocks | T1 | Verified | Extropy Magazine publication |
| `techreport_back_hashcash_1997` | Back, A. (1997). Hashcash (announcement) | T1 | Verified | Cypherpunks mailing list; PoW for anti-spam |
| `techreport_back_hashcash_2002` | Back, A. (2002). Hashcash paper | T1 | Verified | Formal paper; cited in Bitcoin whitepaper |
| `misc_dai_bmoney_1998` | Dai, W. (1998). b-money | T1 | Verified | Cited in Bitcoin whitepaper; b-money.txt archived |
| `misc_szabo_bitgold_1998` | Szabo, N. (1998/2005). Bit Gold | T1 | Contested | Initially described 1998, published 2005; date unclear |
| `inproceedings_castro_pbft_1999` | Castro, M. & Liskov, B. (1999). Practical Byzantine Fault Tolerance | T1 | Verified | OSDI '99; first practical BFT |
| `article_hanson_lmsr_2003` | Hanson, R. (2003). Combinatorial Information Market Design | T1 | Verified | **AMM precursor**; LMSR for prediction markets |
| `misc_finney_rpow_2004` | Finney, H. (2004). RPOW | T1 | Verified | Reusable PoW; stepping stone to Bitcoin |

---

## Era 5: 2008-2013 — Bitcoin Birth

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `whitepaper_nakamoto_bitcoin_2008` | Nakamoto, S. (2008). Bitcoin: A Peer-to-Peer Electronic Cash System | T1 | Verified | **The** founding document; 9 pages |

---

## Era 6: 2013-2017 — Ethereum & Programmable Money

### Decentralized Storage Track

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `whitepaper_benet_ipfs_2014` | Benet, J. (2014). IPFS | T1 | Verified | Content-addressed storage; uses Kademlia |
| `whitepaper_filecoin_2017` | Benet, J. & Greco, N. (2017). Filecoin | T1 | Verified | Incentivized storage; proof of replication |

### Ethereum Core

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `whitepaper_buterin_ethereum_2013` | Buterin, V. (2013). Ethereum Whitepaper | T1 | Verified | General-purpose blockchain vision |
| `yellowpaper_wood_ethereum_2014` | Wood, G. (2014). Ethereum Yellow Paper | T1 | Verified | Formal EVM specification; definitive |
| `eip_vogelsteller_erc20_2015` | Vogelsteller, F. & Buterin, V. (2015). EIP-20 | T1 | Verified | ERC-20 token standard |
| `misc_buchman_tendermint_2016` | Buchman, E. (2016). Tendermint | T1 | Verified | Master's thesis; BFT consensus |
| `whitepaper_poon_lightning_2016` | Poon, J. & Dryja, T. (2016). Lightning Network | T1 | Verified | First major L2 proposal |

---

## Era 7: 2017-2019 — ICO Boom & DeFi Foundations

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `whitepaper_bancor_2017` | Hertzog, E. et al. (2017). Bancor Protocol | T1 | Verified | **Predates Uniswap**; bonding curves |
| `whitepaper_poon_plasma_2017` | Poon, J. & Buterin, V. (2017). Plasma | T1 | Verified | Early Ethereum scaling |
| `article_buterin_casper_2017` | Buterin, V. & Griffith, V. (2017). Casper FFG | T1 | Verified | arXiv; Ethereum PoS finality |
| `whitepaper_chainlink_2017` | Ellis, S., Juels, A., & Nazarov, S. (2017). ChainLink | T1 | Verified | Decentralized oracle design |
| `eip_entriken_erc721_2018` | Entriken, W. et al. (2018). EIP-721 | T1 | Verified | NFT standard |
| `blog_adams_uniswap_2018` | Adams, H. (2018). Uniswap: A Unique Exchange | T1 | Verified | Uniswap V1 launch; constant product (x*y=k) |

---

## Era 8: 2020 — DeFi Summer

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `whitepaper_uniswap_v2_2020` | Adams, H. et al. (2020). Uniswap v2 Core | T1 | Verified | Flash swaps, price oracles |
| `whitepaper_curve_stableswap_2020` | Egorov, M. (2020). StableSwap | T1 | Verified | Curve's optimized invariant |
| `article_roughgarden_eip1559_2020` | Roughgarden, T. (2020). EIP-1559 Economic Analysis | T1 | Verified | arXiv; mechanism design analysis |

---

## Era 9: 2021 — L2s, NFTs, Institutional

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `whitepaper_uniswap_v3_2021` | Adams, H. et al. (2021). Uniswap v3 Core | T1 | Verified | Concentrated liquidity innovation |
| `eip_buterin_1559_2019` | Buterin, V. et al. (2019). EIP-1559 | T1 | Verified | Fee market change; implemented Aug 2021 |

---

## Era 10: 2022 — Collapses & The Merge

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_daian_flashboys_2019` | Daian, P. et al. (2019). Flash Boys 2.0 | T1 | Verified | IEEE S&P; coined "MEV" |

---

## Era 11-12: 2023-2025 — Recovery & Current

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `eip_proto_danksharding_2022` | Buterin, V. et al. (2022). EIP-4844 | T1 | Verified | Proto-danksharding; blob transactions |
| `eip_7702_2024` | Buterin, V. et al. (2024). EIP-7702 | T1 | Verified | Native account abstraction |

---

## Cross-Era Sources — Economics & Market Microstructure

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_garman_market_1976` | Garman, M.B. (1976). Market Microstructure | T1 | Verified | J. Financial Economics; inventory models |
| `article_amihud_dealership_1980` | Amihud, Y. & Mendelson, H. (1980). Dealership Market | T1 | Verified | Bid-ask spread theory |

---

## Books & Secondary Sources

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `book_antonopoulos_mastering_bitcoin_2017` | Antonopoulos, A.M. (2017). Mastering Bitcoin, 2nd ed. | T2 | Verified | Definitive Bitcoin technical reference |
| `book_russo_infinite_machine_2020` | Russo, C. (2020). The Infinite Machine | T2 | Verified | Ethereum origin story; journalistic |
| `book_leising_out_of_ether_2020` | Leising, M. (2020). Out of the Ether | T2 | Verified | DAO hack history |
| `book_bier_blocksize_war_2021` | Bier, J. (2021). The Blocksize War | T2 | Verified | Bitcoin governance lessons |

---

## Protocol Documentation

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `online_compound_whitepaper_2019` | Leshner, R. & Hayes, G. (2019). Compound Whitepaper | T1 | Verified | cTokens, interest rate models |
| `online_aave_v3_2022` | Aave (2022). Aave V3 Technical Paper | T1 | Verified | Efficiency mode, isolation mode |
| `online_makerdao_whitepaper_2017` | MakerDAO (2017). Maker Protocol | T1 | Verified | CDPs, DAI mechanics |

---

## Zero Knowledge

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_bensasson_starks_2018` | Ben-Sasson, E. et al. (2018). STARKs | T1 | Verified | No trusted setup, post-quantum |
| `article_gabizon_plonk_2019` | Gabizon, A. et al. (2019). PLONK | T1 | Verified | Modern ZK proving system |

---

## Security Resources

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `online_swc_registry` | SWC Registry | T2 | Verified | Maintained vulnerability database |
| `online_consensys_best_practices` | ConsenSys Diligence. Best Practices | T2 | Verified | Foundational security patterns |

---

## Sources Needing Follow-Up

The following sources need additional verification or primary documentation:

1. **`misc_wilcox_mojonation_2000`** — Mojo Nation token economics; need primary source documentation
2. **`misc_szabo_smart_contracts_1994`** — Original date disputed; 1994 vs 1996
3. **`misc_szabo_bitgold_1998`** — Bit Gold; described 1998 but published 2005

---

## Adding New Sources

1. Check if source already exists in this index
2. Determine credibility tier (T1/T2/T3)
3. Verify date and attribution against multiple sources
4. Add BibTeX entry to `library.bib`
5. Add row to appropriate era table above
6. If verification status is not "Verified", add to "Sources Needing Follow-Up"
