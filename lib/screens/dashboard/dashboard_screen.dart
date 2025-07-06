import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/glass_morphism_container.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    AppColors.backgroundDark,
                    AppColors.backgroundDark.withValues(alpha: 0.8),
                  ]
                : [
                    AppColors.background,
                    AppColors.background.withValues(alpha: 0.8),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section with luxury gradient and glass effect
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 10,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                backgroundColor: isDark
                    ? AppColors.surfaceDark.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                border: Border.all(
                  color: isDark
                      ? AppColors.borderDark.withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GlassMorphismContainer(
                          borderRadius: 20,
                          blur: 8,
                          padding: const EdgeInsets.all(3),
                          backgroundColor: isDark
                              ? AppColors.surfaceDark.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.2),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: isDark
                                ? AppColors.surfaceDark
                                : Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppConstants.paddingMedium),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)?.welcome ??
                                    'Welcome back!',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      color: isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimary,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                    ),
                              ),
                              Text(
                                'John Doe',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textSecondary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),
                    GlassMorphismContainer(
                      borderRadius: 20,
                      blur: 5,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      backgroundColor: isDark
                          ? AppColors.surfaceDark.withValues(alpha: 0.15)
                          : Colors.white.withValues(alpha: 0.15),
                      border: Border.all(
                        color: isDark
                            ? AppColors.borderDark.withValues(alpha: 0.2)
                            : Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      ),
                      child: Text(
                        AppLocalizations.of(context)?.welcomeMessage ??
                            'Let\'s continue your health journey today!',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Health Summary with glass morphism
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 10,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                backgroundColor: isDark
                    ? AppColors.surfaceDark.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.info.withValues(alpha: 0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(
                  color: isDark
                      ? AppColors.borderDark.withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.healthSummary ??
                          'Health Summary',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimary,
                            letterSpacing: 0.5,
                          ),
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildHealthMetric(
                          context,
                          AppLocalizations.of(context)?.heartRate ??
                              'Heart Rate',
                          '72',
                          'BPM',
                          Icons.favorite,
                          AppColors.error,
                        ),
                        _buildHealthMetric(
                          context,
                          AppLocalizations.of(context)?.steps ?? 'Steps',
                          '8,432',
                          'steps',
                          Icons.directions_walk,
                          AppColors.success,
                        ),
                        _buildHealthMetric(
                          context,
                          AppLocalizations.of(context)?.calories ?? 'Calories',
                          '1,240',
                          'kcal',
                          Icons.local_fire_department,
                          AppColors.warning,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Quick Actions with modern glass cards
              Text(
                AppLocalizations.of(context)?.quickActions ?? 'Quick Actions',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.paddingMedium,
                mainAxisSpacing: AppConstants.paddingMedium,
                childAspectRatio: 1.1,
                children: [
                  GlassMorphismContainer(
                    borderRadius: AppConstants.borderRadiusXLarge,
                    blur: 8,
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    backgroundColor: AppColors.success.withValues(alpha: 0.1),
                    border: Border.all(
                      color: AppColors.success.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          size: 32,
                          color: AppColors.success,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Add Meal',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  GlassMorphismContainer(
                    borderRadius: AppConstants.borderRadiusXLarge,
                    blur: 8,
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fitness_center,
                          size: 32,
                          color: AppColors.primary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Log Exercise',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  GlassMorphismContainer(
                    borderRadius: AppConstants.borderRadiusXLarge,
                    blur: 8,
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    backgroundColor: AppColors.info.withValues(alpha: 0.1),
                    border: Border.all(
                      color: AppColors.info.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.health_and_safety,
                          size: 32,
                          color: AppColors.info,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Check Health',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  GlassMorphismContainer(
                    borderRadius: AppConstants.borderRadiusXLarge,
                    blur: 8,
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    backgroundColor: AppColors.accent.withValues(alpha: 0.1),
                    border: Border.all(
                      color: AppColors.accent.withValues(alpha: 0.2),
                      width: 1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.trending_up,
                          size: 32,
                          color: AppColors.accent,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'View Progress',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Today's Activities with glass effect
              Text(
                AppLocalizations.of(context)?.todayActivities ??
                    'Today\'s Activities',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 8,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                backgroundColor: isDark
                    ? AppColors.surfaceDark.withValues(alpha: 0.05)
                    : Colors.white.withValues(alpha: 0.05),
                border: Border.all(
                  color: isDark
                      ? AppColors.borderDark.withValues(alpha: 0.2)
                      : AppColors.border.withValues(alpha: 0.2),
                  width: 1,
                ),
                child: Column(
                  children: [
                    _buildActivityItem(
                      context,
                      'Breakfast',
                      'Healthy meal logged',
                      Icons.breakfast_dining,
                      AppColors.warning,
                    ),
                    _buildActivityItem(
                      context,
                      'Water Intake',
                      '1.5L / 2.5L',
                      Icons.water_drop,
                      AppColors.info,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Recommendations with glass morphism
              Text(
                AppLocalizations.of(context)?.recommendations ??
                    'Recommendations',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 8,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                backgroundColor: AppColors.accent.withValues(alpha: 0.1),
                border: Border.all(
                  color: AppColors.accent.withValues(alpha: 0.2),
                  width: 1,
                ),
                child: Column(
                  children: [
                    _buildRecommendationItem(
                      context,
                      'Increase protein intake',
                      'Add lean meats or legumes to your diet',
                      Icons.restaurant,
                    ),
                    _buildRecommendationItem(
                      context,
                      'Take a break',
                      'You\'ve been sitting for 2 hours',
                      Icons.accessibility_new,
                    ),
                    _buildRecommendationItem(
                      context,
                      'Drink water',
                      'Stay hydrated throughout the day',
                      Icons.water_drop,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthMetric(
    BuildContext context,
    String label,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        GlassMorphismContainer(
          borderRadius: AppConstants.borderRadiusLarge,
          blur: 5,
          padding: const EdgeInsets.all(12),
          backgroundColor: isDark
              ? AppColors.surfaceDark.withValues(alpha: 0.2)
              : Colors.white.withValues(alpha: 0.2),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          unit,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusMedium,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusMedium,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.accent.withValues(alpha: 0.1),
            child: Icon(icon, color: AppColors.accent, size: 20),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
