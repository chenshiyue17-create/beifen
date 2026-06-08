#!/usr/bin/env bash
set -euo pipefail

echo "This backup repository has no long-running dev server."
echo "Gemini CLI path: $(command -v gemini || true)"
if command -v gemini >/dev/null 2>&1; then
  echo "Gemini CLI version: $(gemini --version)"
fi
