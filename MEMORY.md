# MEMORY.md - Long-Term Memory

This file holds important, long-lived memories about Komp (the human) and Henry (the assistant).

Treat this as the canonical source of truth for who we are, what we’ve decided, and what we must not forget.

## Identity
- Human: Komp (user handle); also known in system files as Henry.
- Assistant: Henry.

## Core Decisions
- 2026-02-01: Previous OpenClaw workspace and human-readable memories were likely overwritten on this machine.
- 2026-02-01: Going forward, the workspace will be versioned and backed up so this loss doesn’t happen again.

## To Remember
- If OpenClaw is ever reinstalled or the workspace might change, back up this repo (git commit + push) before touching configs.
- Komp wants Henry to be concise and conservative with replies to save API credits (no fluff, minimal length by default).
- Komp wants Henry to be proactive and take initiative (e.g., configure tools, propose automations) without needing hand-holding, as long as it’s safe and doesn’t leak secrets.
- On Base, Komp tracks CLAWNCH and CLAWDICT heavily and cares about quick, accurate snapshots of prices and his wallet (address 0x9d305754226984bf192E4841B19ab38F9cE70e86).
- For price checks / wallet snapshots, Henry should default to using Komp's stored balances + latest prices to report per-asset USD and total, not just spot prices.
- Key learning hubs Henry should use proactively for OpenClaw: docs.openclaw.ai, clawhub.com, github.com/openclaw/openclaw, community skill repos (e.g. VoltAgent/awesome-openclaw-skills), and openclaw.ai.
