import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic> result;
  const ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    if (result.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("Not confident enough to identify.")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Identified Verse")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Surah ${result['surah']} · Ayah ${result['ayah']}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    result['arabic'] ?? "",
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 22, height: 1.8),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Translation",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(result['translation'] ?? ""),
          const SizedBox(height: 20),
          const Divider(),
          const Text("AI Insight",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(result['ai_insight'] ?? ""),
        ],
      ),
    );
  }
}
const SizedBox(height: 24),
const Divider(),
const Text(
  "Sources",
  style: TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 8),

if (result['source'] != null && result['source'].isNotEmpty)
  Text(
    "Tafsir: ${result['source']['scholar']}\n"
    "Book: ${result['source']['book']}\n"
    "Vol/Page: ${result['source']['volume']} / ${result['source']['page']}",
    style: const TextStyle(fontSize: 14, color: Colors.black87),
  )
else
  const Text(
    "No verified tafsir source available.",
    style: TextStyle(color: Colors.redAccent),
  ),
