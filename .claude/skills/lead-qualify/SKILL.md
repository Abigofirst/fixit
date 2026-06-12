---
name: lead-qualify
description: Score an inbound real-estate lead from a WhatsApp thread (or call notes) — budget/timeline/intent scoring, suggested instant reply in the lead's language (Egyptian Arabic / English / Franco), and a CIL-urgency flag. Use when a founder pastes a lead conversation, says "score this lead", "قيّم العميل ده", or asks how to reply to a new inquiry.
---

# Lead Qualify — WhatsApp-first lead scoring

## When to use
Any new inbound lead: WhatsApp thread, call notes, form fill, referral intro. Also re-scoring when new information arrives ("he just said his budget is actually 12M").

## Why this matters (the founder context)
In Egypt's primary market, the first broker to register the client with the developer (CIL) wins the commission. A hot lead unanswered for hours may already be registered by a competitor. This skill exists to compress minutes-to-reply and hours-to-CIL.

## Required inputs
1. The conversation verbatim (paste the WhatsApp thread — exact words matter; voice-note transcript if available)
2. Source of the lead (referral / ad / portal / walk-in / repeat)
3. Anything already known about the client (prior deals, who referred)

If input 1 is missing, ask for it — do not score from a summary.

## Process

### 1. Extract signals (quote the evidence)
| Signal | What to look for |
|---|---|
| Budget | Stated number, or proxies: area + unit type mentioned, payment plan questions, "كاش ولا تقسيط" |
| Timeline | "this launch" / "before Ramadan" / "just looking" / asks about delivery dates |
| Intent | Investment (asks about resale, ROI, installment math) vs. end-use (schools, family, location detail) |
| Authority | Is this the decision-maker? Buying for self, parents, abroad relative? |
| Area focus | Specific compound/corridor named = warmer |
| Language | AR colloquial / EN / Franco — reply MUST match |

### 2. Score (show your work)
- **Budget (0–3):** 3 = stated and matches available inventory · 2 = inferable range · 1 = vague proxy · 0 = none
- **Timeline (0–3):** 3 = active now (launch/EOI window) · 2 = ≤3 months · 1 = 3–12 months · 0 = someday
- **Intent clarity (0–2):** 2 = clear investment or end-use case · 1 = mixed · 0 = unclear
- **Engagement (0–2):** 2 = asks specific questions, replies fast · 1 = responsive · 0 = one-word replies

**Total /10 → temperature:** 8–10 HOT · 5–7 WARM · 2–4 COOL · 0–1 PARK

### 3. CIL-urgency flag
If HOT or WARM **and** interested in a specific developer's project **and** not yet registered → output banner:
> ⏱ **CIL URGENT: file with [developer] TODAY.** First-to-register wins attribution. Check `data/developers/<dev>.md` for the registration channel and validity window.

### 4. Draft the instant reply
- In the lead's language. Egyptian colloquial for Arabic — NEVER MSA.
- ≤3 sentences. One concrete value-add (real fact from `data/`), one qualifying question that fills the biggest scoring gap.
- If quoting availability/price, only from `data/inventory/` with as-of date — otherwise don't quote numbers.

### 5. Recommend routing + next touch
Who handles it, and when the next touch fires if no reply (feeds `followup-cadence`).

## Output template
```
LEAD: [name/phone] · Source: [x] · Language: [AR/EN/Franco]
SCORE: [n]/10 → [HOT/WARM/COOL/PARK]
  Budget [n]/3 — "[quoted evidence]"
  Timeline [n]/3 — "[quoted evidence]"
  Intent [n]/2 — [investment/end-use] — "[evidence]"
  Engagement [n]/2 — [evidence]
[⏱ CIL URGENT banner if applicable]
SUGGESTED REPLY (draft — founder sends):
  [reply in lead's language]
NEXT: [routing + follow-up trigger]
UNKNOWNS: [what we still don't know + the one question that resolves it]
```

## Quality checks
- [ ] Every score line quotes the lead's actual words
- [ ] Reply matches the lead's language and register
- [ ] No invented prices, units, or availability
- [ ] CIL flag checked against `data/developers/` rules, not assumed

## Red flags
- Lead asks to bypass registration / "deal directly with the developer for a discount" → flag to founder, don't coach around it
- Budget wildly below the area's floor → score honestly, suggest realistic alternatives rather than false hope
- Another broker already involved → surface immediately; attribution conflict risk
