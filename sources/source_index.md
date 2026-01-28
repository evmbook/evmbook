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
| `misc_mojonation_technical_2000` | Autonomous Zone Industries (2000). Mojo Nation Technical Overview | T1 | Verified | **Token economics verified**: Feb 14, 2000; Mojo micropayments, IOU credit; Jim McCoy (CEO), Zooko, Bram Cohen |
| `inproceedings_stoica_chord_2001` | Stoica, I. et al. (2001). Chord | T1 | Verified | ACM SIGCOMM; foundational DHT paper |
| `inproceedings_maymounkov_kademlia_2002` | Maymounkov, P. & Mazières, D. (2002). Kademlia | T1 | Verified | DHT used by BitTorrent, IPFS, Ethereum |
| `misc_cohen_bittorrent_2001` | Cohen, B. (2001). BitTorrent | T2 | Verified | Incentive-compatible P2P; tit-for-tat |
| `inproceedings_cohen_bittorrent_incentives_2003` | Cohen, B. (2003). Incentives Build Robustness in BitTorrent | T1 | Verified | Economic incentive design paper |

### Cryptographic Digital Cash Track

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `inproceedings_dwork_pricing_1992` | Dwork, C. & Naor, M. (1992). Pricing via Processing | T1 | Verified | CRYPTO '92; **first PoW formalization** |
| `misc_hughes_manifesto_1993` | Hughes, E. (1993). A Cypherpunk's Manifesto | T1 | Verified | Philosophical foundation; widely archived |
| `misc_szabo_smart_contracts_1994` | Szabo, N. (1994). Smart Contracts | T1 | Verified | **Date verified**: Copyright 1994; original definition. 1996 Extropy #16 is expanded version |
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
| `article_amihud_dealership_1980` | Amihud & Mendelson (1980). Dealership Market | T1 | Verified | Bid-ask spread theory |
| `article_kyle_continuous_1985` | Kyle, A.S. (1985). Continuous Auctions | T1 | Verified | Informed trading; price impact; market depth |
| `article_glosten_milgrom_1985` | Glosten & Milgrom (1985). Bid, Ask, Transaction | T1 | Verified | Adverse selection in market making |
| `article_glosten_limit_1994` | Glosten, L.R. (1994). Limit Order Book | T1 | Verified | LOB economics; exchange competition |
| `article_foucault_limit_1999` | Foucault, T. (1999). Order Flow Composition | T1 | Verified | Limit order dynamics; liquidity provision |
| `article_hasbrouck_market_microstructure_2006` | Hasbrouck, J. (2006). Empirical Market Microstructure | T1 | Verified | Classic microstructure textbook |
| `article_budish_hft_2015` | Budish et al. (2015). HFT Arms Race | T1 | Verified | Batch auctions; influences CoW Protocol |

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

## Restaking & Shared Security

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `misc_eigenlayer_2023` | Kannan, S. et al. (2023). EigenLayer | T1 | Verified | Restaking protocol whitepaper |
| `misc_buterin_overload_2023` | Buterin, V. (2023). Don't Overload Consensus | T1 | Verified | Concerns about restaking |
| `misc_symbiotic_2024` | Symbiotic (2024). Permissionless Restaking | T2 | Verified | Alternative restaking protocol |
| `misc_babylon_btc_2024` | Babylon (2024). Bitcoin Staking Protocol | T2 | Verified | BTC restaking |

---

## Cross-Chain Interoperability

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `misc_blockstream_sidechains_2014` | Back, A. et al. (2014). Pegged Sidechains | T1 | Verified | Two-way peg concept |
| `misc_cosmos_ibc_2019` | Cosmos/Tendermint (2019). IBC | T1 | Verified | General message passing |
| `misc_layerzero_2021` | Pellegrino, R. et al. (2021). LayerZero | T1 | Verified | Ultra Light Node design |
| `misc_wormhole_hack_2022` | Various (2022). Wormhole Exploit | T2 | Verified | $320M bridge exploit |
| `misc_nomad_hack_2022` | Various (2022). Nomad Exploit | T2 | Verified | $190M bridge exploit |
| `misc_axelar_2022` | Axelar (2022). Connecting Web3 | T2 | Verified | PoS message passing |
| `misc_hyperlane_2023` | Hyperlane (2023). Interoperability Layer | T2 | Verified | Modular ISM design |

---

## AMM & Market Design — Academic Research

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_angeris_cfmm_2020` | Angeris, G., Kao, H., Chiang, R., Noyes, C., Chitra, T. (2020). CFMM Analysis | T1 | Verified | Formal analysis of Uniswap markets |
| `article_angeris_replicating_2020` | Angeris, G., Evans, A., Chitra, T. (2020). Replicating Market Makers | T1 | Verified | LP positions as options |
| `article_angeris_optimal_routing_2021` | Angeris, G., Chitra, T. (2021). Optimal Routing | T1 | Verified | Multi-pool routing theory |
| `article_hasbrouck_market_microstructure_2006` | Hasbrouck, J. (2006). Empirical Market Microstructure | T1 | Verified | Classic market microstructure text |
| `article_kyle_informed_trading_1985` | Kyle, A.S. (1985). Continuous Auctions and Insider Trading | T1 | Verified | Foundational microstructure paper |
| `article_glosten_bid_ask_1985` | Glosten, L.R. & Milgrom, P.R. (1985). Bid Ask Information | T1 | Verified | Adverse selection in markets |
| `misc_koppelmann_invariant_2015` | Köppelmann, M. (2015). On-chain decentralized exchange | T1 | Verified | First x*y=k formulation (Sep 2015) |
| `misc_johnson_euler_2016` | Johnson, E. (2016). Euler DEX | T2 | Verified | September 2016 DEX design |
| `misc_buterin_reddit_amm_2016` | Buterin, V. (2016). Reddit AMM Post | T1 | Verified | October 3, 2016; DEXs like prediction markets |
| `misc_lu_invariants_2017` | Lu, A. (2017). Building Intuition for x*y=k | T2 | Verified | March 2017; invariant explanation |

---

## DeFi Lending Protocols

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `online_compound_whitepaper_2019` | Leshner, R. & Hayes, G. (2019). Compound Whitepaper | T1 | Verified | Pooled lending; cTokens; algorithmic rates |
| `misc_ethlend_2017` | Kulechov, S. (2017). ETHLend | T1 | Verified | P2P lending; Aave predecessor |
| `misc_aave_v1_2020` | Aave (2020). Aave V1 Whitepaper | T1 | Verified | Pooled model; flash loans; aTokens |
| `online_aave_v3_2022` | Aave (2022). Aave V3 Technical Paper | T1 | Verified | E-mode, isolation, portals |
| `misc_aave_flashloans_2020` | Aave (2020). Flash Loans Documentation | T1 | Verified | Uncollateralized single-tx loans |
| `misc_comp_launch_2020` | Compound (2020). COMP Launch | T2 | Verified | June 2020; triggered DeFi Summer |
| `misc_morpho_2023` | Morpho (2023). Optimizing Lending | T1 | Verified | P2P matching layer optimization |

---

## DeFi Derivatives — Academic Research

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_replicating_portfolio_2020` | Angeris, G. et al. (2020). Replicating Portfolios | T1 | Verified | LP as options framework |
| `article_rmm_stanford` | Angeris, G. et al. (2021). RMM: Replicating Market Makers | T1 | Verified | Stanford; arbitrary payoff replication |
| `article_panoptic_2022` | Lambert, G. (2022). Panoptic Protocol | T1 | Verified | Perpetual options on Uniswap V3 |
| `misc_paradigm_everlasting_options` | Paradigm (2021). Everlasting Options | T1 | Verified | Never-expiring options concept |
| `misc_paradigm_power_perps` | Paradigm (2021). Power Perpetuals | T1 | Verified | Squeeth (ETH²) concept |
| `misc_perpetual_protocol` | Perpetual Protocol (2020). vAMM Documentation | T1 | Verified | First vAMM perpetual |
| `misc_defi_derivatives` | 0xperp (2024). Awesome DeFi Derivatives | T2 | Verified | Curated resource collection |

---

## Fee Markets & Blockspace Economics

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_roughgarden_eip1559_2021` | Roughgarden, T. (2021). Transaction Fee Mechanism Design | T1 | Verified | Formal EIP-1559 analysis |
| `article_chung_welfare_2023` | Chung, H. & Shi, E. (2023). Welfare Analysis of Blockchains | T1 | Verified | Mechanism design for blockspace |
| `article_buterin_multidim_eip1559_2023` | Buterin, V. (2023). Multidimensional EIP-1559 | T1 | Verified | Extending EIP-1559 to blobs |
| `misc_awesome_blockspace` | 0xperp (2024). Awesome Blockspace | T2 | Verified | Curated resource collection |
| `misc_awesome_fee_markets` | 0xperp (2024). Awesome Fee Markets | T2 | Verified | Curated resource collection |

---

## Prediction Markets & Information Economics

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_hanson_lmsr_2003` | Hanson, R. (2003). LMSR | T1 | Verified | AMM intellectual origin |
| `article_hanson_parimutuel_2003` | Hanson, R. (2003). Parimutuel Markets | T1 | Verified | Alternative PM design |
| `book_tetlock_predictions_2017` | Tetlock, P. (2017). Expert Political Judgment | T1 | Verified | Superforecasting research |
| `misc_augur_whitepaper_2015` | Peterson, J. et al. (2015). Augur | T1 | Verified | First decentralized prediction market |
| `misc_polymarket_2020` | Polymarket (2020). Documentation | T2 | Verified | Major prediction market platform |
| `misc_awesome_prediction_markets` | 0xperp (2024). Awesome Prediction Markets | T2 | Verified | Curated resource collection |
| `misc_event_markets_resources` | Adjacent Research (2024). Event Markets | T2 | Verified | Market research |
| `misc_adjacent_play_money_2025` | Adjacent Research (2025). In Defense of Play Money Markets | T2 | Verified | Play money vs real money analysis; Metaculus, Manifold vs Polymarket, Kalshi |

---

## Stablecoins — Early History & Research

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `misc_bitshares_bitusd_2014` | Larimer et al. (Jul 2014). BitUSD | T1 | Verified | First crypto-collateralized stablecoin; global settlement Nov 2018 |
| `misc_nubits_2014` | Nu Team (Sep 2014). NuBits | T1 | Verified | First algorithmic stablecoin; collapsed 2018 |
| `online_makerdao_whitepaper_2017` | MakerDAO (2017). Dai Whitepaper | T1 | Verified | CDP system design |
| `misc_curve_stableswap_2019` | Egorov, M. (2019). StableSwap Invariant | T1 | Verified | Stablecoin-optimized AMM |
| `misc_paxgold_2018` | Paxos (2018). Pax Gold | T1 | Verified | First gold-backed stablecoin; 1 PAXG = 1 oz gold |
| `misc_frax_2019` | Kazemian & Mao (2019). Frax Protocol | T1 | Verified | First hybrid (partial collateral + algorithmic) stablecoin |
| `misc_liquity_lusd_2020` | Liquity AG (2020). Liquity Protocol | T1 | Verified | Immutable ETH-backed CDP; LUSD stablecoin |
| `misc_ust_collapse_2022` | Various (2022). UST/LUNA Analysis | T2 | Verified | Algorithmic stablecoin failure |
| `misc_paypal_pyusd_2023` | PayPal (Aug 2023). PYUSD | T1 | Verified | First major fintech stablecoin |
| `misc_ethena_usde_2024` | Ethena Labs (2024). USDe | T1 | Verified | Delta-neutral stablecoin; stETH + short perps |
| `misc_fdusd_2024` | First Digital Labs (2024). FDUSD | T2 | Verified | Institutional fiat-backed; rapid growth to top 10 |
| `misc_ripple_rlusd_2024` | Ripple (2024). RLUSD | T2 | Verified | Cross-border optimized stablecoin |
| `misc_awesome_stablecoins` | 0xperp (2024). Awesome Stablecoins | T2 | Verified | Curated resource collection |

---

## Auction Theory & Mechanism Design — Foundational Research

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `article_vickrey_auction_1961` | Vickrey, W. (1961). Counterspeculation, Auctions | T1 | Verified | Second-price auctions; Nobel 1996 |
| `article_clarke_multipart_1971` | Clarke, E. (1971). Multipart Pricing | T1 | Verified | VCG mechanism; incentive-compatible pricing |
| `article_hurwicz_optimality_1972` | Hurwicz, L. (1972). Informationally Decentralized Systems | T1 | Verified | Mechanism design foundations; Nobel 2007 |
| `article_groves_incentives_1973` | Groves, T. (1973). Incentives in Teams | T1 | Verified | Completes VCG mechanism |
| `article_gibbard_manipulation_1973` | Gibbard, A. (1973). Manipulation of Voting Schemes | T1 | Verified | Strategy-proofness impossibility |
| `article_satterthwaite_strategyproofness_1975` | Satterthwaite, M. (1975). Strategy-proofness | T1 | Verified | Gibbard-Satterthwaite theorem |
| `article_myerson_optimal_1981` | Myerson, R. (1981). Optimal Auction Design | T1 | Verified | Revenue-optimal mechanisms; Nobel 2007 |
| `article_milgrom_theory_1982` | Milgrom, P. & Weber, R. (1982). Theory of Auctions | T1 | Verified | Common value auctions; winner's curse |
| `article_klemperer_auctions_1999` | Klemperer, P. (1999). Auction Theory Survey | T1 | Verified | Definitive auction theory literature review |

---

## Mining Hardware & Pools

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `misc_bitmain_antminer` | Bitmain (2013+). Antminer Series | T2 | Verified | Dominant ASIC manufacturer; S-series (SHA-256) |
| `misc_canaan_avalon` | Canaan (2013). Avalon Series | T2 | Verified | First commercial Bitcoin ASIC (Jan 2013) |
| `misc_microbt_whatsminer` | MicroBT (2016). WhatsMiner Series | T2 | Verified | Founded by ex-Bitmain designer |
| `misc_slush_pool_2010` | Palatinus, M. (2010). Slush Pool | T1 | Verified | First mining pool (Nov 2010) |
| `misc_stratum_v1` | Palatinus, M. (2012). Stratum Protocol | T1 | Verified | Standard mining pool protocol |
| `misc_stratum_v2` | Braiins (2019). Stratum V2 | T1 | Verified | Encrypted, decentralized template creation |
| `misc_ghash_51_percent_2014` | GHash.IO (2014). 51% Event | T2 | Verified | July 2014; centralization concern |
| `misc_china_mining_ban_2021` | Various (2021). China Mining Ban | T2 | Verified | May 2021; ~50% hashrate drop |
| `misc_ethash` | Ethereum (2015). Ethash | T1 | Verified | Memory-hard PoW algorithm |
| `misc_randomx` | RandomX Team (2019). RandomX | T1 | Verified | Most successful ASIC-resistant algorithm |

---

## Node Software Primitives

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `misc_leveldb` | Dean, J. & Ghemawat, S. (2011). LevelDB | T1 | Verified | Google's LSM-tree; used by Bitcoin Core, early Geth |
| `misc_rocksdb` | Facebook (2012). RocksDB | T1 | Verified | LevelDB fork; multi-threaded; used by Nethermind, Besu |
| `misc_lmdb` | Chu, H. (2011). LMDB | T1 | Verified | Memory-mapped B+tree; OpenLDAP Project |
| `misc_mdbx` | Yuriev, L. (2015). MDBX | T1 | Verified | LMDB fork; used by Erigon, Reth (6x smaller archives) |
| `misc_libsecp256k1` | Wuille, P. (2013). libsecp256k1 | T1 | Verified | Optimized ECC; 4-10x faster than OpenSSL |
| `misc_blst` | Supranational (2020). BLST | T1 | Verified | BLS12-381; required for ETH PoS |
| `misc_libp2p` | Protocol Labs (2014). libp2p | T1 | Verified | Modular P2P stack; used by IPFS, ETH consensus |
| `misc_gossipsub` | Vyzovitis, D. et al. (2019). GossipSub | T1 | Verified | Pubsub for blockchain attestation/block propagation |

---

## International Exchanges & Infrastructure

| Key | Citation | Tier | Status | Notes |
|-----|----------|------|--------|-------|
| `misc_independent_reserve_2013` | Przelozny et al. (2013). Independent Reserve | T2 | Verified | Australia's oldest exchange; Sydney; first Singapore MAS license 2021 |

---

## Sources Needing Follow-Up

The following sources need additional verification or primary documentation:

1. ~~**`misc_mojonation_technical_2000`**~~ — ✓ VERIFIED: Primary sources found (Feb 14, 2000 Technical Overview)
2. ~~**`misc_szabo_smart_contracts_1994`**~~ — ✓ VERIFIED: Copyright 1994 confirmed; 1996 Extropy #16 is expanded version
3. **`misc_szabo_bitgold_1998`** — Bit Gold; described 1998 but published 2005 (remains contested)

---

## Adding New Sources

1. Check if source already exists in this index
2. Determine credibility tier (T1/T2/T3)
3. Verify date and attribution against multiple sources
4. Add BibTeX entry to `library.bib`
5. Add row to appropriate era table above
6. If verification status is not "Verified", add to "Sources Needing Follow-Up"
