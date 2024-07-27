import 'package:flutter/material.dart';

class DoDidDoneTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFefefef), // Основной цвет
      primary: const Color(0xFF393d47), // Основной цвет
      secondary: const Color(0xFFefefef), // Вторичный цвет
      surface: const Color(0xFFe52e36), // Цвет фона
    ),
    useMaterial3: true,
  );
}
