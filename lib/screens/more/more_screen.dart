import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/glass_morphism_container.dart';
import '../../providers/theme_provider.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

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
              // Header Section
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
                              Icons.settings,
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
                                AppLocalizations.of(context)?.more ?? 'More',
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
                                AppLocalizations.of(context)?.settings ??
                                    'Settings',
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
                  ],
                ),
              ),

              const SizedBox(height: AppConstants.paddingLarge),

              // Settings Section
              _buildSettingsSection(context, isDark),

              const SizedBox(height: AppConstants.paddingLarge),

              // Support Section
              _buildSupportSection(context, isDark),

              const SizedBox(height: AppConstants.paddingLarge),

              // About Section
              _buildAboutSection(context, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection(BuildContext context, bool isDark) {
    return GlassMorphismContainer(
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
            AppLocalizations.of(context)?.settings ?? 'Settings',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          _buildSettingsItem(
            context,
            Icons.dark_mode,
            AppLocalizations.of(context)?.theme ?? 'Theme',
            context.watch<ThemeProvider>().getThemeModeName(context),
            () => _showThemeSettings(context),
            isDark,
          ),
          _buildSettingsItem(
            context,
            Icons.notifications,
            AppLocalizations.of(context)?.notifications ?? 'Notifications',
            'Manage notifications',
            () => _showNotificationSettings(context),
            isDark,
          ),
          _buildSettingsItem(
            context,
            Icons.security,
            AppLocalizations.of(context)?.privacySettings ?? 'Privacy Settings',
            'Manage privacy',
            () {
              // TODO: Privacy settings
            },
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection(BuildContext context, bool isDark) {
    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusXLarge,
      blur: 10,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.15)
          : Colors.white.withValues(alpha: 0.15),
      boxShadow: [
        BoxShadow(
          color: AppColors.success.withValues(alpha: 0.2),
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
            AppLocalizations.of(context)?.helpSupport ?? 'Help & Support',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          _buildSettingsItem(
            context,
            Icons.help,
            AppLocalizations.of(context)?.helpSupport ?? 'Help & Support',
            'Get help and support',
            () => _showHelpDialog(context),
            isDark,
          ),
          _buildSettingsItem(
            context,
            Icons.feedback,
            AppLocalizations.of(context)?.feedback ?? 'Feedback',
            'Send us feedback',
            () => _showFeedbackDialog(context),
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection(BuildContext context, bool isDark) {
    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusXLarge,
      blur: 10,
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.15)
          : Colors.white.withValues(alpha: 0.15),
      boxShadow: [
        BoxShadow(
          color: AppColors.warning.withValues(alpha: 0.2),
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
            AppLocalizations.of(context)?.aboutDopyjo ?? 'About DOPYJO',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          _buildSettingsItem(
            context,
            Icons.info,
            AppLocalizations.of(context)?.aboutDopyjo ?? 'About DOPYJO',
            'App information',
            () => _showAboutDialog(context),
            isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
    bool isDark,
  ) {
    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusLarge,
      blur: 5,
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.1)
          : Colors.white.withValues(alpha: 0.1),
      border: Border.all(
        color: isDark
            ? AppColors.borderDark.withValues(alpha: 0.2)
            : Colors.white.withValues(alpha: 0.2),
        width: 1,
      ),
      child: ListTile(
        leading: GlassMorphismContainer(
          borderRadius: AppConstants.borderRadiusMedium,
          blur: 5,
          padding: const EdgeInsets.all(8),
          backgroundColor: AppColors.primary.withValues(alpha: 0.1),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondary,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.notifications ?? 'Notifications',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwitchListTile(
              title: Text(
                '${AppLocalizations.of(context)?.notifications} ${AppLocalizations.of(context)?.exercise ?? 'Exercise'}',
              ),
              subtitle: Text(
                '${AppLocalizations.of(context)?.notifications} ${AppLocalizations.of(context)?.exercise ?? 'Exercise'}',
              ),
              value: true,
              onChanged: (value) {
                // TODO: Toggle notification
              },
            ),
            SwitchListTile(
              title: Text(
                '${AppLocalizations.of(context)?.notifications} ${AppLocalizations.of(context)?.food ?? 'Food'}',
              ),
              subtitle: Text(
                '${AppLocalizations.of(context)?.notifications} ${AppLocalizations.of(context)?.food ?? 'Food'}',
              ),
              value: true,
              onChanged: (value) {
                // TODO: Toggle notification
              },
            ),
            SwitchListTile(
              title: Text(
                '${AppLocalizations.of(context)?.notifications} ${AppLocalizations.of(context)?.water ?? 'Water'}',
              ),
              subtitle: Text(
                '${AppLocalizations.of(context)?.notifications} ${AppLocalizations.of(context)?.water ?? 'Water'}',
              ),
              value: false,
              onChanged: (value) {
                // TODO: Toggle notification
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.close ?? 'Close'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.helpSupport ?? 'Help & Support',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppLocalizations.of(context)?.helpSupport}:'),
            const SizedBox(height: 8),
            Text('• ${AppLocalizations.of(context)?.addMeal ?? 'Add Meal'}'),
            Text('• ${AppLocalizations.of(context)?.exercise ?? 'Exercise'}'),
            Text('• ${AppLocalizations.of(context)?.goal ?? 'Goal'}'),
            Text(
              '• ${AppLocalizations.of(context)?.progressReport ?? 'Progress Report'}',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.close ?? 'Close'),
          ),
        ],
      ),
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)?.feedback ?? 'Feedback'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: '${AppLocalizations.of(context)?.feedback}...',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text('${AppLocalizations.of(context)?.feedback}: '),
                ...List.generate(
                  5,
                  (index) => IconButton(
                    icon: Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      // TODO: Handle rating
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Submit feedback
              Navigator.pop(context);
            },
            child: Text(AppLocalizations.of(context)?.send ?? 'Send'),
          ),
        ],
      ),
    );
  }

  void _showThemeSettings(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalizations.of(context)?.theme ?? 'Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildThemeOption(
              context,
              AppThemeMode.light,
              AppLocalizations.of(context)?.lightTheme ?? 'Light Theme',
              Icons.wb_sunny,
              Colors.orange,
              themeProvider,
            ),
            _buildThemeOption(
              context,
              AppThemeMode.dark,
              AppLocalizations.of(context)?.darkTheme ?? 'Dark Theme',
              Icons.nightlight_round,
              Colors.indigo,
              themeProvider,
            ),
            _buildThemeOption(
              context,
              AppThemeMode.system,
              AppLocalizations.of(context)?.systemTheme ?? 'System Theme',
              Icons.brightness_auto,
              Colors.blue,
              themeProvider,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.close ?? 'Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    AppThemeMode mode,
    String title,
    IconData icon,
    Color color,
    ThemeProvider themeProvider,
  ) {
    final isSelected = themeProvider.themeMode == mode;

    return ListTile(
      leading: Icon(icon, color: isSelected ? color : Colors.grey),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? color : null,
        ),
      ),
      trailing: isSelected ? Icon(Icons.check, color: color) : null,
      onTap: () {
        themeProvider.setThemeMode(mode);
        Navigator.pop(context);
      },
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.aboutDopyjo ?? 'About DOPYJO',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)?.versionNumber ?? 'Version Number',
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)?.appDescription ?? 'App Description',
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)?.copyrightText ?? 'Copyright Text',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.close ?? 'Close'),
          ),
        ],
      ),
    );
  }
}
