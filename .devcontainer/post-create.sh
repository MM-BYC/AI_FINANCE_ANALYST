#!/usr/bin/env bash
set -euo pipefail

bash .devcontainer/ensure-uv.sh
bash .devcontainer/refresh-repo.sh create
uv sync
