import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  // Store the current theme mode (light or dark)
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Toggle theme
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

