import openai
import tempfile
import librosa

def transcribe_audio(upload_file):
    with tempfile.NamedTemporaryFile(delete=False, suffix=".wav") as tmp:
        tmp.write(upload_file.file.read())
        tmp_path = tmp.name

    transcript = openai.Audio.transcribe(
        model="whisper-1",
        file=open(tmp_path, "rb"),
        language="ar"
    )
    return transcript["text"]
def preprocess(file):
    y, sr = librosa.load(file, sr=16000)
    y = librosa.effects.trim(y)[0]
    y = librosa.util.normalize(y)
    return y, sr