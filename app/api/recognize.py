from app.services.stt import transcribe_audio
from app.services.matcher import match_by_text

@router.post("/")
async def recognize(file: UploadFile):
    text = transcribe_audio(file)
    match = match_by_text(text)
    return {
        "transcription": text,
        **match
    }
