---
name: cma-resale
description: Comparative market analysis for resale property in Egypt without an MLS — triangulates portal listings, Aqarmap indices, and Loop's closed-deals log into a 3-tier price recommendation. Use when a founder asks "what's this apartment worth?", "السعر ده كويس؟", or a seller wants a valuation.
---

# CMA Resale — pricing without an MLS

## When to use
Resale valuation: seller mandate pricing, buyer offer sanity-check, or counter-offer support. NOT for primary/new-launch (developer price lists govern there — use `inventory-match`).

## The Egypt caveat (state it in every output)
No MLS exists; ~5% of Cairo properties are title-registered; **listing prices ≠ transaction prices** (asks routinely 10–20% above closes). Every CMA here is a triangulation with stated confidence — never present it as an appraisal.

## Required inputs
1. Subject property: compound/street, type, BUA, floor, view, finishing, parking, legal status (registered? وكالة? تخصيص?)
2. Why pricing: sell mandate / buyer offer / refinance curiosity (changes the recommendation framing)

## Data layers (weight in this order)
1. **`data/closed-deals.md`** — Loop's own closes in the compound/area (real transaction prices; gold)
2. **Asking prices:** same-compound active listings on portals (Property Finder Egypt, Aqarmap, OLX/Dubizzle) — note as-of date; apply ask-to-close discount
3. **[Aqarmap Research](https://i.aqarmap.com/research/)** area indices — direction + EGP/m² benchmarks
4. Founder/agent knowledge: recent closes they personally know (mark as anecdotal, date them)

## Process
1. Pull 5+ comps; normalize to EGP/m² of BUA; adjust for floor/view/finishing (state each adjustment and % explicitly)
2. Estimate ask-to-close discount from any layer-1/layer-4 pairs available; default 10–15% if none (say so)
3. Compute the band and confidence:
   - **Confidence HIGH:** ≥2 real closes in compound <6 months
   - **MEDIUM:** good ask data + index support, no recent closes
   - **LOW:** thin data — say "this is a [LOW] confidence band", never dress it up
4. Three-tier recommendation:
   - **Fast (sell in <30 days):** [band low]
   - **Market (60–90 days):** [band mid]
   - **Patient (test the ceiling):** [band high] + the carrying-cost honesty (inflation cuts real value while waiting — or supports it; run the actual direction from `market-brief`)

## Output template
```
CMA — [property] @ [date] · Confidence: [HIGH/MED/LOW]
CAVEAT: triangulated estimate, not an appraisal; asks ≠ closes in this market.

COMPS ([n])
[#] [source layer] [compound, spec] — [EGP/m²] — [adjustments applied] → adjusted [EGP/m²]
...
Ask-to-close discount applied: [X]% ([basis])

BAND: [low]–[high] EGP ([EGP/m²] range)
  FAST (<30d): [EGP]
  MARKET (60–90d): [EGP]
  PATIENT: [EGP] — carrying-cost note: [one line]
LEGAL FLAG: [registration status implication on price/liquidity]
DATA GAPS: [what would raise confidence one tier]
```

## Quality checks
- [ ] Every comp lists its layer and date
- [ ] Adjustments explicit (no silent "feel" corrections)
- [ ] Confidence tier stated and justified
- [ ] Caveat block present in client-facing version

## Red flags
- Seller anchored to a 2-year-old neighbor story → show the EGP devaluation math; nominal vs. real
- Unregistered property priced like registered → flag the liquidity discount explicitly
- Closing log empty for the area → output works but push the founders: every Loop close MUST land in `data/closed-deals.md`; the moat compounds
