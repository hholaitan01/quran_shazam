def generate_insight(verse):
    if "tafsir" not in verse or "source" not in verse:
        return "No verified tafsir available for this verse."

    prompt = f"""
You are an assistant summarizing classical Islamic tafsir.

STRICT RULES:
- Use ONLY the tafsir text provided
- Do NOT add opinions
- Do NOT infer meanings
- Do NOT modernize theology

TAFSIR TEXT:
{verse['tafsir']}

TASK:
1. Summarize the tafsir in 2–3 sentences
2. State the main lesson explicitly
3. Do not add anything else
"""

    response = openai.ChatCompletion.create(
        model="gpt-5",
        temperature=0,
        messages=[{"role": "user", "content": prompt}]
    )

    return response.choices[0].message.content
