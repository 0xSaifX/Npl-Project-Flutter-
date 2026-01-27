import 'package:flutter/material.dart';

class AppColors {
  static const cardBlue = Color(0xFF0A1C56);
  static const lightBlue = Color(0xFFE8ECF8);
  static const navyDark = Color(0xFF0C1C50);
  static const navyMid = Color(0xFF19396E);
}

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}
