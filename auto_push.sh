#!/usr/bin/env bash
# Auto-commit and push changes to GitHub whenever files change.
# Usage: ./auto_push.sh
# Stop with: Ctrl+C

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
BRANCH="main"

# Paths to ignore (space-separated patterns)
IGNORE_PATTERNS=(".git" ".venv" "__pycache__" ".DS_Store" "output/" "reports/" ".pre-commit-cache" ".uv-cache")

echo "Watching $REPO_DIR for changes... (Ctrl+C to stop)"

fswatch -r -e "\.git/" -e "\.venv/" -e "__pycache__" -e "\.DS_Store" -e "/output/" -e "/reports/" -e "\.pre-commit-cache" -e "\.uv-cache" -0 "$REPO_DIR" | while IFS= read -r -d '' changed_file; do
    cd "$REPO_DIR" || exit 1

    # Check if there are any staged/unstaged changes
    if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
        continue
    fi

    echo "Change detected: $changed_file"

    # Stage all changes (respecting .gitignore)
    git add -A

    # Skip if nothing to commit
    if git diff --cached --quiet; then
        continue
    fi

    # Build a meaningful commit message from changed files
    CHANGED=$(git diff --cached --name-only | head -5 | tr '\n' ', ' | sed 's/,$//')
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    MSG="Auto-sync: $CHANGED [$TIMESTAMP]"

    git commit -m "$MSG" && git push origin "$BRANCH" && echo "Pushed: $MSG"
done
