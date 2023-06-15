import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  get themeMode => _themeMode;

  toggleTheme() {
    if (_themeMode == ThemeMode.system || _themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
