import os

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

if not OPENAI_API_KEY:
    raise RuntimeError("OPENAI_API_KEY is not set")
EMBEDDING_MODEL = "sentence-transformers/all-MiniLM-L6-v2"
