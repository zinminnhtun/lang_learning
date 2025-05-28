import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization/language.dart';

class LanguageProvider extends ChangeNotifier {
  static const String LANGUAGE_CODE = 'languageCode';
  
  Locale _currentLocale = const Locale('en');
  
  LanguageProvider() {
    _loadFromPrefs();
  }
  
  Locale get currentLocale => _currentLocale;
  
  void changeLanguage(String languageCode) async {
    if (languageCode == _currentLocale.languageCode) return;
    
    _currentLocale = Locale(languageCode);
    await _saveToPrefs();
    notifyListeners();
  }
  
  // Initialize language from saved preferences
  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String languageCode = prefs.getString(LANGUAGE_CODE) ?? 'en';
    
    // Verify it's a supported language
    if (Language.languageCodes.contains(languageCode)) {
      _currentLocale = Locale(languageCode);
    }
    
    notifyListeners();
  }
  
  // Save language preference
  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(LANGUAGE_CODE, _currentLocale.languageCode);
  }
}
