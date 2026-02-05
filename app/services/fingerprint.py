import librosa
import numpy as np

def fingerprint(y, sr):
    mfcc = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=40)
    chroma = librosa.feature.chroma_stft(y=y, sr=sr)
    contrast = librosa.feature.spectral_contrast(y=y, sr=sr)

    features = np.concatenate([
        mfcc.mean(axis=1),
        chroma.mean(axis=1),
        contrast.mean(axis=1)
    ])
    return features.astype("float32")
