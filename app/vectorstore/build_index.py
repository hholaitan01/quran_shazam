import json
import faiss
import numpy as np
from sentence_transformers import SentenceTransformer

model = SentenceTransformer("all-MiniLM-L6-v2")

with open("app/data/quran.json") as f:
    verses = json.load(f)

embeddings = model.encode([v["arabic"] for v in verses])
index = faiss.IndexFlatL2(embeddings.shape[1])
index.add(np.array(embeddings).astype("float32"))

faiss.write_index(index, "app/vectorstore/quran.faiss")
