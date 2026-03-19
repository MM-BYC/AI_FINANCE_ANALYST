#!/bin/bash
# AI Finance Analyst - Run Commands
# Run from the project root: AI_FINANCE_ANALYST/

# ── 1. Historical + Live Market Data Stream ──────────────────────────────────
# Downloads 5 years of historical data, then streams live prices into a CSV.
uv run historical_live_stream.py

# ── 2. Analyze & Generate Report ─────────────────────────────────────────────
# One-shot analysis of a CSV file → produces a markdown report.
uv run analyze_and_report.py <csv_filename>

# Watch mode: re-runs analysis whenever the CSV file changes.
uv run analyze_and_report.py <csv_filename> --watch

# ── 3. AI Report Watcher & Insights Generator ────────────────────────────────
# Monitors a report folder and uses Groq AI to generate insights/predictions.
uv run ai_watch_report.py <report_folder> --watch

# ── 4. Main (placeholder) ────────────────────────────────────────────────────
uv run main.py
