import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'DOPYJO';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Smart Health & Fitness App';

  // App Meaning
  static const String appMeaning =
      'D (Diet) → O (Observe) → P (Physical) → Y (Yearly) → J (Join) → O (Optimistic)';
  static const String appFullMeaning =
      'โภชนาการ + การสังเกต + กายภาพ + ประจำปี + เข้าร่วม + ด้านบวก';
  static const String appTagline = 'การใช้ชีวิตอย่างชาญฉลาดด้วยการดูแลสุขภาพ';

  // Colors - Updated to match new modern color scheme
  static const Color primaryColor = Color(0xFF6366F1); // Indigo
  static const Color primaryLightColor = Color(0xFF818CF8);
  static const Color primaryDarkColor = Color(0xFF4F46E5);
  static const Color secondaryColor = Color(0xFF14B8A6); // Teal
  static const Color accentColor = Color(0xFF8B5CF6); // Violet
  static const Color errorColor = Color(0xFFEF4444); // Rose
  static const Color warningColor = Color(0xFFF59E0B); // Amber
  static const Color successColor = Color(0xFF10B981); // Emerald
  static const Color infoColor = Color(0xFF0EA5E9); // Sky

  // Background Colors
  static const Color backgroundColor = Color(0xFFF8FAFC);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color cardColor = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF1E293B);
  static const Color textSecondaryColor = Color(0xFF64748B);
  static const Color textLightColor = Color(0xFF94A3B8);

  // Health Risk Colors
  static const Color diabetesRiskColor = Color(0xFFF97316); // Orange
  static const Color hypertensionRiskColor = Color(0xFFEC4899); // Pink
  static const Color cholesterolRiskColor = Color(0xFFF59E0B); // Amber
  static const Color obesityRiskColor = Color(0xFF8B5CF6); // Violet

  // Dimensions
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;
  static const double marginXLarge = 32.0;

  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;

  // Font Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXLarge = 18.0;
  static const double fontSizeXXLarge = 20.0;
  static const double fontSizeTitle = 24.0;
  static const double fontSizeHeadline = 28.0;

  // Animation Durations
  static const Duration animationDurationFast = Duration(milliseconds: 200);
  static const Duration animationDurationNormal = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  // API Endpoints (placeholder)
  static const String baseUrl = 'https://api.dopyjo.com';
  static const String authEndpoint = '/auth';
  static const String userEndpoint = '/user';
  static const String healthEndpoint = '/health';
  static const String exerciseEndpoint = '/exercise';
  static const String nutritionEndpoint = '/nutrition';
  static const String aiEndpoint = '/ai';

  // Local Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  static const String healthDataKey = 'health_data';
  static const String settingsKey = 'app_settings';
  static const String languageKey = 'app_language';
  static const String themeKey = 'app_theme';

  // Notification IDs
  static const int notificationIdExercise = 1;
  static const int notificationIdNutrition = 2;
  static const int notificationIdHealth = 3;
  static const int notificationIdReminder = 4;

  // Health Metrics
  static const List<String> healthMetrics = [
    'weight',
    'height',
    'bmi',
    'blood_pressure',
    'blood_sugar',
    'cholesterol',
    'waist_circumference',
    'body_fat_percentage',
  ];

  // Exercise Categories
  static const List<String> exerciseCategories = [
    'Cardio',
    'Strength',
    'Flexibility',
    'Balance',
    'Yoga',
    'Pilates',
    'Swimming',
    'Walking',
    'Running',
    'Cycling',
  ];

  // Nutrition Categories
  static const List<String> nutritionCategories = [
    'Proteins',
    'Carbohydrates',
    'Fats',
    'Vitamins',
    'Minerals',
    'Fiber',
    'Water',
  ];

  // Health Risk Levels
  static const List<String> healthRiskLevels = [
    'Low',
    'Medium',
    'High',
    'Very High',
  ];

  // Languages
  static const List<String> supportedLanguages = ['en', 'th', 'zh', 'ja', 'ko'];

  // App Features
  static const List<String> appFeatures = [
    'User Authentication',
    'Health Risk Assessment',
    'Personalized Exercise Plans',
    'Nutrition Guidance',
    'Health Tracking',
    'AI Chat Assistant',
    'Community Forum',
    'Progress Analytics',
    'Smart Notifications',
    'Offline Support',
  ];
}
