def verify_sequence(candidates):
    candidates.sort(key=lambda x: (x["surah"], x["ayah"]))
    for i in range(len(candidates)-1):
        if candidates[i+1]["ayah"] == candidates[i]["ayah"] + 1:
            return candidates[i]
    return candidates[0]
