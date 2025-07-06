import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

import 'glass_morphism_container.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const SimpleAppBar({
    super.key,
    this.title = 'DOPYJO',
    this.actions,
    this.showBackButton = false,
    this.onBackPressed,
    this.showNotificationIcon = true,
  });

  final bool showNotificationIcon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimary,
                size: 20,
              ),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
      actions: [
        if (showNotificationIcon)
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusMedium,
            blur: 8,
            margin: const EdgeInsets.only(right: AppConstants.marginMedium),
            backgroundColor: isDark
                ? AppColors.surfaceDark.withValues(alpha: 0.2)
                : Colors.white.withValues(alpha: 0.2),
            child: IconButton(
              icon: Icon(
                Icons.notifications,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimary,
              ),
              onPressed: () {
                // TODO: Show notifications
              },
            ),
          ),
        if (actions != null) ...actions!,
      ],
      centerTitle: false,
      toolbarHeight: 60,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
