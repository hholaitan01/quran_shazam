import 'package:flutter/material.dart';

const primaryGreen = Color(0xFF0A3D2E);
const accentGold = Color(0xFFC9A24D);

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryGreen,
    primary: primaryGreen,
    secondary: accentGold,
    background: const Color(0xFFF8F9F8),
  ),
  scaffoldBackgroundColor: const Color(0xFFF8F9F8),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: primaryGreen,
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, height: 1.6),
  ),
);
