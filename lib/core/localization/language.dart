
class Language {
  final String code;
  final String name;
  final String nativeName;
  final String flag;

  const Language({
    required this.code,
    required this.name,
    required this.nativeName,
    required this.flag,
  });

  // All supported languages
  static const List<Language> supportedLanguages = [
    Language(
      code: 'en',
      name: 'English',
      nativeName: 'English',
      flag: '🇺🇸',
    ),
    Language(
      code: 'my',
      name: 'Burmese',
      nativeName: 'မြန်မာ',
      flag: '🇲🇲',
    ),
    Language(
      code: 'zh',
      name: 'Chinese',
      nativeName: '中文',
      flag: '🇨🇳',
    ),
  ];

  // Get language by code
  static Language getLanguage(String code) {
    return supportedLanguages.firstWhere(
      (language) => language.code == code,
      orElse: () => supportedLanguages.first,
    );
  }

  // Get display language name
  static String getDisplayLanguage(String code) {
    return getLanguage(code).name;
  }

  // Get native language name
  static String getNativeLanguage(String code) {
    return getLanguage(code).nativeName;
  }

  // Get language flag
  static String getLanguageFlag(String code) {
    return getLanguage(code).flag;
  }

  // Get all language codes
  static List<String> get languageCodes {
    return supportedLanguages.map((lang) => lang.code).toList();
  }
}
