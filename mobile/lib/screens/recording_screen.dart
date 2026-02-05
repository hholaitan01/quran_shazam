import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import '../api.dart';
import 'result_screen.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen>
    with SingleTickerProviderStateMixin {
  final recorder = AudioRecorder();
  bool recording = false;
  late AnimationController pulse;

  @override
  void initState() {
    super.initState();
    pulse = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.9,
      upperBound: 1.1,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    pulse.dispose();
    super.dispose();
  }

  Future<void> toggleRecording() async {
    if (recording) {
      final path = await recorder.stop();
      setState(() => recording = false);

      if (path != null) {
        final result = await recognize(File(path));
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ResultScreen(result: result),
          ),
        );
      }
    } else {
      final dir = await getTemporaryDirectory();
      await recorder.start(
        const RecordConfig(encoder: AudioEncoder.wav),
        path: "${dir.path}/rec.wav",
      );
      setState(() => recording = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listening")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: pulse,
              child: Icon(
                Icons.mic,
                size: 80,
                color: recording ? Colors.redAccent : Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Text(recording ? "Listening…" : "Tap to start"),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: toggleRecording,
              child: Text(recording ? "Stop" : "Start"),
            )
          ],
        ),
      ),
    );
  }
}
