# create .env and .env.model 
#3 terminals (below one for each)
# uv run historical_live_stream.py
# uv run analyze_and_report.py output/market_data_YYYYMMDD_HHMMSS.csv --watch
#uv run ai_watch_report.py reports/ --watch

# install
uv add yfinance pandas numpy python-dotenv groq matplotlib openai requests
