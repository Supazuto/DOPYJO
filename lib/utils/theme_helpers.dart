import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ThemeHelpers {
  /// Get theme-aware text color based on current theme
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimary;
  }

  /// Get theme-aware secondary text color based on current theme
  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondary;
  }

  /// Get theme-aware background color based on current theme
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.backgroundDark
        : AppColors.background;
  }

  /// Get theme-aware surface color based on current theme
  static Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.surfaceDark
        : AppColors.surface;
  }

  /// Get theme-aware card background color based on current theme
  static Color getCardBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.cardBackgroundDark
        : AppColors.cardBackground;
  }

  /// Get theme-aware border color based on current theme
  static Color getBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.borderDark
        : AppColors.border;
  }

  /// Get theme-aware glass morphism background color
  static Color getGlassBackgroundColor(
    BuildContext context, {
    double alpha = 0.1,
  }) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.surfaceDark.withValues(alpha: alpha)
        : Colors.white.withValues(alpha: alpha);
  }

  /// Get theme-aware glass morphism border color
  static Color getGlassBorderColor(BuildContext context, {double alpha = 0.2}) {
    return Theme.of(context).brightness == Brightness.dark
        ? AppColors.borderDark.withValues(alpha: alpha)
        : AppColors.border.withValues(alpha: alpha);
  }

  /// Create theme-aware text style
  static TextStyle getTextStyle(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? getTextColor(context),
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  /// Create theme-aware headline text style
  static TextStyle getHeadlineStyle(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return getTextStyle(
      context,
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? getTextColor(context),
      letterSpacing: letterSpacing ?? 0.5,
    );
  }

  /// Create theme-aware body text style
  static TextStyle getBodyStyle(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return getTextStyle(
      context,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? getTextColor(context),
      letterSpacing: letterSpacing ?? 0.25,
    );
  }

  /// Create theme-aware caption text style
  static TextStyle getCaptionStyle(
    BuildContext context, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return getTextStyle(
      context,
      fontSize: fontSize ?? 12,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? getSecondaryTextColor(context),
      letterSpacing: letterSpacing ?? 0.4,
    );
  }

  /// Check if current theme is dark
  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Get theme-aware icon color
  static Color getIconColor(BuildContext context, {Color? defaultColor}) {
    return defaultColor ?? getTextColor(context);
  }
}
