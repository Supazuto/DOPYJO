import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../widgets/glass_morphism_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
        ),
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
            children: [
              // Profile Header
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 15,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                backgroundColor: isDark
                    ? AppColors.surfaceDark.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.15),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
                child: Column(
                  children: [
                    // Profile Picture
                    GlassMorphismContainer(
                      borderRadius: 50,
                      blur: 10,
                      padding: const EdgeInsets.all(4),
                      backgroundColor: isDark
                          ? AppColors.surfaceDark.withValues(alpha: 0.2)
                          : Colors.white.withValues(alpha: 0.2),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: isDark
                            ? AppColors.surfaceDark
                            : Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),

                    // Name
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimary,
                          ),
                    ),
                    const SizedBox(height: AppConstants.paddingSmall),

                    // Email
                    Text(
                      'john.doe@example.com',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),

                    // Edit Profile Button
                    GlassMorphismContainer(
                      borderRadius: AppConstants.borderRadiusMedium,
                      blur: 5,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingMedium,
                        vertical: AppConstants.paddingSmall,
                      ),
                      backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        width: 1,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: AppColors.primary, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            'Edit Profile',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Profile Stats
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 10,
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
                    Text(
                      'Profile Statistics',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          'Workouts',
                          '45',
                          Icons.fitness_center,
                          AppColors.primary,
                        ),
                        _buildStatItem(
                          'Days Active',
                          '28',
                          Icons.calendar_today,
                          AppColors.success,
                        ),
                        _buildStatItem(
                          'Goals Met',
                          '12',
                          Icons.flag,
                          AppColors.accent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Settings Section
              _buildSettingsSection('Account Settings', [
                _buildSettingsItem(
                  'Personal Information',
                  Icons.person_outline,
                  AppColors.primary,
                ),
                _buildSettingsItem(
                  'Change Password',
                  Icons.lock_outline,
                  AppColors.warning,
                ),
                _buildSettingsItem(
                  'Privacy Settings',
                  Icons.security,
                  AppColors.info,
                ),
              ]),

              const SizedBox(height: AppConstants.paddingMedium),

              _buildSettingsSection('App Settings', [
                _buildSettingsItem(
                  'Notifications',
                  Icons.notifications_outlined,
                  AppColors.accent,
                ),
                _buildSettingsItem(
                  'Theme',
                  Icons.palette_outlined,
                  AppColors.primary,
                ),
                _buildSettingsItem(
                  'Language',
                  Icons.language,
                  AppColors.success,
                ),
              ]),

              const SizedBox(height: AppConstants.paddingMedium),

              _buildSettingsSection('Support', [
                _buildSettingsItem(
                  'Help & FAQ',
                  Icons.help_outline,
                  AppColors.info,
                ),
                _buildSettingsItem(
                  'Contact Support',
                  Icons.support_agent,
                  AppColors.primary,
                ),
                _buildSettingsItem(
                  'About App',
                  Icons.info_outline,
                  AppColors.accent,
                ),
              ]),

              const SizedBox(height: AppConstants.paddingLarge),

              // Logout Button
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusXLarge,
                blur: 8,
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                backgroundColor: AppColors.error.withValues(alpha: 0.1),
                border: Border.all(
                  color: AppColors.error.withValues(alpha: 0.2),
                  width: 1,
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout, color: AppColors.error, size: 24),
                    const SizedBox(width: AppConstants.paddingMedium),
                    Text(
                      'Logout',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.error,
                      ),
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
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        GlassMorphismContainer(
          borderRadius: AppConstants.borderRadiusMedium,
          blur: 5,
          padding: const EdgeInsets.all(12),
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> items) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusXLarge,
      blur: 8,
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.1)
          : Colors.white.withValues(alpha: 0.1),
      border: Border.all(
        color: isDark
            ? AppColors.borderDark.withValues(alpha: 0.2)
            : AppColors.border.withValues(alpha: 0.2),
        width: 1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          ...items,
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, IconData icon, Color color) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusSmall,
            blur: 3,
            padding: const EdgeInsets.all(8),
            backgroundColor: color.withValues(alpha: 0.1),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimary,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondary,
            size: 16,
          ),
        ],
      ),
    );
  }
}
