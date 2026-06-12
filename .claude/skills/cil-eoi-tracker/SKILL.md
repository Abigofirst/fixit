---
name: cil-eoi-tracker
description: Log and track CIL registrations, EOI deposits, allocations, and commission tranches across developers — the deal pipeline and cash-flow forecast in one place. Use when a founder says "log this CIL", "سجلت العميل عند سوديك", "where do we stand with [developer]?", "pipeline status", or weekly when building reports.
---

# CIL/EOI Tracker — pipeline + commission cash-flow

## When to use
- Logging events: CIL filed, EOI paid, allocation received, contract signed, client payment milestone hit, commission tranche received
- Status queries: per developer, per client, or whole pipeline
- Weekly report input (`reports/YYYY-Www.md`)

## The data file
Single source of truth: [data/pipeline.md](../../../data/pipeline.md) — one row per deal, append-only status history in the Notes column. Create it from the template below on first use.

```
| ID | Client | Phone | Developer | Project | Stage | CIL date | CIL expiry | EOI EGP | EOI date | Unit | Contract date | Deal EGP | Comm % | Comm EGP | Tranches received | Next expected (EGP, date) | Notes |
```

**Stages:** `LEAD → CIL-FILED → EOI-PAID → ALLOCATED → CONTRACTED → COLLECTING → CLOSED` (or `LOST-[reason]` / `REFUNDED`)

## Process

### Logging an event
1. Find or create the deal row (ID = `YYYY-NNN`)
2. Update stage + date; append a dated note ("2026-06-14: EOI 100k paid, receipt #...")
3. CIL events: pull the validity window from `data/developers/<dev>.md` → compute and record **CIL expiry**
4. Tranche events: record amount + which milestone triggered it; recompute Next expected

### Status query
Output three views:

**1. Deal funnel** — count + EGP value per stage, per developer.

**2. Urgency list (the daily view):**
- ⏱ HOT leads with no CIL filed (attribution at risk — from `lead-qualify` flags)
- ⚠️ CILs expiring within 14 days (re-register or push to EOI)
- 💰 EOIs paid but no allocation after [developer's normal window] (chase the developer)
- 📞 Contracted clients approaching a payment milestone (their payment triggers Loop's tranche — a service touchpoint AND a cash event)

**3. Cash-flow forecast** — expected tranches by month for the next 6 months, by developer. This IS Loop's revenue forecast ([docs/business-plan.md](../../../docs/business-plan.md)): closed deals ≠ cash; tranches = cash.

## Output template (status query)
```
PIPELINE @ [date]
FUNNEL: [n] leads → [n] CIL ([EGP]m) → [n] EOI ([EGP]) → [n] allocated → [n] contracted ([EGP]m deal value)

URGENT
⏱ No CIL: [client, developer, days since qualified]
⚠️ CIL expiring: [client, developer, expiry date]
💰 Allocation overdue: [client, developer, days waiting]
📞 Milestone approaching: [client, milestone, date, tranche EGP]

CASH FORECAST (next 6 months)
[Month]: [EGP] expected — [deal IDs]
...
TOTAL EXPECTED: [EGP] · AT RISK (client payment delays flagged): [EGP]
```

## Quality checks
- [ ] Every CIL row has an expiry date (from developer rules, not assumed)
- [ ] Tranche math ties to the written commission terms in `data/developers/`
- [ ] No stage skipping without a note explaining why
- [ ] Closed deals copied to `data/closed-deals.md` (feeds cma-resale comps)

## Red flags
- Same client appearing with two developers for the same requirement → fine; same client registered by another broker → attribution conflict, escalate to founder immediately
- EOI refund requested → log reason verbatim; 3+ same-reason refunds = strategy signal for `market-brief`
- Tranche overdue from developer >30 days → escalate; developer cash-flow stress is a portfolio risk ([docs/business-plan.md](../../../docs/business-plan.md) risks table)
