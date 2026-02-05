import json, faiss, numpy as np
from sentence_transformers import SentenceTransformer

with open("app/data/quran.json") as f:
    verses = json.load(f)

# Precomputed fingerprints per ayah
features = np.array([v["audio_fp"] for v in verses]).astype("float32")

index = faiss.IndexFlatL2(features.shape[1])
index.add(features)
faiss.write_index(index, "app/vectorstore/audio_index.faiss")
