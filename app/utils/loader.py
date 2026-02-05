import json
import faiss

def load_quran_text():
    with open("app/data/quran.json", "r", encoding="utf-8") as f:
        return json.load(f)

def get_verse_data(surah, ayah):
    quran = load_quran_text()
    for v in quran:
        if v["surah"] == surah and v["ayah"] == ayah:
            return v
    return None

def load_index():
    return faiss.read_index("app/vectorstore/quran.faiss")
