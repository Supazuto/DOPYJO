import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/glass_morphism_container.dart';
import '../../widgets/optimized_list_widget.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen>
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
        title: Text(AppLocalizations.of(context)?.food ?? 'Food'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: AppLocalizations.of(context)?.today ?? 'Today'),
            Tab(text: AppLocalizations.of(context)?.search ?? 'Search'),
            Tab(text: 'History'),
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
          children: [_buildTodayTab(), _buildSearchTab(), _buildHistoryTab()],
        ),
      ),
    );
  }

  Widget _buildTodayTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Daily Summary Card with glass morphism
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
                Text(
                  AppLocalizations.of(context)?.dailySummary ?? 'Daily Summary',
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
                    _buildNutritionInfo(
                      context,
                      AppLocalizations.of(context)?.calories ?? 'Calories',
                      '1,200',
                      'kcal',
                      Colors.orange,
                    ),
                    _buildNutritionInfo(
                      context,
                      AppLocalizations.of(context)?.protein ?? 'Protein',
                      '65',
                      'g',
                      AppColors.protein,
                    ),
                    _buildNutritionInfo(
                      context,
                      AppLocalizations.of(context)?.carbs ?? 'Carbs',
                      '150',
                      'g',
                      AppColors.carbs,
                    ),
                    _buildNutritionInfo(
                      context,
                      AppLocalizations.of(context)?.fats ?? 'Fats',
                      '45',
                      'g',
                      AppColors.fats,
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: AppConstants.paddingLarge),

          // Meal Sections with glass effect
          _buildMealSection(
            context,
            AppLocalizations.of(context)?.breakfast ?? 'Breakfast',
            Icons.wb_sunny,
            AppColors.warning,
            [
              {
                'name': AppLocalizations.of(context)?.brownRice ?? 'Brown Rice',
                'calories': '200 kcal',
              },
              {
                'name': AppLocalizations.of(context)?.boiledEgg ?? 'Boiled Egg',
                'calories': '70 kcal',
              },
              {
                'name': AppLocalizations.of(context)?.freshMilk ?? 'Fresh Milk',
                'calories': '120 kcal',
              },
            ],
          ),

          const SizedBox(height: AppConstants.paddingMedium),

          _buildMealSection(
            context,
            AppLocalizations.of(context)?.lunch ?? 'Lunch',
            Icons.wb_sunny_outlined,
            AppColors.accent,
            [
              {
                'name':
                    AppLocalizations.of(context)?.shrimpFriedRice ??
                    'Shrimp Fried Rice',
                'calories': '350 kcal',
              },
              {
                'name': AppLocalizations.of(context)?.orange ?? 'Orange',
                'calories': '60 kcal',
              },
            ],
          ),

          const SizedBox(height: AppConstants.paddingMedium),

          _buildMealSection(
            context,
            AppLocalizations.of(context)?.dinner ?? 'Dinner',
            Icons.nightlight,
            AppColors.primary,
            [
              {
                'name':
                    AppLocalizations.of(context)?.vegetableSalad ??
                    'Vegetable Salad',
                'calories': '150 kcal',
              },
              {
                'name':
                    AppLocalizations.of(context)?.grilledChickenBreast ??
                    'Grilled Chicken Breast',
                'calories': '180 kcal',
              },
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        // Search Bar with glass effect
        Padding(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          child: GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusXLarge,
            blur: 8,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            backgroundColor: isDark
                ? AppColors.surfaceDark.withValues(alpha: 0.1)
                : Colors.white.withValues(alpha: 0.1),
            border: Border.all(
              color: isDark
                  ? AppColors.borderDark.withValues(alpha: 0.2)
                  : AppColors.border.withValues(alpha: 0.2),
              width: 1,
            ),
            child: TextField(
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText:
                    AppLocalizations.of(context)?.search ?? 'Search food...',
                hintStyle: const TextStyle(color: AppColors.textSecondary),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.textSecondary,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        // Popular Foods with glass morphism
        Expanded(
          child: OptimizedListView<int>(
            items: List.generate(10, (index) => index),
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
            ),
            itemBuilder: (context, index, listIndex) {
              return _buildFoodItem(context, index);
            },
            keyPrefix: 'food_item',
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryTab() {
    return OptimizedListView<int>(
      items: List.generate(20, (index) => index),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      itemBuilder: (context, index, listIndex) {
        return _buildHistoryItem(context, index);
      },
      keyPrefix: 'history_item',
    );
  }

  Widget _buildNutritionInfo(
    BuildContext context,
    String label,
    String value,
    String unit,
    Color color,
  ) {
    return Column(
      children: [
        GlassMorphismContainer(
          borderRadius: AppConstants.borderRadiusLarge,
          blur: 5,
          padding: const EdgeInsets.all(12),
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          child: Icon(Icons.restaurant, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          unit,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white.withValues(alpha: 0.9),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMealSection(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    List<Map<String, String>> foods,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassMorphismContainer(
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
          Row(
            children: [
              GlassMorphismContainer(
                borderRadius: AppConstants.borderRadiusMedium,
                blur: 5,
                padding: const EdgeInsets.all(8),
                backgroundColor: color.withValues(alpha: 0.1),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: AppConstants.paddingMedium),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.paddingMedium),
          ...foods.map((food) => _buildFoodItemInMeal(context, food)),
        ],
      ),
    );
  }

  Widget _buildFoodItemInMeal(BuildContext context, Map<String, String> food) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            food['name']!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            food['calories']!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(BuildContext context, int index) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final foods = [
      {'name': 'Chicken Breast', 'calories': '165 kcal', 'protein': '31g'},
      {'name': 'Salmon', 'calories': '208 kcal', 'protein': '25g'},
      {'name': 'Quinoa', 'calories': '120 kcal', 'protein': '4.4g'},
      {'name': 'Sweet Potato', 'calories': '103 kcal', 'protein': '2g'},
      {'name': 'Greek Yogurt', 'calories': '59 kcal', 'protein': '10g'},
    ];

    final food = foods[index % foods.length];

    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusLarge,
      blur: 8,
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.05)
          : Colors.white.withValues(alpha: 0.05),
      border: Border.all(
        color: isDark
            ? AppColors.borderDark.withValues(alpha: 0.2)
            : AppColors.border.withValues(alpha: 0.2),
        width: 1,
      ),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusMedium,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Icon(Icons.restaurant, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food['name']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${food['calories']} • ${food['protein']} protein',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppColors.primary,
            ),
            onPressed: () {
              // TODO: Add food to daily log
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, int index) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final historyItems = [
      {'date': 'Today', 'food': 'Chicken Breast', 'calories': '165 kcal'},
      {'date': 'Yesterday', 'food': 'Salmon', 'calories': '208 kcal'},
      {'date': '2 days ago', 'food': 'Quinoa Bowl', 'calories': '320 kcal'},
    ];

    final item = historyItems[index % historyItems.length];

    return GlassMorphismContainer(
      borderRadius: AppConstants.borderRadiusLarge,
      blur: 8,
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.05)
          : Colors.white.withValues(alpha: 0.05),
      border: Border.all(
        color: isDark
            ? AppColors.borderDark.withValues(alpha: 0.2)
            : AppColors.border.withValues(alpha: 0.2),
        width: 1,
      ),
      child: Row(
        children: [
          GlassMorphismContainer(
            borderRadius: AppConstants.borderRadiusMedium,
            blur: 5,
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.info.withValues(alpha: 0.1),
            child: Icon(Icons.history, color: AppColors.info, size: 20),
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['food']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${item['date']} • ${item['calories']}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.replay, color: AppColors.info),
            onPressed: () {
              // TODO: Re-add to today's log
            },
          ),
        ],
      ),
    );
  }
}
