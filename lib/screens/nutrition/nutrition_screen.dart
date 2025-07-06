import 'package:flutter/material.dart';
import 'package:dopyjo_flutter/widgets/glass_morphism_container.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen>
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
        title: const Text('Nutrition'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Meal Plan'),
            Tab(text: 'Food Log'),
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
            _buildOverviewTab(),
            _buildMealPlanTab(),
            _buildFoodLogTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Daily Nutrition Summary with glass morphism
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusXLarge,
            blur: 10,
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            backgroundColor: isDark
                ? AppColors.surfaceDark.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.15),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Nutrition Summary',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingLarge),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNutritionMetric(
                      'Calories',
                      '1,200',
                      '2,000',
                      AppColors.primary,
                    ),
                    _buildNutritionMetric(
                      'Protein',
                      '65',
                      '100',
                      AppColors.protein,
                    ),
                    _buildNutritionMetric(
                      'Carbs',
                      '150',
                      '250',
                      AppColors.carbs,
                    ),
                    _buildNutritionMetric('Fats', '45', '70', AppColors.fats),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingLarge),

          // Nutrition Goals with glass effect
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
                  'Nutrition Goals',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildGoalProgress('Calories', 1200, 2000, AppColors.primary),
                _buildGoalProgress('Protein', 65, 100, AppColors.protein),
                _buildGoalProgress('Carbs', 150, 250, AppColors.carbs),
                _buildGoalProgress('Fats', 45, 70, AppColors.fats),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingLarge),

          // Recommendations with glass morphism
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GlassMorphismContainer(
                      borderRadius: AppConstants.borderRadiusMedium,
                      blur: 5,
                      padding: const EdgeInsets.all(AppConstants.paddingSmall),
                      backgroundColor: AppColors.accent.withValues(alpha: 0.15),
                      child: Icon(
                        Icons.lightbulb,
                        color: AppColors.accent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingSmall),
                    Text(
                      'Smart Recommendations',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildRecommendation(
                  'Increase protein intake',
                  'Add lean meats or legumes',
                ),
                _buildRecommendation(
                  'Reduce refined carbs',
                  'Choose whole grains instead',
                ),
                _buildRecommendation(
                  'Add more vegetables',
                  'Aim for 5 servings daily',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealPlanTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Weekly Meal Plan with glass effect
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusXLarge,
            blur: 10,
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            backgroundColor: isDark
                ? AppColors.surfaceDark.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.15),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.2),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weekly Meal Plan',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildMealDay('Monday', 'Grilled Chicken Salad', '320 kcal'),
                _buildMealDay('Tuesday', 'Salmon with Vegetables', '450 kcal'),
                _buildMealDay('Wednesday', 'Quinoa Bowl', '380 kcal'),
                _buildMealDay('Thursday', 'Turkey Wrap', '290 kcal'),
                _buildMealDay('Friday', 'Fish Tacos', '410 kcal'),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingLarge),

          // Meal Prep Tips with glass morphism
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusXLarge,
            blur: 8,
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            backgroundColor: AppColors.success.withValues(alpha: 0.1),
            border: Border.all(
              color: AppColors.success.withValues(alpha: 0.2),
              width: 1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GlassMorphismContainer(
                      borderRadius: 12,
                      blur: 5,
                      padding: const EdgeInsets.all(8),
                      backgroundColor: AppColors.success.withValues(
                        alpha: 0.15,
                      ),
                      child: Icon(
                        Icons.restaurant,
                        color: AppColors.success,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: AppConstants.paddingSmall),
                    Text(
                      'Meal Prep Tips',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.success,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildTip(
                  'Plan meals on Sunday',
                  'Prep ingredients for the week',
                ),
                _buildTip('Use batch cooking', 'Cook once, eat multiple times'),
                _buildTip('Store properly', 'Use airtight containers'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodLogTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Today's Food Log with glass effect
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
                  'Today\'s Food Log',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingMedium),
                _buildFoodLogItem(
                  'Breakfast',
                  'Oatmeal with berries',
                  '280 kcal',
                  Icons.wb_sunny,
                ),
                _buildFoodLogItem(
                  'Lunch',
                  'Grilled chicken salad',
                  '320 kcal',
                  Icons.wb_sunny_outlined,
                ),
                _buildFoodLogItem(
                  'Dinner',
                  'Salmon with vegetables',
                  '450 kcal',
                  Icons.nightlight,
                ),
                _buildFoodLogItem(
                  'Snack',
                  'Apple & nuts',
                  '200 kcal',
                  Icons.coffee,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingLarge),

          // Add Food Button with glass morphism
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusXLarge,
            blur: 8,
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.2),
              width: 1,
            ),
            child: Column(
              children: [
                GlassMorphismContainer(
                  borderRadius: AppConstants.borderRadiusMedium,
                  blur: 5,
                  padding: const EdgeInsets.all(AppConstants.paddingMedium),
                  backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.add, color: AppColors.primary, size: 32),
                ),
                const SizedBox(height: AppConstants.paddingSmall),
                Text(
                  'Add Food',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingSmall),
                Text(
                  'Log your meals and track nutrition',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionMetric(
    String label,
    String current,
    String target,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        GlassMorphismContainer(
          borderRadius: AppConstants.borderRadiusLarge,
          blur: 5,
          padding: const EdgeInsets.all(12),
          backgroundColor: color.withValues(alpha: 0.1),
          child: Icon(_getNutritionIcon(label), color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          current,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
          ),
        ),
        Text(
          'of $target',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondary,
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

  Widget _buildGoalProgress(
    String label,
    int current,
    int target,
    Color color,
  ) {
    final progress = current / target;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '$current / $target',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          GlassMorphismContainer(
            borderRadius: 10,
            blur: 3,
            padding: EdgeInsets.zero,
            backgroundColor: color.withValues(alpha: 0.1),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendation(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: AppColors.accent, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
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

  Widget _buildMealDay(String day, String meal, String calories) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: 12,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Text(
              day,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                Text(
                  calories,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark
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

  Widget _buildTip(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.tips_and_updates, color: AppColors.success, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
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

  Widget _buildFoodLogItem(
    String meal,
    String food,
    String calories,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: 12,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.warning.withValues(alpha: 0.1),
            child: Icon(icon, color: AppColors.warning, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  food,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            calories,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getNutritionIcon(String label) {
    switch (label.toLowerCase()) {
      case 'calories':
        return Icons.local_fire_department;
      case 'protein':
        return Icons.fitness_center;
      case 'carbs':
        return Icons.grain;
      case 'fats':
        return Icons.opacity;
      default:
        return Icons.restaurant;
    }
  }
}
