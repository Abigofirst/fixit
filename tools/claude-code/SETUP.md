# Install Claude Code (the `claude` terminal agent) — macOS

After you `git pull` this repo, run the setup below **once** to get the `claude`
command. Then typing `claude` in your terminal opens the agent.

> A `git pull` only updates files — it can't install software for you. You run
> the one command below once; after that Claude Code keeps itself updated.

## 1. Install Claude Code

**Easiest:** run the setup script (it installs Claude Code for you):

```bash
bash tools/claude-code/setup.sh
```

**Or** install directly with the official one-liner:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

(Homebrew alternative: `brew install --cask claude-code` — but then you update
it yourself with `brew upgrade claude-code`.)

This puts `claude` on your PATH automatically. Open a new terminal tab after it
finishes, then check with `which claude`.

## 2. Sign in (required — the binary alone won't run)

The first time you type `claude`, it opens a browser to authenticate. You need
**one** of these:

- A **Claude Pro or Max subscription** — https://claude.com/pricing  *(recommended)*
- A **Claude Console account** with credits — https://console.anthropic.com/

Credentials are saved locally and persist, so you only sign in once.

## 3. Launch it

```bash
claude
```

That's the agent. Run it from inside the `fixit` folder so it has the project
context.

## 4. (Optional) Turn on the status bar

Once `claude` runs, follow [`../statusline/README.md`](../statusline/README.md)
to add the info bar (model, context, token + usage meters) under the input box.
On macOS that just needs `jq` (`brew install jq`) — no Git Bash, that's a
Windows-only thing.

---

Official docs: https://code.claude.com/docs/en/quickstart
