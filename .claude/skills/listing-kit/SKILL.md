---
name: listing-kit
description: Turn one unit or compound into a full bilingual marketing kit — listing description (AR+EN), area/compound guide, platform-specific social posts, and image briefs. Use when a founder says "market this unit", "اعمل اعلان للشقة دي", "we got an exclusive on X", or wants area-guide content for SEO.
---

# Listing Kit — one unit in, full kit out

## When to use
New unit/exclusive to market, a compound Loop wants to own in search results, or refreshing stale listings.

## Required inputs
1. Unit facts: project, developer, type, BUA, price, payment plan, delivery, view/floor — from `data/inventory/` or founder (with as-of date)
2. Photos available? (yes → image briefs reference them; no → flag the shoot list)
3. Target: end-use buyer, investor, or both (changes the lead angle)

## Process

### 1. Listing description — AR + EN versions
- Lead with the strongest verifiable fact (price/m² vs. area benchmark, payment plan, delivery date) — not adjectives
- Egyptian colloquial AR for the AR version (portal-appropriate register); EN version for premium/expat audiences
- Mandatory facts block: price, BUA, plan, delivery, finishing status
- Compliance: no misleading claims (brokerage-law ad standards — [docs/market.md](../../../docs/market.md)); nothing the developer hasn't confirmed in writing

### 2. Area/compound guide (the SEO asset)
One evergreen guide per compound/corridor: location + access, developer track record, amenities, price history (sourced), payment-plan landscape, who it suits (investor vs. family math). Structure for search: use plugin `claude-clients:seo-content-brief` for the brief and `seo-cluster` for the corridor's topic map when doing this at scale. Goes to `drafts/` as markdown.

### 3. Social posts — per platform
| Platform | Shape |
|---|---|
| Instagram/Facebook post | Hook (the number) + 3 facts + CTA to WhatsApp |
| Instagram Reel script | 20–30s VO script in colloquial AR, shot list |
| WhatsApp broadcast/status | 2 lines + the one number that stops the scroll |
| TikTok | Same Reel script, rawer tone |

### 4. Image briefs
What to shoot/generate per asset (hero, carousel, story). If generating: brief only — generation runs through whatever image tooling is installed; don't fake capability.

## Output (all to `drafts/listing-[slug]/`)
```
drafts/listing-[slug]/
├── listing-ar.md / listing-en.md
├── area-guide.md
├── social.md          (all platforms, labeled)
└── image-briefs.md
```

## Quality checks
- [ ] Every number traces to `data/` or founder-confirmed, with as-of date
- [ ] AR is colloquial Egyptian, not MSA
- [ ] No "luxury/dream/once-in-a-lifetime" filler — numbers and dates ([docs/positioning.md](../../../docs/positioning.md) tone)
- [ ] CTA routes to WhatsApp (the deal channel)
- [ ] Nothing publishes from here — founder approves from `drafts/`

## Red flags
- Photos that don't match the actual unit (developer stock renders) → label renders as renders; misleading-ad risk
- Price the developer hasn't confirmed in writing → hold the kit until confirmed
