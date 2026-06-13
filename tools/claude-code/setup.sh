#!/bin/bash
# Installs Claude Code (the `claude` terminal agent) on macOS / Linux.
# Run once after pulling the repo:
#   bash tools/claude-code/setup.sh
# Safe to re-run; it skips install if `claude` is already present.
set -e

echo "== Claude Code setup =="

if command -v claude >/dev/null 2>&1; then
  echo "claude is already installed at: $(command -v claude)"
else
  echo "Installing Claude Code via the official installer..."
  curl -fsSL https://claude.ai/install.sh | bash
fi

# jq powers the optional status bar (tools/statusline).
if ! command -v jq >/dev/null 2>&1; then
  echo "Tip: install jq for the status bar  ->  brew install jq"
fi

echo ""
echo "Next steps:"
echo "  1. Open a new terminal tab so 'claude' is on your PATH (check: which claude)."
echo "  2. Type:  claude"
echo "  3. On first run, sign in via the browser prompt - you need a Claude"
echo "     Pro/Max subscription (claude.com/pricing) or a Console account"
echo "     (console.anthropic.com). The binary alone can't run without auth."
echo ""
echo "Optional: add the status bar - see tools/statusline/README.md"
