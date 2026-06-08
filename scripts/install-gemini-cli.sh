#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARBALL="$ROOT_DIR/vendor/google-gemini-cli-0.45.2.tgz"
PACKAGE="@google/gemini-cli@0.45.2"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required. Install Node.js 20 or newer." >&2
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "npm is required." >&2
  exit 1
fi

NODE_MAJOR="$(node -p "Number(process.versions.node.split('.')[0])")"
if [ "$NODE_MAJOR" -lt 20 ]; then
  echo "Node.js >=20 is required. Current version: $(node --version)" >&2
  exit 1
fi

if [ -f "$TARBALL" ]; then
  npm install -g "$TARBALL"
else
  npm install -g "$PACKAGE"
fi

gemini --version
