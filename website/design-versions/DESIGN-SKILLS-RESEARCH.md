# Design / Anti-Slop Skills — Vetted Research (for the FixIt marketplace)

Researched via a background agent + web verification. Nothing was auto-installed; only
markdown-only, reputable, safe resources were used. Goal: reduce "AI slop" and keep all
4 design versions distinctive.

## Skills applied to the 4 versions
| Skill | Source | Safety | Used for |
|---|---|---|---|
| **taste-skill** | already installed `~/.claude/skills` (family: leonxlnx/taste-skill, MIT, ~41k★) | markdown-only, zero-script | Dial system + 80-pt anti-slop pre-flight across all 4 versions |
| **frontend-design** | already installed (family: anthropics/skills, official, ~149k★) | markdown-only | Brief-first design plan, signature element, anti-default palette/type |
| **minimalist-skill** | already installed | markdown-only | V4 editorial-minimal precision |
| **VoltAgent/awesome-claude-design** | github.com/VoltAgent/awesome-claude-design (MIT, ~2.6k★) | markdown-only reference packs | Direction references for V3 (cinematic dark) & V4 (editorial) |

## Verified SAFE raw skill URLs (markdown-only, no scripts)
- https://raw.githubusercontent.com/anthropics/skills/main/skills/frontend-design/SKILL.md
- https://raw.githubusercontent.com/leonxlnx/taste-skill/main/skills/taste-skill/SKILL.md

## AVOID (flagged by research)
- `Koomook/claude-frontend-skills` — ~14★, ships Node scripts, unproven. Skip.
- `obra/superpowers` — popular but a dev-methodology framework, not design taste; installs scripts.
- Any `npx skills add` CLI installer — copy the raw SKILL.md instead of running install code.

## Anti-slop guardrails enforced in every version
- No Inter-as-default; deliberate display+body pairings per version.
- No AI-purple-glow, no acid-green-on-black, no cream+serif+terracotta cliché.
- One accent locked per page; one corner-radius system; zero em-dashes.
- Full EN/AR with real RTL (logical CSS properties), reduced-motion respected.

## Brand note
No ingested brand kit exists for this marketplace. Loop's brand assets are intentionally
NOT used (different, isolated project). Original brand "FixIt / فيكس إت" created for this build.
