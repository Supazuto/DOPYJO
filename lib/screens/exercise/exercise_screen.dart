import 'package:flutter/material.dart';
import 'package:dopyjo_flutter/widgets/glass_morphism_container.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      appBar: AppBar(
        title: const Text('Exercise'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Workouts'),
            Tab(text: 'Exercises'),
            Tab(text: 'Progress'),
          ],
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
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildWorkoutsTab(),
            _buildExercisesTab(),
            _buildProgressTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutsTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick Start Section
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Start',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildQuickStartButton(
                  'Cardio',
                  Icons.directions_run,
                  AppColors.cardio,
                ),
                _buildQuickStartButton(
                  'Strength',
                  Icons.fitness_center,
                  AppColors.strength,
                ),
                _buildQuickStartButton(
                  'Flexibility',
                  Icons.self_improvement,
                  AppColors.flexibility,
                ),
                _buildQuickStartButton(
                  'Balance',
                  Icons.accessibility_new,
                  AppColors.balance,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingLarge),

          // Today's Workout
          Text(
            'Today\'s Workout',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          _buildWorkoutCard(
            'Upper Body Strength',
            '45 min',
            Icons.fitness_center,
            AppColors.strength,
          ),
          _buildWorkoutCard(
            'Cardio Session',
            '30 min',
            Icons.directions_run,
            AppColors.cardio,
          ),
        ],
      ),
    );
  }

  Widget _buildExercisesTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exercise Categories
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusXLarge,
            blur: 8,
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
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
                  'Exercise Categories',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildExerciseCategory(
                  'Push-ups',
                  'Chest, Triceps',
                  Icons.accessibility_new,
                  AppColors.strength,
                ),
                _buildExerciseCategory(
                  'Squats',
                  'Legs, Glutes',
                  Icons.accessibility_new,
                  AppColors.strength,
                ),
                _buildExerciseCategory(
                  'Planks',
                  'Core',
                  Icons.accessibility_new,
                  AppColors.strength,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Weekly Progress
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weekly Progress',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildProgressItem('Workouts', '5', '7'),
                _buildProgressItem('Calories Burned', '2,450', '3,000'),
                _buildProgressItem('Active Minutes', '180', '210'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStartButton(String title, IconData icon, Color color) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GlassMorphismContainer(
        borderRadius: AppConstants.borderRadiusMedium,
        blur: 5,
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        backgroundColor: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
        child: Row(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(width: AppConstants.paddingMedium),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Icon(Icons.play_circle_outline, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(
    String title,
    String duration,
    IconData icon,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GlassMorphismContainer(
        borderRadius: AppConstants.borderRadiusMedium,
        blur: 5,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    duration,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.play_circle_outline, color: color, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseCategory(
    String name,
    String muscles,
    IconData icon,
    Color color,
  ) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                Text(
                  muscles,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondary,
                  ),
                ),
              ],
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

  Widget _buildProgressItem(String label, String current, String target) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
          ),
          Text(
            '$current / $target',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
