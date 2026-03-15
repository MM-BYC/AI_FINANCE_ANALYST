#!/usr/bin/env bash
set -euo pipefail

bash .devcontainer/ensure-uv.sh

# Keep repo up to date on start (skip if there are local changes)
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if [[ -z "$(git status --porcelain)" ]]; then
    if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
      git pull --ff-only || echo "Auto-pull skipped (non-fast-forward)."
    else
      echo "Auto-pull skipped (no upstream branch configured)."
    fi
  else
    echo "Auto-pull skipped (working tree not clean)."
  fi
fi
