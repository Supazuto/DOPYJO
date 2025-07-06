import 'package:flutter/material.dart';

class AppColors {
  // Primary colors - Cool Blue/Purple theme
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);

  // Secondary colors - Teal accent
  static const Color secondary = Color(0xFF14B8A6); // Teal
  static const Color secondaryLight = Color(0xFF2DD4BF);
  static const Color secondaryDark = Color(0xFF0D9488);

  // Accent colors - Purple
  static const Color accent = Color(0xFF8B5CF6); // Violet
  static const Color accentLight = Color(0xFFA78BFA);
  static const Color accentDark = Color(0xFF7C3AED);

  // Success colors - Emerald
  static const Color success = Color(0xFF10B981); // Emerald
  static const Color successLight = Color(0xFF34D399);
  static const Color successDark = Color(0xFF059669);

  // Warning colors - Amber
  static const Color warning = Color(0xFFF59E0B); // Amber
  static const Color warningLight = Color(0xFFFBBF24);
  static const Color warningDark = Color(0xFFD97706);

  // Error colors - Rose
  static const Color error = Color(0xFFEF4444); // Rose
  static const Color errorLight = Color(0xFFF87171);
  static const Color errorDark = Color(0xFFDC2626);

  // Info colors - Sky Blue
  static const Color info = Color(0xFF0EA5E9); // Sky
  static const Color infoLight = Color(0xFF38BDF8);
  static const Color infoDark = Color(0xFF0284C7);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  // Grey scale - Modern slate
  static const Color grey = Color(0xFF64748B); // Slate
  static const Color lightGrey = Color(0xFFF8FAFC);
  static const Color darkGrey = Color(0xFF334155);
  static const Color mediumGrey = Color(0xFF64748B);

  // Light theme colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textHint = Color(0xFF94A3B8);
  static const Color textDisabled = Color(0xFFCBD5E1);
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderLight = Color(0xFFF1F5F9);
  static const Color borderMedium = Color(0xFFCBD5E1);

  // Dark theme colors - Sophisticated dark
  static const Color backgroundDark = Color(0xFF0F172A);
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color cardBackgroundDark = Color(0xFF334155);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFFCBD5E1);
  static const Color textHintDark = Color(0xFF64748B);
  static const Color borderDark = Color(0xFF475569);

  // Shadow colors
  static const Color shadow = Color(0x1F000000);
  static const Color shadowLight = Color(0x0A000000);
  static const Color shadowDark = Color(0x33000000);

  // Health specific colors
  static const Color healthGood = Color(0xFF10B981); // Emerald
  static const Color healthModerate = Color(0xFFF59E0B); // Amber
  static const Color healthPoor = Color(0xFFEF4444); // Rose
  static const Color healthExcellent = Color(0xFF0EA5E9); // Sky

  // Exercise specific colors
  static const Color cardio = Color(0xFFEC4899); // Pink
  static const Color strength = Color(0xFF8B5CF6); // Violet
  static const Color flexibility = Color(0xFF06B6D4); // Cyan
  static const Color balance = Color(0xFF84CC16); // Lime

  // Nutrition specific colors
  static const Color protein = Color(0xFFF97316); // Orange
  static const Color carbs = Color(0xFFEAB308); // Yellow
  static const Color fats = Color(0xFFF59E0B); // Amber
  static const Color fiber = Color(0xFF10B981); // Emerald
  static const Color vitamins = Color(0xFF0EA5E9); // Sky

  // Luxury gradients
  static const List<Color> primaryGradient = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Violet
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFF14B8A6), // Teal
    Color(0xFF06B6D4), // Cyan
  ];

  static const List<Color> accentGradient = [
    Color(0xFF8B5CF6), // Violet
    Color(0xFFEC4899), // Pink
  ];

  static const List<Color> luxuryGradient = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Violet
    Color(0xFFEC4899), // Pink
  ];

  static const List<Color> coolGradient = [
    Color(0xFF0EA5E9), // Sky
    Color(0xFF14B8A6), // Teal
    Color(0xFF06B6D4), // Cyan
  ];

  // Theme-aware color getters
  static Color getBackgroundColor(bool isDark) =>
      isDark ? backgroundDark : background;
  static Color getSurfaceColor(bool isDark) => isDark ? surfaceDark : surface;
  static Color getCardBackgroundColor(bool isDark) =>
      isDark ? cardBackgroundDark : cardBackground;
  static Color getTextPrimaryColor(bool isDark) =>
      isDark ? textPrimaryDark : textPrimary;
  static Color getTextSecondaryColor(bool isDark) =>
      isDark ? textSecondaryDark : textSecondary;
  static Color getTextHintColor(bool isDark) =>
      isDark ? textHintDark : textHint;
  static Color getBorderColor(bool isDark) => isDark ? borderDark : border;

  // Theme-aware color getters with context
  static Color getBackgroundColorFromContext(BuildContext context) =>
      getBackgroundColor(Theme.of(context).brightness == Brightness.dark);
  static Color getSurfaceColorFromContext(BuildContext context) =>
      getSurfaceColor(Theme.of(context).brightness == Brightness.dark);
  static Color getCardBackgroundColorFromContext(BuildContext context) =>
      getCardBackgroundColor(Theme.of(context).brightness == Brightness.dark);
  static Color getTextPrimaryColorFromContext(BuildContext context) =>
      getTextPrimaryColor(Theme.of(context).brightness == Brightness.dark);
  static Color getTextSecondaryColorFromContext(BuildContext context) =>
      getTextSecondaryColor(Theme.of(context).brightness == Brightness.dark);
  static Color getTextHintColorFromContext(BuildContext context) =>
      getTextHintColor(Theme.of(context).brightness == Brightness.dark);
  static Color getBorderColorFromContext(BuildContext context) =>
      getBorderColor(Theme.of(context).brightness == Brightness.dark);
}
