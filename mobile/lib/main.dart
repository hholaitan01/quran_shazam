import 'package:flutter/material.dart';
import 'record.dart';
import 'theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(QuranShazam());
}

class QuranShazam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran Shazam',
      home: RecordScreen(),
    );
  }
}
void main() {
  runApp(const QuranShazamApp());
}

class QuranShazamApp extends StatelessWidget {
  const QuranShazamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran Shazam',
      theme: appTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}