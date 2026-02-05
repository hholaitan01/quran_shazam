from fastapi import FastAPI
from app.middleware import setup_cors
from app.api.recognize import router as recognize_router
from app.api.verse import router as verse_router

app = FastAPI(title="QuranShazam API")

setup_cors(app)

app.include_router(recognize_router, prefix="/recognize")
app.include_router(verse_router, prefix="/verse")

@app.get("/")
def health():
    return {"status": "QuranShazam backend running"}
