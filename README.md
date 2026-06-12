# Fixit

> Hosted on a separate GitHub account, intentionally isolated from the Loop / Smetools-AI organization.

## Ingest workflow

Drop any working files — brand guidelines, website deliverables, logos, copy, notes — into [`ingest/_inbox/`](./ingest/_inbox/), **renamed** to `YYYY-MM-DD__source__topic__doctype__vN.ext` and with an `UPLOAD.md` manifest. They're then reviewed, checked, and organized into the right topic folder, with every batch recorded in [`ingest/PROCESSING-LOG.md`](./ingest/PROCESSING-LOG.md).

This follows the **[Data Ingestion Standard](./docs/data-ingestion-standard.md)** — the same standard the Loop and Kanz projects use, with FixIt-specific bindings (§11). FixIt stays on its own GitHub account, isolated from those repos. See [`ingest/README.md`](./ingest/README.md) for the 30-second version.
