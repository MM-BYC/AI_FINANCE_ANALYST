#!/usr/bin/env bash
set -euo pipefail

bash .devcontainer/ensure-uv.sh

# Force-refresh repo on every start (discarding local changes).
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)"
  upstream="$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo origin/${branch})"
  echo "Refreshing workspace from ${upstream} (discarding local changes)..."
  git fetch origin
  git reset --hard "${upstream}"
  git clean -fd
fi
