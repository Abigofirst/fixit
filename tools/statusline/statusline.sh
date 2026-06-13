#!/bin/bash
# Claude Code statusline — the info bar that renders below the Claude Code input box.
# Shows: model | effort/fast mode | context bar | token count | session time |
#        5h + 7d usage bars WITH reset countdowns.
#
# Data source: the JSON Claude Code pipes on stdin every render (model, context,
# cost, and — for Pro/Max accounts after the first API response — rate_limits
# with used_percentage AND resets_at). No API polling, no cache, no daemon: it
# is always exactly as accurate as Claude Code's own numbers.
#
# Auto-refresh: settings.json sets statusLine.refreshInterval so this re-runs on
# a timer even while idle, keeping the reset countdowns ticking.
#
# Responsive: reflows by $COLUMNS (which Claude Code exports) across three tiers
# so ALL information stays visible as the window shrinks — it never truncates.
#
# Requires: bash (built in on macOS/Linux; Git Bash on Windows) and jq
#   (macOS: brew install jq · Windows: winget install jqlang.jq).
# Shared via git so a `git pull` updates every teammate — see tools/statusline/.

JQ=$(command -v jq)
# Fallbacks: jq installed via winget may not be on the PATH that Claude Code's
# bash inherits (stale PATH right after install, no WindowsApps shim, etc.).
if [ -z "$JQ" ]; then
  LAD="$LOCALAPPDATA"
  command -v cygpath >/dev/null 2>&1 && LAD="$(cygpath "$LOCALAPPDATA" 2>/dev/null)"
  for CANDIDATE in \
    "$LAD/Microsoft/WindowsApps/jq.exe" \
    "$LAD"/Microsoft/WinGet/Links/jq.exe \
    "$LAD"/Microsoft/WinGet/Packages/jqlang.jq*/jq.exe ; do
    [ -x "$CANDIDATE" ] && JQ="$CANDIDATE" && break
  done
fi
if [ -z "$JQ" ]; then
  printf 'statusline: jq not found — winget install jqlang.jq\n'
  exit 0
fi

input=$(cat)

# Pull every field we need in one jq pass. resets_at are Unix epoch seconds.
PARSED=$(printf '%s' "$input" | "$JQ" -r '[
  (.model.display_name // .model.id // "?"),
  (.context_window.used_percentage // 0 | floor),
  (.cost.total_duration_ms // 0 | floor),
  (.rate_limits.five_hour.used_percentage // ""),
  (.rate_limits.seven_day.used_percentage // ""),
  (.rate_limits.five_hour.resets_at // ""),
  (.rate_limits.seven_day.resets_at // ""),
  (.context_window.total_input_tokens // 0 | floor),
  (.context_window.total_output_tokens // 0 | floor),
  (.effort.level // ""),
  (.fast_mode // false | tostring)
] | join("|")' 2>/dev/null)

IFS='|' read -r MODEL CTX_PCT DURATION_MS FIVE_H SEVEN_D FH_RESET SD_RESET IN_TOK OUT_TOK EFFORT FAST_MODE <<EOF
$PARSED
EOF

# --- terminal width (Claude Code exports COLUMNS before each run) ---
COLS=${COLUMNS:-100}
[ "$COLS" -gt 0 ] 2>/dev/null || COLS=100

# --- token total, human formatted ---
TOTAL_TOK=$((IN_TOK + OUT_TOK))
if [ "$TOTAL_TOK" -ge 1000000 ]; then
  TOK_FMT=$(echo "$TOTAL_TOK" | awk '{printf "%.1fM tok", $1/1000000}')
elif [ "$TOTAL_TOK" -ge 1000 ]; then
  TOK_FMT="$((TOTAL_TOK / 1000))k tok"
else
  TOK_FMT="${TOTAL_TOK} tok"
fi

DURATION_SEC=$((DURATION_MS / 1000))
MINS=$((DURATION_SEC / 60))
SECS=$((DURATION_SEC % 60))

# ANSI 256-color codes
RESET=$'\033[0m'
BOLD=$'\033[1m'
DIM=$'\033[2m'
C_GREEN=$'\033[38;5;46m'
C_LGREEN=$'\033[38;5;82m'
C_YELLOW=$'\033[38;5;226m'
C_ORANGE=$'\033[38;5;208m'
C_RED=$'\033[38;5;196m'
C_GREY=$'\033[38;5;240m'
C_CYAN=$'\033[38;5;51m'

# Color ramp by utilization %. Edit these thresholds to retune the green→red fade.
pct_color() {
  local p=$1
  if   [ "$p" -lt 50 ]; then printf '%s' "$C_GREEN"
  elif [ "$p" -lt 70 ]; then printf '%s' "$C_LGREEN"
  elif [ "$p" -lt 85 ]; then printf '%s' "$C_YELLOW"
  elif [ "$p" -lt 95 ]; then printf '%s' "$C_ORANGE"
  else                       printf '%s' "$C_RED"
  fi
}

repeat_char() {
  local ch=$1 n=$2 out="" i=0
  while [ "$i" -lt "$n" ]; do out="${out}${ch}"; i=$((i + 1)); done
  printf '%s' "$out"
}

cbar() {
  local pct=$1 w=${2:-10}
  [ "$pct" -gt 100 ] && pct=100
  [ "$pct" -lt 0 ]   && pct=0
  local filled=$((pct * w / 100))
  local empty=$((w - filled))
  local col; col=$(pct_color "$pct")
  printf '%s%s%s%s%s%s' "$col" "$(repeat_char "█" "$filled")" "$RESET" "$C_GREY" "$(repeat_char "·" "$empty")" "$RESET"
}

# Countdown to a reset epoch: "5d3h" / "2h14m" / "47m" / "now".
fmt_eta() {
  local target=${1%%.*} now diff d h m   # drop any fractional part
  case "$target" in ''|*[!0-9]*) printf '—'; return ;; esac  # empty/non-numeric → absent
  [ "$target" -le 0 ] && { printf '—'; return; }
  now=$(date +%s)
  diff=$((target - now))
  [ "$diff" -le 0 ] && { printf 'now'; return; }
  d=$((diff / 86400)); h=$(((diff % 86400) / 3600)); m=$(((diff % 3600) / 60))
  if   [ "$d" -gt 0 ]; then printf '%dd%dh' "$d" "$h"
  elif [ "$h" -gt 0 ]; then printf '%dh%dm' "$h" "$m"
  else                      printf '%dm' "$m"
  fi
}

# --- normalize percentages ---
CTX_PCT_INT=${CTX_PCT%.*}; [ -z "$CTX_PCT_INT" ] && CTX_PCT_INT=0
CTX_COL=$(pct_color "$CTX_PCT_INT")

HAVE_FH=0; HAVE_SD=0
if [ -n "$FIVE_H" ]; then
  FH_INT=$(printf '%.0f' "$FIVE_H" 2>/dev/null); FH_INT=${FH_INT:-0}
  FH_COL=$(pct_color "$FH_INT"); FH_ETA=$(fmt_eta "$FH_RESET"); HAVE_FH=1
fi
if [ -n "$SEVEN_D" ]; then
  SD_INT=$(printf '%.0f' "$SEVEN_D" 2>/dev/null); SD_INT=${SD_INT:-0}
  SD_COL=$(pct_color "$SD_INT"); SD_ETA=$(fmt_eta "$SD_RESET"); HAVE_SD=1
fi

# --- effort / fast-mode segment ---
EFFORT_SEG=""
if [ -n "$EFFORT" ]; then
  case "$EFFORT" in
    high)   EFF_COL=$C_ORANGE ;;
    medium) EFF_COL=$C_YELLOW ;;
    low)    EFF_COL=$C_LGREEN ;;
    *)      EFF_COL=$C_CYAN ;;
  esac
  EFFORT_SEG=" ${EFF_COL}◆ ${EFFORT}${RESET}"
fi
[ "$FAST_MODE" = "true" ] && EFFORT_SEG="${EFFORT_SEG} ${C_CYAN}⚡fast${RESET}"

SEP=" ${DIM}│${RESET} "
DOT=" ${DIM}·${RESET} "

# Segment builders at a given bar width.
ctx_seg() { printf 'ctx %s %s%s%%%s' "$(cbar "$CTX_PCT_INT" "$1")" "$CTX_COL" "$CTX_PCT_INT" "$RESET"; }
fh_seg()  { printf '%s5h%s %s %s%s%s%%%s %s⟳ %s%s' "$C_CYAN" "$RESET" "$(cbar "$FH_INT" "$1")" "$FH_COL" "$BOLD" "$FH_INT" "$RESET" "$DIM" "$FH_ETA" "$RESET"; }
sd_seg()  { printf '%s7d%s %s %s%s%s%%%s %s⟳ %s%s' "$C_CYAN" "$RESET" "$(cbar "$SD_INT" "$1")" "$SD_COL" "$BOLD" "$SD_INT" "$RESET" "$DIM" "$SD_ETA" "$RESET"; }

MODEL_SEG="${BOLD}${MODEL}${RESET}${EFFORT_SEG}"

# ── Layout tiers — all info stays visible; narrower widths reflow to more lines ──
if [ "$COLS" -ge 118 ]; then
  # Tier 1: single rich line.
  OUT="${MODEL_SEG}${SEP}$(ctx_seg 10)${SEP}${C_CYAN}${TOK_FMT}${RESET}${SEP}${MINS}m${SECS}s"
  [ "$HAVE_FH" -eq 1 ] && OUT="${OUT}${SEP}$(fh_seg 10)"
  [ "$HAVE_SD" -eq 1 ] && OUT="${OUT}${SEP}$(sd_seg 10)"
  printf '%s\n' "$OUT"

elif [ "$COLS" -ge 80 ]; then
  # Tier 2: two lines — meta on top, usage bars below.
  printf '%s\n' "${MODEL_SEG}${SEP}$(ctx_seg 10)${SEP}${C_CYAN}${TOK_FMT}${RESET}${SEP}${MINS}m${SECS}s"
  LINE2=""
  [ "$HAVE_FH" -eq 1 ] && LINE2="$(fh_seg 12)"
  [ "$HAVE_SD" -eq 1 ] && { [ -n "$LINE2" ] && LINE2="${LINE2}   "; LINE2="${LINE2}$(sd_seg 12)"; }
  [ -n "$LINE2" ] && printf '%s\n' "$LINE2"

else
  # Tier 3: stacked — one item per line, compact bars.
  printf '%s\n' "${MODEL_SEG}${DOT}$(ctx_seg 8)"
  printf '%s\n' "${C_CYAN}${TOK_FMT}${RESET}${DOT}${MINS}m${SECS}s"
  [ "$HAVE_FH" -eq 1 ] && printf '%s\n' "$(fh_seg 8)"
  [ "$HAVE_SD" -eq 1 ] && printf '%s' "$(sd_seg 8)"
  echo
fi
