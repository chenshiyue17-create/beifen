#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_ID="${1:-clash-verge-rev}"

case "$REPO_ID" in
  clash-verge-rev)
    REPO_URL="https://github.com/clash-verge-rev/clash-verge-rev.git"
    DEFAULT_BRANCH="dev"
    ;;
  *)
    echo "Unknown repository id: $REPO_ID" >&2
    echo "Known ids: clash-verge-rev" >&2
    exit 1
    ;;
esac

WORK_DIR="$ROOT_DIR/output/repo-mirrors/$REPO_ID.git"
BUNDLE_DIR="$ROOT_DIR/output/repo-bundles"
BUNDLE_PATH="$BUNDLE_DIR/$REPO_ID.bundle"
LOG_DIR="$ROOT_DIR/logs"
LOG_PATH="$LOG_DIR/$REPO_ID-backup.log"

mkdir -p "$BUNDLE_DIR" "$LOG_DIR" "$(dirname "$WORK_DIR")"

{
  echo "Repository: $REPO_URL"
  echo "Started: $(date -u +%Y-%m-%dT%H:%M:%SZ)"

  if [ -d "$WORK_DIR" ]; then
    git -C "$WORK_DIR" remote update --prune
  else
    git clone --mirror "$REPO_URL" "$WORK_DIR"
  fi

  git -C "$WORK_DIR" bundle create "$BUNDLE_PATH" --all
  git -C "$WORK_DIR" rev-parse "refs/heads/$DEFAULT_BRANCH"

  echo "Bundle: $BUNDLE_PATH"
  echo "Finished: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
} | tee "$LOG_PATH"
