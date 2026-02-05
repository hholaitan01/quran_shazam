import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quran Shazam")),
      body: Center(child: Text("Tap to recognize Quran recitation")),
    );
  }
}
