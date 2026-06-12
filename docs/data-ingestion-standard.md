# Data Ingestion Standard — how to feed clean master data to Claude

> **The one rule that explains all the others:** *Claude's master data is only as trustworthy as the file it came from. A brand hex or a spec with no date and no source is worse than none — it looks authoritative while being eyeballed or out of date.* Everything below exists to make **source, date, and freshness impossible to lose**, while keeping the work you do near zero.

This is the standard for **every file dropped into `ingest/`** — for FixIt. It is the same standard used across the other projects; only the **Project bindings** at the bottom (§11) are FixIt-specific. Read it once. Then use the **pre-upload checklist** (§7) every time.

> **`docs/` vs `ingest/docs/`** — *this* file lives in top-level `docs/` (how the repo works). `ingest/docs/` is a **master home** for ingested project documentation (the website brief, ops flow, etc.). Don't confuse them.

---

## 0. The two tiers — raw vs. master

There are exactly two kinds of data in the repo, and they never mix:

| Tier | Where | What it is | Trust |
|---|---|---|---|
| **RAW** | `ingest/_inbox/` | What you just uploaded — logos, brand PDFs, mockups, briefs, copy, screenshots, WhatsApp images. | **Untrusted.** Could be a draft, eyeballed, or a duplicate. Claude may read it but must label facts as *unconfirmed* until promoted. |
| **MASTER** | `ingest/brand/`, `ingest/website/`, `ingest/docs/`, `ingest/misc/` | What Claude reviewed, dated, source-tagged, and filed under the right topic — the **golden record**. | **Trusted.** Whoever builds the site/brand reads *this*. |

You manage the RAW tier (this document). Claude manages the promotion to MASTER. The cleaner your raw upload, the more accurate the master — that's the whole game.

> FixIt already had a working topic-based ingest (brand / website / docs / misc) with a `PROCESSING-LOG.md`. This standard **keeps that taxonomy** and layers on the missing discipline: a naming convention, a per-batch `UPLOAD.md` manifest, the no-black-box rule, and the content-hash duplicate guard.

---

## 1. Naming convention (the most important rule)

Every file you drop is renamed to this pattern **before** it goes in:

```
YYYY-MM-DD__source__topic__doctype__vN.ext
```

- **`__` (double underscore) between fields. `-` (single hyphen) inside a field.** (`ops-flow`).
- **All lowercase. No spaces. Ever.**
- **Date = the day you got the file** (not today's date if it's an old file). ISO format `2026-05-14`.
- **`vN` only when a newer version of the *same* document arrives.** The 18-step ops flow that supersedes the 13-step one is `…__ops-flow__v2` — you don't invent a new fuzzy name.

| Field | Rule | Examples |
|---|---|---|
| `YYYY-MM-DD` | Capture date | `2026-06-12` |
| `source` | Who issued it | `fixit`, `designer`, `client`, `whatsapp` |
| `topic` | Which master home it belongs to | `brand`, `website`, `ops`, `general` |
| `doctype` | **One token from the fixed list below** | `logo`, `brief`, `mockup`, `ops-flow` |
| `vN` | Version, only on a revision | `v1`, `v2` |

**Fixed `doctype` vocabulary** — pick one, never invent a new one per file:
`brief` · `spec` · `deliverables` · `brand` · `logo` · `mockup` · `copy` · `ops-flow` · `screenshot` · `transcript` · `note` · `render`

> **`logo` / `render` are special** — reusable visual assets. They may carry an extra descriptive token (`logo-mono`, `logo-transparent`) and are captioned in their folder's README (see §4).

### Worked examples (FixIt)

```
2026-06-12__client__brand__logo__v1.jpeg              ← the official FixIt logo (JPEG only, so far)
2026-06-12__fixit__website__brief__v1.pdf             ← website requirements spec
2026-06-12__fixit__website__deliverables__v1.pdf      ← Phase 1 + Phase 2 scope
2026-06-12__designer__website__mockup-homepage-en__v1.jpeg
2026-05-05__whatsapp__ops__ops-flow__v2.jpeg          ← 18-step flow (supersedes the 13-step v1)
```

### Before / after

| ❌ Bad (the original WhatsApp names) | ✅ Good |
|---|---|
| `WhatsApp Image 2026-06-12 at 12.51.45 AM.jpeg` | `2026-06-12__client__brand__logo__v1.jpeg` |
| `website mockup 2.png` | `2026-06-12__designer__website__mockup-phases-ar__v1.png` |
| `WhatsApp Image 2026-05-05 at 19.05.56 (1).jpeg` | `2026-05-05__whatsapp__ops__ops-flow__v2.jpeg` |
| `Website Brief.pdf` (no date) | `2026-06-12__fixit__website__brief__v1.pdf` |

### Windows hard rules (the file will break otherwise)
- **Never** use any of these characters: `< > : " / \ | ? *` — also avoid `# & % ! @ { }`.
- **Never** end a name with a dot or a space. **Never** name a file `CON`, `PRN`, `AUX`, `NUL`, `COM1–9`, `LPT1–9`.
- **Keep the whole path under 260 characters** → shallow folders, names ~30–60 chars.

---

## 2. Folder taxonomy — one home per file

FixIt sorts by **topic** (not by source — this is a FixIt-specific binding; see §11). The topic folders are both the destination and the master tier:

```
ingest/
  _inbox/          ← DROP EVERYTHING NEW HERE FIRST. One UPLOAD.md per batch (see §3).
  brand/           ← brand guidelines, logos, colour palettes, fonts, voice & tone
  website/         ← website deliverables — designs, copy, page specs, mockups/
  docs/            ← written documentation, specs, requirements, reference (incl. docs/operations/)
  misc/            ← anything that doesn't fit the above (sorted later)
  processed/       ← archived originals after extraction (date-prefixed)
```

**The "it could go in two places" tie-breaker:** pick the topic that owns the *primary* use. A logo is `brand/`, not `website/`, even though the site uses it. **Never copy a file into two folders** — duplication is how stale versions survive; cross-reference in the topic README instead.

---

## 3. The manifest — `UPLOAD.md` (your 60-second provenance step)

The filename carries *source, date, type*. The manifest captures what a filename **can't**: **how current the info really is, how much you trust it, and who gave it to you.** This is the inbound complement to `PROCESSING-LOG.md` (which records, outbound, what Claude *did* with each batch).

Per upload session, drop one `UPLOAD.md` in `_inbox/` (copy [`_inbox/UPLOAD-TEMPLATE.md`](../ingest/_inbox/UPLOAD-TEMPLATE.md)) and add **one row per file**:

```markdown
# Upload — 2026-06-12  (by: Tarek)

| file | current as of | confidence | provided by | replaces / note |
|------|---------------|-----------|-------------|-----------------|
| 2026-06-12__client__brand__logo__v1.jpeg | 2026-06-12 | high | client, official | only a JPEG — vector still needed |
| 2026-06-12__fixit__website__brief__v1.pdf | 2026-06-12 | high | FixIt | the requirements spec |
| 2026-05-05__whatsapp__ops__ops-flow__v2.jpeg | 2026-05-05 | medium | WhatsApp photo | 18-step; supersedes 13-step v1 |
```

- **`current as of`** is the *truth-date* — often older than the capture date.
- **`confidence`** is `high` / `medium` / `low`. Crucial for FixIt brand work: a hex **eyeballed from the logo** is `low`/`medium` and must be flagged "needs confirming against a source file" — not stated as the brand colour.
- **`provided by`** is the human source.

**Laziest acceptable version:** one free-text sentence per file. The non-negotiable minimum is **one line of provenance per upload session.**

---

## 4. Non-text files — no black boxes

**If Claude can't read it as text, it isn't data yet.** Every scan, screenshot, and binary design file must arrive with a typed twin.

| You're uploading… | Do this before/at upload |
|---|---|
| Native PDF, `.docx`, `.md`, `.txt` | Upload as-is — directly readable. (PDFs of briefs/specs are also transcribed to MD so they're diff-able on GitHub.) |
| **Mockup / screenshot / image** | Add a one-line caption in `UPLOAD.md` ("Arabic Phase-1 homepage comp"). A bare image with no caption is rejected. |
| **Logo / brand asset** | Caption it in `brand/README.md` (file → what it shows → use for). Note the format you have vs. what's missing (vector? mono? transparent?). |
| **Ops-flow / handwritten diagram photo** | Transcribe the steps into a `…__ops-flow__vN.md` beside the image. The photo is the backup; the text is the data. |
| **Voice note / video** | Transcribe → save as `…__transcript__v1.md`. Audio/video alone is not accepted. |

---

## 5. Master-data discipline (how Claude keeps the golden record clean)

These are Claude's rules — listed so you know what "good" looks like:

1. **Single source of truth.** Each confirmed fact (a brand hex, a font, a Phase-1 scope item) lives in exactly one master file under its topic folder.
2. **Golden record.** One record per asset/spec. When a v2 mockup or an 18-step ops flow supersedes a v1, the **newer one wins** and the old is archived to `processed/`, not left to confuse.
3. **Source tags on every fact.** No brand hex or spec figure enters master without a tag: `Primary navy: #1B2A4A [src: 2026-06-20__client__brand__brand__v1.pdf, official]` — vs. `#1B2A4A (eyeballed from logo, UNCONFIRMED)`.
4. **Pending-confirmation flags instead of price-staleness.** FixIt has little time-decaying data; the real risk is **reconstructed/eyeballed facts masquerading as official.** Anything not from an official source is labelled `UNCONFIRMED — confirm against source file` and is never presented as settled.
5. **`UNKNOWN` beats a guess.** If a fact isn't in a sourced file, the master says `UNKNOWN — confirm with the client`.
6. **Source precedence decides conflicts** (ladder below), *before* recency.
7. **Duplicate guard — runs on EVERY upload, all file types.** Before any file is filed, `bash ingest/dedup-check.sh` hashes it by content (MD5) and **refuses byte-identical re-uploads** — documents, images, videos, text alike. Filenames are ignored (WhatsApp's `(1)/(2)` suffixes and re-downloads lie); only content counts. Exits non-zero so a re-upload never gets re-ingested.

### Source precedence ladder — official source beats reconstruction

When two sources state a different brand hex, font, or spec for the same thing, the **higher tier wins** — *before* the newest-wins rule:

| Tier | Source | Why it ranks here | In the repo |
|---|---|---|---|
| **1 — Official source** ⭐ | The client's real brand-guidelines file, a vector logo, the signed-off website brief, the client's own words. | This is the origin of truth. | `brand/`, `website/`, `docs/` — tagged "official". |
| **2 — Reconstructed / eyeballed** | A hex sampled off a JPEG logo, a font guessed by eye, a spec inferred from a mockup. | Useful as a placeholder, but it is a *reconstruction* — it can be wrong. | Tagged `UNCONFIRMED` in master (e.g. today's `brand-guidelines.md`). |
| **3 — Memory / second-hand** | Your recollection, a verbal note, an old screenshot. | Unverified, often approximate. | `low`-confidence notes only. |

**The conflict rule:** a **Tier-1** official fact **overrides** a Tier-2 eyeballed one on the same item, even if the eyeballed version was filed earlier. When only Tier-2 exists (as with the current brand hexes), the master keeps the value but **flags it `UNCONFIRMED`** until the official file arrives.

> **Practical takeaway:** the moment the real vector logo and brand sheet arrive, drop them in `_inbox/` marked `high` confidence + "official" — Claude promotes them to Tier-1 and clears the `UNCONFIRMED` flags on the eyeballed hexes.

---

## 6. Confidence & freshness — the colour code

| | Meaning | Claude's behaviour |
|---|---|---|
| 🟢 **high** | From an official source, you trust it | States it plainly as a sourced fact |
| 🟡 **medium** | Plausible but reconstructed (eyeballed hex, inferred spec) | Uses it, flags "UNCONFIRMED — confirm against source" |
| 🔴 **low** | Memory, approximate, second-hand | Treats as a placeholder only |
| ⚫ **superseded** | A newer version replaced it | Archived to `processed/`; not presented as current |

---

## 7. Pre-upload checklist (run this every time)

1. ☐ **Renamed** to `YYYY-MM-DD__source__topic__doctype__vN.ext` — lowercase, no spaces, no `< > : " / \ | ? *`.
2. ☐ **Date = when you got it** (four-digit year).
3. ☐ **Doctype** picked from the fixed list (§1).
4. ☐ **One file = one home;** a revision gets `v2`, not a new name.
5. ☐ **Non-text? Converted** — scan→OCR, ops-diagram→transcribed steps, mockup/logo→caption.
6. ☐ **No black-box media** — nothing without its text twin or caption.
7. ☐ **`UPLOAD.md` filled** — one row per file: current-as-of, confidence, provided-by.
8. ☐ **Eyeballed vs official flagged** — mark reconstructed brand facts `medium`/`low`.
9. ☐ **Everything in `_inbox/`** — not loose in `ingest/`.

Then tell Claude: **"process the inbox."**

### Definition of done — a clean upload is one where…
- every file follows the naming pattern, with legal characters and a path < 260 chars;
- no media file lacks a transcript or caption;
- `UPLOAD.md` has current-as-of, confidence, and provided-by for each file;
- reconstructed/eyeballed facts are marked, not passed off as official;
- no duplicate of an existing file under a new name — revisions are versioned;
- each file has exactly one topic home.

---

## 8. What Claude does when you say "process the inbox"

1. Runs the duplicate guard (`ingest/dedup-check.sh`) — byte-identical re-uploads are skipped.
2. Reads every file in `_inbox/` + its `UPLOAD.md`.
3. Files each into its topic home (`brand/`, `website/`, `docs/`, `misc/`), transcribing PDFs/diagrams to MD and **source-tagging every extracted fact** (official vs UNCONFIRMED).
4. **Appends a batch entry to `ingest/PROCESSING-LOG.md`** (source file → action → destination → open items) — the existing FixIt convention, kept.
5. Moves processed originals into `ingest/processed/` (date-prefixed) and marks them done in `UPLOAD.md`.
6. Reports: what was filed, what was superseded, what's still `UNKNOWN`/`UNCONFIRMED`.

---

## 9. Roles — who owns what

| Role | Owns |
|---|---|
| **Whoever uploads** (Tarek / the team) | §1 naming, §2 placement, §3 manifest, §4 transcripts, §7 checklist. The RAW tier is yours. |
| **Claude** | §5 master discipline, §8 processing, source-tagging, `PROCESSING-LOG.md`. The MASTER tier is Claude's. |

---

## 10. Recommended automation (optional, install later)

- **`/process-inbox` skill** — packages §8 as a named routine, auto-offered when `_inbox/` has files.
- **Filename-lint hook** — flags names that break §1 (spaces, forbidden chars, missing date, unknown doctype) before processing.

---

## 11. Project bindings (FixIt)

The standard is portable. Only this table is FixIt-specific:

| Binding | FixIt value |
|---|---|
| Master homes | `ingest/brand/`, `ingest/website/`, `ingest/docs/` (incl. `docs/operations/`), `ingest/misc/` |
| Taxonomy | **topic-first** (`brand` / `website` / `docs` / `misc`), not source-first |
| `source` slugs | `fixit`, `client`, `designer`, `whatsapp` |
| Canonical entity | **deliverable / asset** (a brand asset, a spec, a mockup; later: a technician profile) |
| Freshness model | **supersede-on-revision** + **`UNCONFIRMED` flags** for eyeballed/reconstructed facts (no price-staleness clock) |
| Currency | EGP (rarely relevant — FixIt's model is a 15–20% commission, not a price book) |
| Batch record | `ingest/PROCESSING-LOG.md` (outbound) complements `_inbox/UPLOAD.md` (inbound) |
| Isolation | FixIt lives on its **own GitHub account** — never reference or push to the Loop/Kanz repos |

---

*Companion: the blank manifest is [`../ingest/_inbox/UPLOAD-TEMPLATE.md`](../ingest/_inbox/UPLOAD-TEMPLATE.md). The same standard runs on the Loop and Kanz projects with their own bindings — kept in separate repos, never mixed.*
