#!/usr/bin/env bash
set -euo pipefail

EXPECTED_VERSION="0.45.2"

command -v node >/dev/null
command -v npm >/dev/null
command -v gemini >/dev/null

NODE_MAJOR="$(node -p "Number(process.versions.node.split('.')[0])")"
if [ "$NODE_MAJOR" -lt 20 ]; then
  echo "Node.js >=20 is required. Current version: $(node --version)" >&2
  exit 1
fi

ACTUAL_VERSION="$(gemini --version | tr -d '[:space:]')"
if [ "$ACTUAL_VERSION" != "$EXPECTED_VERSION" ]; then
  echo "Expected gemini $EXPECTED_VERSION, got $ACTUAL_VERSION" >&2
  exit 1
fi

echo "gemini $ACTUAL_VERSION is installed and available."
