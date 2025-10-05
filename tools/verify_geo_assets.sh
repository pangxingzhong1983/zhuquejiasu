#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT=$(cd "$(dirname "$0")/.." && pwd)
ASSETS_DIR="$REPO_ROOT/assets/data"
REQUIRED=("GeoIP.dat" "GeoSite.dat" "ASN.mmdb" "geoip.metadb")

echo "Verifying geo assets in: $ASSETS_DIR"

for f in "${REQUIRED[@]}"; do
  if [ ! -f "$ASSETS_DIR/$f" ]; then
    echo "ERROR: required geo file missing: $ASSETS_DIR/$f"
    exit 1
  fi
  if [ ! -s "$ASSETS_DIR/$f" ]; then
    echo "ERROR: required geo file is empty: $ASSETS_DIR/$f"
    exit 1
  fi
done

echo "All required geo assets are present and non-empty."

if [ -f "$ASSETS_DIR/geo_hashes.json" ]; then
  echo "Optional geo_hashes.json found; verifying checksums..."
  for f in "${REQUIRED[@]}"; do
    expected=$(jq -r --arg k "$f" '.[$k] // empty' "$ASSETS_DIR/geo_hashes.json")
    if [ -n "$expected" ]; then
      actual=$(sha256sum "$ASSETS_DIR/$f" | awk '{print $1}')
      if [ "$actual" != "$expected" ]; then
        echo "ERROR: checksum mismatch for $f: expected:$expected actual:$actual"
        exit 1
      fi
    fi
  done
  echo "Checksums OK."
fi

exit 0
