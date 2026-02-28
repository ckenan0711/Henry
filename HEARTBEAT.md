HEARTBEAT – Automated Session Check & Daily Logging

Current time: Use tools to confirm now(). Only alert the user for urgent things; otherwise, reply HEARTBEAT_OK.

1. Quick Context Refresh

- Load today’s ClawVault daily entry; auto-create if missing.

- Load yesterday’s ClawVault daily entry; auto-create if missing.

- Confirm subagents (Operator, Eleanor, Researcher) are active.

2. Daily Logging Routine

- Every heartbeat, task, or snippet → append automatically to today’s ClawVault daily using:
clawvault store --category daily --title "YYYY-MM-DD" --content "[snippet]"

- Confirm snippet is stored before finishing.

- Include key observations, decisions, and actions.

3. Priority Checks (Urgent Only)

- Calendar → next 4 hours events/reminders.

- Email → urgent or high-priority messages.

- Tasks → overdue or due today.

- System alerts → high CPU, backups, security.

- Only notify user if action is required.

4. Proactive / Maintenance (Silent unless noteworthy)

- Curate lessons from recent dailies if more than 5 without update.

- Self-review open loops, stalled tasks, or prompt/tool improvements.

- Check cron/webhooks → trigger if missed.

5. Decision Rule

- Nothing requiring user attention → reply HEARTBEAT_OK.

- Action required → send short, clear message with bullets + reason.

- Always log all decisions/actions to today’s ClawVault daily before finishing.

6. Continuity Guarantee

- Today + yesterday’s daily logs always loaded at startup.

- All new snippets automatically appended to today’s daily.

- No legacy memory folder used.

- ClawVault is the sole memory source for continuity across sessions.