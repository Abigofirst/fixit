---
name: inventory-match
description: Match a client requirement to ranked unit options from Loop's developer knowledge base — payment-plan comparison, EOI math, and commission per option. Use when a founder asks "what can I show a client with budget X in area Y?", "اعرض ايه على العميل ده", or after lead-qualify produces a HOT/WARM lead.
---

# Inventory Match — requirement → ranked options

## When to use
A qualified client needs options. Input is a requirement (from `lead-qualify` output or stated directly); output is a ranked shortlist the founder can send or present.

## Required inputs
1. Client requirement: budget (cash vs. installment capacity), area(s), unit type/size, timeline, intent (investment vs. end-use)
2. Freshness check: newest snapshots in `data/inventory/` + project tables in `data/developers/*.md`

If `data/` is empty or stale (>7 days) for the relevant developer, SAY SO and list what to request from the developer contact — do not fill gaps from memory or the web.

## Process

### 1. Filter
Hard constraints first (budget ceiling, area, delivery timeline). Budget for installment buyers = monthly capacity × plan length, not sticker price — compute both.

### 2. Rank — by client fit, not commission
Score each candidate:
- **Fit (50%):** budget headroom, area match, size/type, delivery date vs. timeline
- **Value (30%):** EGP/m² vs. area benchmark (Aqarmap / `data/closed-deals.md`), payment-plan NPV (longer equal installments in a high-inflation EGP environment = real discount — show the math simply)
- **Momentum (20%):** launch stage (EOI window open = price advantage ~10–15%), developer delivery track record

Commission is shown to the FOUNDER per option but never influences the ranking presented as "best for the client" — trust is the strategy ([docs/strategy.md](../../../docs/strategy.md) Pillar 3).

### 3. EOI math (when an EOI window is open)
> EOI [amount] EGP, refundable per [terms in data/developers/<dev>.md], locks priority allocation; comparable post-launch pricing historically +[X]%. Net: paying the EOI is buying a [X]% option for a refundable deposit.

### 4. Output the shortlist
3–5 options max. Each: project, developer, unit spec, price, payment plan, delivery, why-this-one in one sentence, what-to-confirm-with-developer.

## Output template
```
CLIENT: [summary of requirement]
DATA AS-OF: [newest snapshot dates per developer — flag anything >7 days]

#1 [Project, Developer] — [type, BUA, price EGP]
   Plan: [down% / years] → [monthly EGP]
   Delivery: [date] · Stage: [EOI open / launched / ready]
   Why: [one sentence, client's own priorities]
   Confirm with developer: [availability of this exact spec, price validity]
   (Founder-only: commission [X]% = [EGP], tranches per data/developers/<dev>.md)

#2 ... (same shape)

EOI CALL: [if applicable — which option has an open EOI window and the math]
GAPS: [what data/ is missing that would change this ranking]
```

## Quality checks
- [ ] Every price/availability traces to a `data/` file with an as-of date
- [ ] Installment affordability computed, not assumed
- [ ] Ranking justified by client fit; commission disclosed separately to founder
- [ ] Stale data flagged with explicit "confirm with developer"

## Red flags
- No inventory fits the budget → say so plainly + nearest realistic alternative (smaller unit / different corridor / resale via `cma-resale`). Never stretch a client into default risk.
- Requirement only matches developers Loop has no relationship with → flag as a `data/developers/` prospecting task, not a dead end.
