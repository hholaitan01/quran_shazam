import faiss, numpy as np
from app.utils.loader import load_audio_index, load_quran
from app.services.embedding_service import embed

audio_index = load_audio_index()
quran = load_quran()

def match(audio_fp, transcript):
    # 1. Audio search
    D, I = audio_index.search(audio_fp.reshape(1, -1), 15)

    # 2. Text embedding search within candidates
    query_vec = embed(transcript)
    best = None
    best_score = -1

    for idx in I[0]:
        v = quran[idx]
        score = np.dot(query_vec, embed(v["arabic"]))
        if score > best_score:
            best_score = score
            best = v

    return {
        "surah": best["surah"],
        "ayah": best["ayah"],
        "confidence": float(best_score)
    }
