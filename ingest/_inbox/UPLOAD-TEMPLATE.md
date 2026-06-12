<!--
  COPY this file to UPLOAD.md (in this _inbox/ folder) for each upload session, then fill the table.
  One row per file. Takes ~60 seconds. It captures the 3 things a filename can't:
  how current the info really is, how much you trust it, and who gave it to you.
  Full rules: ../../docs/data-ingestion-standard.md

  confidence = high | medium | low
    high   = from an OFFICIAL source (client brand sheet, signed brief, vector logo), you trust it
    medium = reconstructed / eyeballed (a hex sampled off the JPEG logo, a spec inferred from a mockup)
    low    = memory / approximate / second-hand
  current as of = the TRUTH date (often older than today)

  EYEBALLED ≠ OFFICIAL: brand hexes/fonts guessed from the logo are medium/low and get flagged
  UNCONFIRMED in master — never stated as the brand colour until the real brand file arrives.
-->

# Upload — YYYY-MM-DD  (by: YOUR NAME)

| file | current as of | confidence | provided by | replaces / note |
|------|---------------|-----------|-------------|-----------------|
| 2026-06-12__client__brand__logo__v1.jpeg | 2026-06-12 | high | client, official | only a JPEG — vector still needed |
| 2026-06-12__fixit__website__brief__v1.pdf | 2026-06-12 | high | FixIt | the requirements spec |
|  |  |  |  |  |
|  |  |  |  |  |

<!-- Then tell Claude: "process the inbox". -->
