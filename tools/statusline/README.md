# Claude Code statusline

The info bar that renders **below the Claude Code input box** in the terminal.

It shows, in one responsive line (reflows to 2–3 lines on narrow windows):

- **Model** + effort level / `⚡fast` mode
- **Context bar** — how full the context window is, with a green→red color ramp
- **Token count** for the session
- **Session time**
- **5h** and **7d** usage bars (Pro/Max accounts) with live **reset countdowns**

No API polling, no daemon — it reads the JSON Claude Code pipes in on every
render, so the numbers are exactly as accurate as Claude Code's own.

## Requirements

- **Git Bash** (ships with [Git for Windows](https://git-scm.com/download/win))
- **jq** — `winget install jqlang.jq`

## Install

1. Copy the script to your Claude config dir:

   ```bash
   cp tools/statusline/statusline.sh ~/.claude/statusline.sh
   ```

2. Add this block to `~/.claude/settings.json` (merge it in — don't overwrite
   the file if it already has other keys):

   ```json
   {
     "statusLine": {
       "type": "command",
       "command": "~/.claude/statusline.sh",
       "refreshInterval": 60
     }
   }
   ```

3. Restart Claude Code. The bar appears under the input box.

`refreshInterval` (seconds) keeps the reset countdowns ticking while idle.

## Updating

It's shared via git on purpose — `git pull`, then re-run step 1 to copy the
latest version over your `~/.claude/statusline.sh`.

## Troubleshooting

- **`statusline: jq not found`** — install jq (`winget install jqlang.jq`) and
  restart your terminal so it lands on PATH. The script also probes the usual
  winget install locations as a fallback.
- **No 5h/7d bars** — those only appear on Pro/Max accounts and only after the
  first API response of the session populates the rate-limit data.
