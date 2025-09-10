#!/usr/bin/env bash
set -euo pipefail

# Always run from repo root
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$ROOT_DIR"

mkdir -p log

# Keep only one latest log for convenience
rm -f log/flutter_app_*.log log/flutter_app.log || true

# Optional: list existing profiles for context (do not delete silently here)
echo "Existing profiles:"
find "$HOME/Library/Application Support/com.follow.clash/profiles" -name '*.yaml' || true

flutter clean

# Stream output to a single file and terminal in real-time
flutter run --release -d macos 2>&1 | tee "log/flutter_app.log"

