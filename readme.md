# create .env and .env.model 
#3 terminals (below one for each)
# uv run historical_live_stream.py
# uv run analyze_and_report.py output/market_data_YYYYMMDD_HHMMSS.csv --watch
#uv run ai_watch_report.py reports/ --watch

# install
uv add yfinance pandas numpy python-dotenv groq matplotlib openai requests, Rainbow CSV

# Groq API key setup
- Codespaces: Repo Settings → Codespaces → Secrets → New secret
  - Name: GROQ_API_KEY
  - Value: your Groq API key
- Local dev: copy `.env.example` to `.env` and set `GROQ_API_KEY`

# Run in codespace:
- To run in codespace. select code-> codespace tab -> click +
- cmd + shift + P-> Type Run Task -> choose Run AI Finance suite
- See folder output/reports
- Note: If no `GROQ_API_KEY` is set, the AI watcher will exit with an error message.
- To End tasks.json: 
- To “end” a Codespace (stop it so it isn’t running/billing), use one of these:

From VS Code / web editor

Open Command Palette: Shift+Command+P
Run: Codespaces: Stop Current Codespace
From GitHub UI

Go to GitHub → Codespaces
Click the … menu on your Codespace → Stop codespace

[Screen PDF](docs/codespace.pdf)
