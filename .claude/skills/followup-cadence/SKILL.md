---
name: followup-cadence
description: Build a 7-touch WhatsApp-native nurture sequence for a lead by temperature — bilingual drafts, value-add per touch, never spam. Use when a founder says "this lead went cold", "build a follow-up plan", "تابع مع العميل ده", or after lead-qualify outputs a WARM/COOL lead.
---

# Follow-up Cadence — deals are won in the follow-up

## When to use
Any lead that didn't convert on first contact. Most Egyptian brokers stop after 1–2 touches — running a disciplined cadence IS the differentiator ([docs/strategy.md](../../../docs/strategy.md) Pillar 2).

## Required inputs
1. `lead-qualify` output (or the thread + temperature)
2. What the client went quiet on (price? area? spouse approval? "thinking about it"?)
3. Anything time-bound coming up (launch, EOI window closing, price increase announced)

## Cadence by temperature

| Temp | Touches | Spacing |
|---|---|---|
| HOT (didn't close) | 7 | Day 0, 1, 3, 5, 8, 12, 21 |
| WARM | 7 | Day 0, 2, 5, 10, 17, 30, 45 |
| COOL | 5 | Day 0, 7, 21, 45, 90 |
| PARK | 2 | Market-event-triggered only |

## The rules of a touch
1. **Every touch carries value** — a real fact, not "just checking in": new launch in their corridor, payment-plan change, area price movement (from `market-brief`), an EOI window opening/closing, a relevant unit released.
2. **Language = client's language.** Egyptian colloquial AR / EN / Franco. Voice-note scripts where the relationship suits it (mark as VN script).
3. **One CTA per touch**, low-friction ("أبعتلك تفاصيل الـ payment plan؟" beats "are you ready to buy?").
4. **Touch 3 or 4 names the real objection** the client went quiet on — gently, with the `objection-coach` framing.
5. **Final touch is the honest close-out:** "I'll stop messaging — when the market moves in [area] I'll send you one update. Good luck either way." This message gets replies surprisingly often.

## Output template
```
LEAD: [name] · Temp: [x] · Quiet on: [objection]
CADENCE: [type] starting [date]

T1 — [date] — [channel: msg/VN]
   [draft in client language]
   Value: [what this touch gives them]
T2 — [date] ...
...
TRIGGER OVERRIDES: [if EOI window closes [date], jump to touch X immediately]
LOG: add touch dates to data/pipeline.md notes for this deal
```

## Quality checks
- [ ] No touch is "checking in" without a value payload
- [ ] Drafts match client's language/register; no MSA
- [ ] Time-bound triggers (EOI windows, launches) override the calendar
- [ ] Founder sends — these are drafts ([CLAUDE.md](../../../CLAUDE.md) never-do rules)

## Red flags
- Client says stop → stop. Mark PARK with a do-not-contact note.
- Cadence completing with zero replies twice in a row across leads from one source → lead-source quality problem; surface it.
