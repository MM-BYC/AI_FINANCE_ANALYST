#!/usr/bin/env bash
set -euo pipefail

paths=()

if [[ -f devcontainer.json ]]; then
  paths+=("devcontainer.json")
fi

if [[ -d .devcontainer ]]; then
  while IFS= read -r -d '' file; do
    paths+=("$file")
  done < <(find .devcontainer -type f -print0)
fi

if [[ ${#paths[@]} -eq 0 ]]; then
  exit 0
fi

if command -v rg >/dev/null 2>&1; then
  matches=$(rg -n -i "claude[[:space:]_-]*code" "${paths[@]}" || true)
else
  matches=$(grep -n -i -E "claude[[:space:]_-]*code" "${paths[@]}" 2>/dev/null || true)
fi

if [[ -n "$matches" ]]; then
  echo "Claude Code references are not allowed in devcontainer files."
  echo "$matches"
  exit 1
fi
