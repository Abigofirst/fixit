#!/usr/bin/env bash
# dedup-check.sh — the universal duplicate guard for EVERY upload.
# Applies to all file types: documents (pdf/docx/xlsx/pptx), images, videos, audio, text.
#
# WHAT IT DOES
#   Hashes every candidate file by CONTENT (MD5 — never by filename, because WhatsApp's
#   "(1)/(2)" suffixes and re-downloads lie) and compares it against:
#     1. everything already filed in the repo (the --against roots), and
#     2. the other files in the same batch (so a batch can't contain internal dupes).
#   Prints DUP (with the twin it matches) or NEW for each candidate.
#   Exit code: 0 = no duplicates, 1 = at least one duplicate (so a hook/routine can block).
#
# USAGE  (from the repo root)
#   bash ingest/dedup-check.sh                       # check ingest/_inbox against the default roots
#   bash ingest/dedup-check.sh <file-or-folder> ...  # check specific candidates
#   bash ingest/dedup-check.sh --against <root> ...   # add a root to compare against (repeatable)
#   bash ingest/dedup-check.sh --move-new <destdir>   # copy only the NEW (non-duplicate) files in
#
# The "process the inbox" routine ALWAYS runs this before any file is added to its home.

set -euo pipefail

# Defaults: candidates = the inbox; compare against everywhere filed originals already live.
CANDIDATES=()
ROOTS=("ingest/processed" "ingest/brand" "ingest/website" "ingest/docs" "ingest/misc")
MOVE_DEST=""

while [ $# -gt 0 ]; do
  case "$1" in
    --against) ROOTS+=("$2"); shift 2 ;;
    --move-new) MOVE_DEST="$2"; shift 2 ;;
    *) CANDIDATES+=("$1"); shift ;;
  esac
done
[ ${#CANDIDATES[@]} -eq 0 ] && CANDIDATES=("ingest/_inbox")

# Skip bookkeeping files — duplicate manifests/readmes/scripts are not "duplicate data".
skip() { case "$(basename "$1")" in
  UPLOAD*.md|INDEX.md|README.md|PROCESSING-LOG.md|_MOVED-LOG.md|*.sh|.gitkeep|.DS_Store) return 0 ;; *) return 1 ;; esac; }

hash_of() { md5sum < "$1" | cut -d' ' -f1; }   # read from stdin: immune to backslashes/spaces in the path (Windows)

# 1) Index existing filed content -> path
declare -A SEEN=()
for r in "${ROOTS[@]}"; do
  [ -d "$r" ] || continue
  while IFS= read -r -d '' f; do
    skip "$f" && continue
    SEEN["$(hash_of "$f")"]="$f"
  done < <(find "$r" -type f -print0)
done

# 2) Check each candidate (and guard against in-batch dupes)
dupes=0; news=0
for c in "${CANDIDATES[@]}"; do
  while IFS= read -r -d '' f; do
    skip "$f" && continue
    h="$(hash_of "$f")"
    if [ -n "${SEEN[$h]:-}" ]; then
      echo "DUP  $f  ==  ${SEEN[$h]}"
      dupes=$((dupes+1))
    else
      echo "NEW  $f"
      news=$((news+1))
      if [ -n "$MOVE_DEST" ]; then mkdir -p "$MOVE_DEST"; cp -- "$f" "$MOVE_DEST/"; fi
      SEEN["$h"]="$f"   # so later identical files in THIS batch are caught as dupes too
    fi
  done < <(find "$c" -type f -print0 2>/dev/null || true)
done

echo "----"
echo "summary: $news new, $dupes duplicate(s) across [${ROOTS[*]}]"
[ "$dupes" -eq 0 ]
