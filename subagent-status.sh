#!/usr/bin/env bash
set -euo pipefail

echo "=== Sub-agent sessions (last 10) ==="
openclaw sessions list --kinds agent --limit 10 --message-limit 3 || echo "(sessions list failed)"

echo
if [ -n "${1-}" ]; then
  echo "=== History for session: $1 ==="
  openclaw sessions history --session "$1" --limit 50 --include-tools || echo "(history failed)"
else
  echo "(Pass a sessionKey to see full history, e.g.:)"
  echo "  ./subagent-status.sh agent:main:openclaw-meta-research"
fi
