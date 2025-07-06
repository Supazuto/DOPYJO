import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../widgets/glass_morphism_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GlassMorphismContainer(
            borderRadius: 20,
            blur: 8,
            padding: const EdgeInsets.all(8),
            backgroundColor: isDark
                ? AppColors.surfaceDark.withValues(alpha: 0.2)
                : Colors.white.withValues(alpha: 0.2),
            child: Icon(
              Icons.notifications,
              color: isDark ? AppColors.textPrimaryDark : Colors.white,
            ),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
        ],
      ),
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
              // Welcome Section with glass morphism
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
                          padding: const EdgeInsets.all(12),
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
                                'Welcome back!',
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      color: isDark
                                          ? AppColors.textPrimaryDark
                                          : Colors.white,
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
                                          : Colors.white.withValues(alpha: 0.9),
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
                        'Let\'s continue your health journey today!',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Quick Stats with glass morphism
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
                      'Today\'s Progress',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : Colors.white,
                            letterSpacing: 0.5,
                          ),
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          context,
                          'Steps',
                          '8,432',
                          'steps',
                          Icons.directions_walk,
                          AppColors.success,
                        ),
                        _buildStatItem(
                          context,
                          'Calories',
                          '1,240',
                          'kcal',
                          Icons.local_fire_department,
                          AppColors.warning,
                        ),
                        _buildStatItem(
                          context,
                          'Heart Rate',
                          '72',
                          'BPM',
                          Icons.favorite,
                          AppColors.error,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Quick Actions
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
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
                  _buildQuickActionCard(
                    context,
                    'Add Meal',
                    Icons.restaurant,
                    AppColors.success,
                  ),
                  _buildQuickActionCard(
                    context,
                    'Log Exercise',
                    Icons.fitness_center,
                    AppColors.primary,
                  ),
                  _buildQuickActionCard(
                    context,
                    'Check Health',
                    Icons.health_and_safety,
                    AppColors.info,
                  ),
                  _buildQuickActionCard(
                    context,
                    'View Progress',
                    Icons.trending_up,
                    AppColors.accent,
                  ),
                ],
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Recent Activities
              Text(
                'Recent Activities',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
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
                      'Breakfast logged',
                      '2 hours ago',
                      Icons.breakfast_dining,
                      AppColors.warning,
                    ),
                    _buildActivityItem(
                      context,
                      'Morning walk completed',
                      '4 hours ago',
                      Icons.directions_walk,
                      AppColors.success,
                    ),
                    _buildActivityItem(
                      context,
                      'Water intake updated',
                      '6 hours ago',
                      Icons.water_drop,
                      AppColors.info,
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

  Widget _buildStatItem(
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
            color: isDark ? AppColors.textPrimaryDark : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          unit,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark
                ? AppColors.textPrimaryDark
                : Colors.white.withValues(alpha: 0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusXLarge,
      blur: 8,
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      backgroundColor: color.withValues(alpha: 0.1),
      border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
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
