#!/usr/bin/env bash
set -euo pipefail

export UV_CACHE_DIR="${UV_CACHE_DIR:-${PWD}/.uv-cache}"

if ! command -v uv >/dev/null 2>&1; then
  echo "uv not found; installing..."
  if command -v curl >/dev/null 2>&1; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
  elif command -v wget >/dev/null 2>&1; then
    wget -qO- https://astral.sh/uv/install.sh | sh
  else
    echo "Error: neither curl nor wget is available to install uv." >&2
    exit 1
  fi
  export PATH="$HOME/.local/bin:$PATH"
fi

uv sync
