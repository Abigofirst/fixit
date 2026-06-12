# Processing Log

A running record of everything dropped into `ingest/` — what it was, when it was reviewed, and where it ended up. **Append a new entry every time a batch is processed.** Newest entries at the top.

## How to read this

Each entry covers one review pass. It lists the files that came in, what was decided, and the destination. If something needs follow-up (missing asset, unclear file, a question for Tarek), it is flagged under **Open items**.

---

## Template (copy for each new batch)

```
### YYYY-MM-DD — <short batch title>

**Reviewed by:** <name / Claude>

| Source file | Type | Action | Destination |
|-------------|------|--------|-------------|
| example.pdf | brand guideline | filed | brand/ |

**Notes:** <anything worth knowing>

**Open items:**
- [ ] <follow-up, if any>
```

---

## Log

### 2026-06-12 — First batch: brief, deliverables, mockups, logo, ops flow

**Reviewed by:** Claude

7 files reviewed in `_inbox/`, all sorted. Two PDFs and the operations diagrams were transcribed into editable markdown so they are diff-able and readable on GitHub without opening binaries.

| Source file (original name) | Type | Action | Destination |
|-----------------------------|------|--------|-------------|
| Website Brief.pdf | Requirements spec (18 sections) | Filed + transcribed to MD | `docs/website-brief.pdf` + `docs/website-brief.md` |
| Website Deliverables (2 Phases).pdf | Phase 1 + Phase 2 scope | Filed + transcribed to MD | `website/website-deliverables-2-phases.pdf` + `website/deliverables-2-phases.md` |
| website mockup.jpeg | English homepage/tech/WhatsApp comp | Renamed + documented | `website/mockups/homepage-mockup-en.jpeg` |
| website mockup 2.png | Arabic Phase 1 + Phase 2 comp | Renamed + documented | `website/mockups/phases-mockup-ar.png` |
| WhatsApp Image 2026-06-12 at 12.51.45 AM.jpeg | Official FixIt logo | Renamed → logo | `brand/logo/fixit-logo.jpeg` |
| WhatsApp Image 2026-05-05 at 19.05.56.jpeg | Ops flow diagram (13 steps, Arabic) | Renamed | `docs/operations/operations-flow-v1-13steps.jpeg` |
| WhatsApp Image 2026-05-05 at 19.05.56 (1).jpeg | Ops flow diagram (18 steps, Arabic) | Renamed | `docs/operations/operations-flow-v2-18steps.jpeg` |

**New docs written:** `docs/website-brief.md`, `website/deliverables-2-phases.md`, `brand/brand-guidelines.md`, `docs/operations/operations-flow.md`, `website/mockups/README.md`, `docs/project-overview.md`.

**Notes:**
- Project is **FixIt Egypt** — a bilingual (EN/AR) home-services marketplace, WhatsApp-first, launching in Maadi. Operations-first MVP.
- Brand colors in `brand/brand-guidelines.md` are eyeballed from the logo and need confirming against a real source file.

**Open items:**
- [ ] Get **vector logo** (SVG/AI/EPS) + transparent PNG + mono variants — only a JPEG exists.
- [ ] Confirm exact **brand hex values** and **fonts**.
- [ ] Decide the **online card payments** question flagged in the brief (§7).
- [ ] No written brand *guidelines* document was supplied — `brand-guidelines.md` is reconstructed; replace/extend when the real one arrives.
