---
name: market-brief
description: Weekly per-area Egypt real-estate intel brief with EGP/inflation context — investor-grade, citable, doubles as client-facing content. Use when a founder asks "what's happening in [area] this week?", "اخبار السوق ايه", wants an investor brief for a client, or for the weekly report.
---

# Market Brief — investor-grade area intelligence

## When to use
- Weekly rhythm (feeds `reports/` and `followup-cadence` value payloads)
- A client asks "is now a good time?" / "which area?"
- Before a launch event or EOI decision

## Required inputs
1. Area(s) in scope (default: Loop's focus corridors from [docs/strategy.md](../../../docs/strategy.md))
2. Audience: founder-internal or client-facing (changes depth and tone, not facts)

## Sources (in trust order)
1. `data/closed-deals.md` + `data/inventory/` — Loop's own ground truth
2. [Aqarmap Research Portal](https://i.aqarmap.com/research/) — indices and demand
3. Developer announcements (launches, price lists, payment-plan changes) — from `data/developers/` notes or the founders
4. Web search for the week's news (CBE rates, inflation prints, new-city announcements, brokerage-law progress) — cite every claim
5. NEVER uncited claims. If a number can't be sourced, it doesn't go in.

## Process
1. Pull the week's events per area: launches, price-list changes, EOI windows opening/closing
2. Macro frame in 3 lines max: EGP, inflation, rates — only what changes a buyer's decision this week
3. Per area: price direction (EGP/m² with source), demand signal, what's launching, the one-sentence "so what" for an investor
4. Action hooks: which pipeline leads ([data/pipeline.md](../../../data/pipeline.md)) does this week's news give a follow-up reason for? List them — this is the cadence fuel.

## Output template
```
MARKET BRIEF — Week of [date] — [areas]

MACRO (3 lines): [EGP/USD, inflation, rate — and the one-line buyer implication]

[AREA 1]
  Price: [EGP/m² level/direction] (source)
  This week: [launches / EOI windows / price-list changes]
  So what: [one investor-grade sentence]

[AREA 2] ...

FOLLOW-UP FUEL: [lead → which fact above is their touch this week]
SOURCES: [numbered list, every claim traceable]
```

Client-facing variant: same facts, client's language, Loop tone ([docs/positioning.md](../../../docs/positioning.md)) — numbers and dates, zero hype, ends with one soft CTA.

## Quality checks
- [ ] Every number has a source and date
- [ ] Macro section ≤3 lines
- [ ] At least one follow-up hook extracted per active corridor
- [ ] Client variant contains no internal data (commission, pipeline)

## Red flags
- A claim circulating on broker WhatsApp groups with no primary source → mark RUMOR explicitly or drop it
- Price "trends" built on <5 data points → say "thin data" rather than implying a trend
