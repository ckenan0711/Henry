# AGENTS.md – Core Workspace Instructions

## Startup (ClawVault + Daily Logs)

1. Read `SOUL.md` → defines agent identity
2. Read `USER.md` → defines human context
3. Read `AGENTS.md` → orchestration rules and delegation protocols
4. Read `TOOLS.md` → environment, skills, device notes
5. Read `SYSTEM_CORE.md` → hierarchy, health metrics, workspace rules
6. **Load ClawVault recursively** → primary memory
7. Ensure “daily” entries exist in ClawVault for:
   - Today → auto-create if missing
   - Yesterday → auto-create if missing
8. Verify subagents (Operator, Eleanor, Researcher) are ready
9. Confirm readiness → output: `SESSION_READY: ClawVault + daily logs loaded`

## Decision-Making

- **All task decisions** must use `AGENTS_MANAGER.md`
- Manager generates explicit, atomic steps for Operator execution
- Main agent **never modifies files directly**
- All memory writes → ClawVault only
- Never reference deleted legacy memory files

## Memory Maintenance (Heartbeats / Periodic)

Periodically:

1. Read recent ClawVault daily/meta files
2. Identify significant events, lessons, or insights
3. Delegate updates to Operator → write to ClawVault
4. Remove outdated info from ClawVault if no longer relevant
5. Pre-reply routine: Every heartbeat or task snippet automatically appended to today’s ClawVault daily entry:
   ```text
   clawvault store --category daily --title "YYYY-MM-DD" --content "[snippet]"

## File Access Guidelines

- Safe: reading files, organizing, checking project status, updating documentation
- Forbidden: direct writes to deleted legacy memory, sending data externally without Operator

## Pre-Reply Routine – Automatic ClawVault Logging

Before sending any reply, follow these steps:

1. Scan for Key Snippets

- Detect all important items in the reply: people, decisions, goals, tasks, lessons, patterns, and commitments.

- Extract concise, actionable snippets from the reply content.

2. Store to ClawVault

- Execute: clawvault store --category daily --title "YYYY-MM-DD" --content "[snippet]" for each snippet.

- Confirm each snippet is successfully logged before finalizing the reply.

- Include timestamp and agent ID if needed for traceability.

3. Update Context

- Keep a temporary in-session copy of today’s daily for fast reference.

- Never read or write legacy MEMORY.md. ClawVault is the sole active memory.

4. Send Final Reply

- Only after all snippets are logged does the agent output its response.

- Ensures no insight, decision, or task is lost even if the session ends abruptly.

5. Optional Self-Review

- Scan logged snippets for: unclear instructions, unfinished tasks, or items to delegate.

- Queue these for the next heartbeat or manager delegation.

Guidelines:

- Keep snippets minimal and relevant — avoid bloated logs.

- Logging must be fast; in-memory queuing with batch flush is acceptable.

- Do not expose private content externally.

- Legacy memory folder is ignored; all writes go to ClawVault.

Startup Reminder: Execute this pre-reply routine before sending every response to ensure continuity and full session memory capture.
