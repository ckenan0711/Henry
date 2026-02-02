#!/usr/bin/env bash
set -euo pipefail

# Simple Base wallet snapshot for Komp
# Uses Dexscreener for prices and known balances.

ADDRESS="0x9d305754226984bf192E4841B19ab38F9cE70e86"

# Stored balances (Base)
ETH_BAL="0.012940587414019201"
CLAWNCH_BAL="3160097.8880998013"
CLAWDICT_BAL="47409860"

# Fetch prices from Dexscreener (Base pairs)
CLAWNCH_JSON=$(curl -s "https://api.dexscreener.com/latest/dex/search?q=CLAWNCH")
CLAWDICT_JSON=$(curl -s "https://api.dexscreener.com/latest/dex/search?q=Clawdict")

CLAWNCH_PRICE=$(printf '%s' "$CLAWNCH_JSON" | jq -r '.pairs[] | select(.chainId=="base") | .priceUsd' | head -n1)
CLAWDICT_PRICE=$(printf '%s' "$CLAWDICT_JSON" | jq -r '.pairs[] | select(.chainId=="base") | .priceUsd' | head -n1)

# ETH price from Basescan page (simple scrape); fallback if it fails
ETH_PRICE=$(curl -s "https://basescan.org/address/$ADDRESS" | grep -Eo '\$[0-9]+,[0-9]+\.[0-9]+' | head -n1 | tr -d '$,' || true)
if [ -z "$ETH_PRICE" ]; then
  ETH_PRICE="2371.05"  # fallback if scrape fails
fi

eth_usd=$(python - <<EOF
eth=float("$ETH_BAL"); p=float("$ETH_PRICE"); print(round(eth*p,2))
EOF
)

clawnch_usd=$(python - <<EOF
bal=float("$CLAWNCH_BAL"); p=float("$CLAWNCH_PRICE"); print(round(bal*p,2))
EOF
)

clawdict_usd=$(python - <<EOF
bal=float("$CLAWDICT_BAL"); p=float("$CLAWDICT_PRICE"); print(round(bal*p,2))
EOF
)

total_usd=$(python - <<EOF
eth=float("$eth_usd"); c1=float("$clawnch_usd"); c2=float("$clawdict_usd"); print(round(eth+c1+c2,2))
EOF
)

echo "Wallet snapshot (Base, approx):"
echo "- ETH:      $ETH_BAL ≈ \$${eth_usd}"
echo "- CLAWNCH:  $CLAWNCH_BAL @ \$${CLAWNCH_PRICE} ≈ \$${clawnch_usd}"
echo "- CLAWDICT: $CLAWDICT_BAL @ \$${CLAWDICT_PRICE} ≈ \$${clawdict_usd}"
echo "Total ≈ \$${total_usd}"
