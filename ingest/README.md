# ingest/ — drop zone for raw FixIt files

**→ Before you drop anything, follow the [Data Ingestion Standard](../docs/data-ingestion-standard.md).**
This is the same standard the Loop and Kanz projects use, with FixIt-specific bindings (§11) — kept in
separate repos, never mixed.

## The 30-second version

1. **Rename** each file to `YYYY-MM-DD__source__topic__doctype__vN.ext` — lowercase, no spaces. (e.g. `2026-06-12__client__brand__logo__v1.jpeg`)
2. **Drop it in [`_inbox/`](./_inbox/)** — not loose here.
3. **Fill `UPLOAD.md`** in `_inbox/` (copy [`_inbox/UPLOAD-TEMPLATE.md`](./_inbox/UPLOAD-TEMPLATE.md)) — one row per file: *current-as-of, confidence, provided-by*. Mark eyeballed/reconstructed facts `medium`/`low`.
4. **No black boxes** — a scan / mockup / logo / ops-diagram must arrive with a typed transcript or caption.
5. **Tell Claude: "process the inbox."**

## What Claude does on "process the inbox"

0. Runs the duplicate guard (`ingest/dedup-check.sh`) — byte-identical re-uploads are skipped, never re-ingested.
1. Reads every file in `_inbox/` + its `UPLOAD.md`.
2. Files each into its **topic home** (transcribing PDFs/diagrams to MD, source-tagging every fact official vs UNCONFIRMED):
   - Brand guidelines, logos, palettes, fonts, voice → `brand/`
   - Website designs, copy, specs, mockups → `website/`
   - Written docs, requirements, ops flow → `docs/` (incl. `docs/operations/`)
   - Anything else → `misc/`
3. **Appends a batch entry to [`PROCESSING-LOG.md`](./PROCESSING-LOG.md)** — the running outbound record (source file → action → destination → open items). `UPLOAD.md` is the inbound complement.
4. Moves processed originals into `ingest/processed/` (date-prefixed) and marks them done in `UPLOAD.md`.

## Folder layout

```
ingest/
  _inbox/          ← drop everything new here first
  brand/           ← brand guidelines, logos, colours, fonts, voice & tone
  website/         ← website deliverables — designs, copy, specs, mockups/
  docs/            ← written documentation, specs, requirements (incl. operations/)
  misc/            ← anything that doesn't fit the above
  processed/       ← archived originals after extraction
```

Each topic subfolder has its own `README.md` describing what lives there. Nothing in `_inbox/` is "done"
until it's been filed, logged in `PROCESSING-LOG.md`, and its original archived to `processed/`.

## Conventions (updated to the standard)

- **Renaming is now required**, not optional — every file follows the §1 pattern before it's filed. (The old "keep original filenames where possible" rule is superseded; the original name is recorded in `UPLOAD.md` / the log.)
- **Eyeballed ≠ official.** A brand hex sampled off the JPEG logo is `UNCONFIRMED` until the real brand sheet arrives. See the precedence ladder in §5 of the standard.
- Large binaries (videos, raw design files) — check `.gitignore` before committing; link to external storage if too big for git.
- Don't delete originals until their processed version is confirmed in place.
