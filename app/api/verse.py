from fastapi import APIRouter
from app.services.ai_insights import generate_insight
from app.utils.loader import get_verse_data

router = APIRouter()

@router.get("/{surah}/{ayah}")
def verse_detail(surah: int, ayah: int):
    verse = get_verse_data(surah, ayah)

    return {
        "arabic": verse["arabic"],
        "translation": verse["translation"],
        "tafsir": verse.get("tafsir", ""),
        "source": verse.get("source", {}),
        "ai_insight": generate_insight(verse)
    }
