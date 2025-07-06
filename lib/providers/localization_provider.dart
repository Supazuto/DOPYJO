import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppLanguage { english, thai }

class LocalizationProvider extends ChangeNotifier {
  static const String _languageKey = 'app_language';

  AppLanguage _currentLanguage = AppLanguage.english;
  Locale _currentLocale = const Locale('en', 'US');

  AppLanguage get currentLanguage => _currentLanguage;
  Locale get currentLocale => _currentLocale;

  LocalizationProvider() {
    _loadLanguagePreference();
  }

  Future<void> _loadLanguagePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final languageIndex =
          prefs.getInt(_languageKey) ?? AppLanguage.english.index;
      _currentLanguage = AppLanguage.values[languageIndex];
      _updateLocale();
    } catch (e) {
      // Fallback to English
      _currentLanguage = AppLanguage.english;
      _updateLocale();
    }
  }

  Future<void> setLanguage(AppLanguage language) async {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      _updateLocale();

      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(_languageKey, language.index);
      } catch (e) {
        // Handle error silently
      }

      notifyListeners();
    }
  }

  void _updateLocale() {
    switch (_currentLanguage) {
      case AppLanguage.english:
        _currentLocale = const Locale('en', 'US');
        break;
      case AppLanguage.thai:
        _currentLocale = const Locale('th', 'TH');
        break;
    }
  }

  String getLanguageName(AppLanguage language) {
    switch (language) {
      case AppLanguage.english:
        return 'English';
      case AppLanguage.thai:
        return 'ไทย';
    }
  }

  String getLanguageDisplayName(AppLanguage language, BuildContext context) {
    switch (language) {
      case AppLanguage.english:
        return 'English';
      case AppLanguage.thai:
        return 'ไทย';
    }
  }
}
