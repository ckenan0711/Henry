---
name: wallet-snapshot
description: "Snapshot Komp's Base wallet (ETH, CLAWNCH, CLAWDICT) with USD values using Dexscreener."
---

# wallet-snapshot Skill

This skill runs a one-shot wallet snapshot for Komp's Base wallet:

- Address: `0x9d305754226984bf192E4841B19ab38F9cE70e86`
- Tokens:
  - ETH
  - CLAWNCH (Base)
  - CLAWDICT (Base)

It uses:

- Dexscreener API for USD prices (Base pairs)
- A simple shell script `wallet_snapshot.sh` in the workspace

## Implementation

The agent should call a shell command equivalent to:

```bash
cd ~/.openclaw/workspace
./wallet_snapshot.sh
```

and return the text output directly to the user.

## Notes

- Balances are currently hard-coded based on Komp's holdings.
- Extend later to read balances from a config file or explorer API if needed.
