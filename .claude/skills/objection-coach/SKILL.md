---
name: objection-coach
description: Objection handling and call/WhatsApp coaching for Egyptian primary-market sales — installment hesitation, "prices will drop", EOI fear, spouse approval, competitor undercuts. Use when a founder says "client says X, what do I answer?", "العميل بيقول الاسعار هتنزل", or wants role-play before a tough call.
---

# Objection Coach — scripts grounded in numbers, not pressure

## When to use
Pre-call prep, mid-negotiation ("he just said..."), post-call debrief, or role-play practice. House rule: every rebuttal is built on a verifiable number or a genuine reframe — Loop doesn't do pressure tactics ([docs/positioning.md](../../../docs/positioning.md): the numbers-honest brokerage).

## Required inputs
1. The objection verbatim (paste the message or quote the call)
2. The deal context: which unit/project, where in the funnel ([data/pipeline.md](../../../data/pipeline.md))
3. What the client cares about most (from `lead-qualify` intent)

## The Egypt objection playbook

### "الأسعار هتنزل — I'll wait for prices to drop"
Frame: nominal vs. real. EGP devaluation + construction-cost inflation mean developers reprice UP between phases; waiting costs the payment-plan terms too. Pull actual phase-over-phase repricing for this developer from `data/developers/` history if logged. Honest version: "Prices in EGP rarely drop; what drops is your buying power. Here's [project]'s price list [date] vs. [date]: +[X]%."

### "مش هدفع EOI — why pay to maybe buy?"
EOI = refundable option. Math: [EOI amount] refundable vs. ~10–15% launch-price advantage on [unit price] = [EGP saved]. Worst case: refund per terms (quote the exact refund terms from `data/developers/<dev>.md` — never vague-promise refundability).

### "Installments are haram interest" / religious framing
Respect it; don't debate fiqh. Developer plans are price-installment (تقسيط على سعر ثابت), not interest loans — the contract states a fixed total. Offer the contract language; suggest the client verify with their own sheikh. Move on.

### "لازم أسأل مراتي / جوزي" (spouse approval)
Real decision-maker signal, not a brush-off. Offer the artifact: a clean 1-page option summary (from `inventory-match`) the client can forward. Propose a 3-way WhatsApp or visit.

### "Broker X offered me cashback from his commission"
The undercut. Loop's answer: cashback brokers disappear after contract; Loop's value is allocation access, payment-plan negotiation, and delivery follow-through (tranches mean Loop stays incentivized until delivery). If the deal economics force matching — that's a FOUNDER decision, never offered proactively.

### "I had a bad developer experience / delivery delays"
Validate. Show the developer's actual delivery track record (data/developers notes) — and if it's bad, say so and offer alternatives. Trust earned here compounds ([docs/strategy.md](../../../docs/strategy.md) Pillar 3).

## Process
1. Classify the objection (above taxonomy or new)
2. Pull the relevant numbers from `data/` — a script without a real number is not done
3. Draft response in client's language (colloquial AR / EN / Franco), ≤4 sentences, ending with a small next step
4. Role-play variant on request: Claude plays the client, founder practices; debrief with 2 specific improvements

## Output template
```
OBJECTION: "[verbatim]" → Type: [classification]
WHAT IT REALLY MEANS: [one line — surface vs. real concern]
NUMBERS: [the verifiable facts pulled, with sources]
RESPONSE DRAFT ([language]): [≤4 sentences]
IF THAT FAILS: [fallback path or graceful park → followup-cadence]
DON'T: [the pressure move to avoid here and why it backfires]
```

## Quality checks
- [ ] Objection quoted verbatim before classified
- [ ] At least one sourced number in the rebuttal
- [ ] No invented refund terms, track records, or price history
- [ ] Response in client's language and register

## Red flags
- Objection reveals affordability problem, not hesitation → stop selling this unit; route to `inventory-match` for realistic options. Pushing a client into default hurts everyone including Loop's developer grade.
- Client cites a real legal/contract concern → that's not an objection to handle; it goes to a lawyer (`doc-drafts` legal gate logic).
