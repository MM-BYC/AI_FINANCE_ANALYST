#!/usr/bin/env bash
set -euo pipefail

context="${1:-start}"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)"
  upstream="$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo origin/${branch})"
  if [[ "$context" == "create" ]]; then
    echo "Pulling latest repo (fresh copy) during Codespace creation from ${upstream}..."
  else
    echo "Refreshing workspace from ${upstream} (discarding local changes)..."
  fi
  git fetch origin
  git reset --hard "${upstream}"
  git clean -fd
fi
