---
name: doc-drafts
description: Draft transaction documents — reservation forms, EOI forms, allocation requests, brokerage agreements — ALWAYS as drafts behind a mandatory legal-review gate. Use when a founder says "draft the reservation form", "جهزلي استمارة الحجز", or needs any transaction paperwork.
---

# Doc Drafts — paperwork drafts with a hard legal gate

## ⚠️ The gate (non-negotiable)
Every output of this skill:
1. Carries this banner at the top, in AR + EN, and it is never removed:
   > **مسودة — تتطلب مراجعة قانونية قبل الاستخدام / DRAFT — REQUIRES LEGAL REVIEW BEFORE USE.** Not legal advice. No signature, payment, or client commitment may rely on this document until reviewed by Loop's lawyer.
2. Goes to `drafts/legal/` — never directly to a client
3. Is logged in the session handoff so Hassan/founders see it was produced

These documents move real money (EOI deposits 50–100k EGP, reservation fees). The new brokerage law adds penalties for malpractice. The gate exists because the cost of a bad clause is asymmetric.

## When to use
- Reservation form / حجز for a unit
- EOI submission form
- Allocation confirmation request to a developer
- Brokerage/commission agreement skeleton (written registration is legally required — [docs/market.md](../../../docs/market.md))
- Client requirement summary the client signs off on (low-risk, but same flow)

## Required inputs
1. Document type + the deal row from [data/pipeline.md](../../../data/pipeline.md)
2. Exact parties (full legal names as on the national ID / السجل التجاري)
3. Exact figures: unit, price, deposit amount, refund terms — from `data/developers/<dev>.md` written terms. If a term isn't in writing from the developer, the draft says `[TO CONFIRM IN WRITING WITH DEVELOPER]` — never fill in a plausible value.

## Process
1. Pick the matching skeleton (below) or extend from the closest prior draft in `drafts/legal/`
2. Fill ONLY confirmed facts; bracket every unconfirmed term
3. Bilingual where client-facing (AR primary, EN courtesy); AR controls in case of conflict — state that
4. Append a **review checklist for the lawyer**: the clauses Claude flagged as needing judgment (refund conditions, force majeure, commission attribution, dispute venue)
5. Save to `drafts/legal/YYYY-MM-DD-[type]-[client-slug].md`

## Skeletons maintained
- `eoi-form` — client identity, project, deposit amount, refund terms verbatim from developer, validity window, signature blocks
- `reservation-form` — unit specifics, price, payment plan schedule table, conditions
- `brokerage-agreement` — scope, commission %, written-registration clause (legal cap 5%), tranche schedule, attribution protection (CIL reference)
- `allocation-request` — formal letter to developer citing CIL date + EOI receipt

## Output template
```
[⚠️ bilingual draft banner]
DOC: [type] · Deal: [pipeline ID] · Date: [date]
[document body — confirmed facts only, brackets for unconfirmed]
---
LAWYER REVIEW CHECKLIST
1. [clause needing judgment + why flagged]
...
UNCONFIRMED TERMS: [list of every bracket above]
```

## Quality checks
- [ ] Banner present, bilingual, top of document
- [ ] Zero invented terms — every figure traces to written source or is bracketed
- [ ] Saved to `drafts/legal/`, not sent anywhere
- [ ] Lawyer checklist appended

## Red flags
- Founder asks to "just make it final, the lawyer is slow" → refuse the banner removal; offer to draft the chase message to the lawyer instead
- Commission above 5% in any draft → illegal; stop and flag
- Client-side document (e.g. power of attorney توكيل) requested → out of scope entirely; lawyer-only territory
