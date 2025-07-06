import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/app_localizations.dart';

enum AppThemeMode { light, dark, system }

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';

  AppThemeMode _themeMode = AppThemeMode.system;
  bool _isDarkMode = false;

  AppThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeModeIndex =
          prefs.getInt(_themeKey) ?? AppThemeMode.system.index;
      _themeMode = AppThemeMode.values[themeModeIndex];
      _updateDarkMode();
      notifyListeners();
    } catch (e) {
      // Fallback to system theme
      _themeMode = AppThemeMode.system;
      _updateDarkMode();
    }
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    _updateDarkMode();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_themeKey, mode.index);
    } catch (e) {
      // Handle error silently
    }

    notifyListeners();
  }

  void _updateDarkMode() {
    switch (_themeMode) {
      case AppThemeMode.light:
        _isDarkMode = false;
        break;
      case AppThemeMode.dark:
        _isDarkMode = true;
        break;
      case AppThemeMode.system:
        // This will be updated by the main app when system theme changes
        // Default to system brightness
        _isDarkMode =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
        break;
    }
  }

  void updateSystemTheme(Brightness brightness) {
    if (_themeMode == AppThemeMode.system) {
      _isDarkMode = brightness == Brightness.dark;
      notifyListeners();
    }
  }

  String getThemeModeName(BuildContext context) {
    switch (_themeMode) {
      case AppThemeMode.light:
        return AppLocalizations.of(context)?.lightTheme ?? 'Light';
      case AppThemeMode.dark:
        return AppLocalizations.of(context)?.darkTheme ?? 'Dark';
      case AppThemeMode.system:
        return AppLocalizations.of(context)?.systemTheme ?? 'System';
    }
  }

  IconData getThemeModeIcon() {
    switch (_themeMode) {
      case AppThemeMode.light:
        return Icons.wb_sunny;
      case AppThemeMode.dark:
        return Icons.nightlight_round;
      case AppThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  Color getThemeModeColor() {
    switch (_themeMode) {
      case AppThemeMode.light:
        return Colors.orange;
      case AppThemeMode.dark:
        return Colors.indigo;
      case AppThemeMode.system:
        return Colors.blue;
    }
  }
}
