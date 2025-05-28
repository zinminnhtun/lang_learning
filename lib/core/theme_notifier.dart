import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light; // Default theme
  static const String _themeModeKey = 'themeMode';

  ThemeMode get themeMode => _themeMode;

  ThemeNotifier() {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedThemeMode = prefs.getString(_themeModeKey);

    if (savedThemeMode != null) {
      if (savedThemeMode == 'dark') {
        _themeMode = ThemeMode.dark;
      } else if (savedThemeMode == 'system') {
        _themeMode = ThemeMode.system; // In case system theme is ever supported
      }
      else {
        _themeMode = ThemeMode.light;
      }
    }
    // If null, _themeMode remains the default (ThemeMode.light)
    notifyListeners(); // Notify listeners after loading the theme
  }

  Future<void> toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_themeModeKey, isDark ? 'dark' : 'light');
  }

  // Optional: A method to set theme to system default if you plan to support it
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    String valueToSave;
    switch(mode) {
      case ThemeMode.dark:
        valueToSave = 'dark';
        break;
      case ThemeMode.light:
        valueToSave = 'light';
        break;
      case ThemeMode.system:
        valueToSave = 'system';
        break;
    }
    prefs.setString(_themeModeKey, valueToSave);
  }
}
