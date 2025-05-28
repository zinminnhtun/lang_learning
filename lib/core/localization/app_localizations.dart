import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

import 'language.dart';
import 'translations/en_translations.dart';
import 'translations/my_translations.dart';
import 'translations/zh_translations.dart';

class AppLocalizations {
  final Locale locale;
  
  AppLocalizations(this.locale);
  
  // Helper method to keep the code in the widgets concise
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
  
  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  
  late Map<String, String> _localizedStrings;
  
  Future<bool> load() {
    // Load the language JSON file from the translations folder
    switch (locale.languageCode) {
      case 'my':
        _localizedStrings = myTranslations;
        break;
      case 'zh':
        _localizedStrings = zhTranslations;
        break;
      default:
        _localizedStrings = enTranslations;
    }
    return SynchronousFuture<bool>(true);
  }
  
  // This method will be called from every widget that needs a localized text
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
  
  // Get current locale language name
  String get currentLanguageName {
    return Language.getDisplayLanguage(locale.languageCode);
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  
  // Include all supported language codes here
  @override
  bool isSupported(Locale locale) {
    return ['en', 'my', 'zh'].contains(locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }
  
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

// Extension for easier string translations
extension TranslateX on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
