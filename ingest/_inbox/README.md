# _inbox — Drop zone

**Put raw, unsorted files here.** Anything goes: brand guidelines, logos, website mockups, copy docs, PDFs, spreadsheets, screenshots, voice notes, half-finished thoughts.

When a review pass runs, files here get read, checked, sorted into the right topic folder (`../brand/`, `../website/`, `../docs/`, `../misc/`), and logged in [`../PROCESSING-LOG.md`](../PROCESSING-LOG.md).

This folder should be **empty (or nearly so) after each pass** — if something is sitting here, it hasn't been processed yet.

> **Two light steps before you dump** (per the [Data Ingestion Standard](../../docs/data-ingestion-standard.md)):
> 1. **Rename** each file to `YYYY-MM-DD__source__topic__doctype__vN.ext` (lowercase, no spaces).
> 2. **Copy [`UPLOAD-TEMPLATE.md`](./UPLOAD-TEMPLATE.md) → `UPLOAD.md`** and add one row per file (current-as-of, confidence, provided-by). Mark eyeballed brand facts `medium`/`low`.
>
> Then tell Claude **"process the inbox."** If you're in a hurry, dump anyway with one sentence of provenance — but the rename + manifest is what keeps the master data trustworthy.
