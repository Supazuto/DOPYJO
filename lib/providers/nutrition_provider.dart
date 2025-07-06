import 'package:flutter/foundation.dart';

class Food {
  final String id;
  final String name;
  final String description;
  final String category;
  final double calories;
  final double protein;
  final double carbs;
  final double fats;
  final double fiber;
  final double sugar;
  final double sodium;
  final String imageUrl;
  final List<String> nutrients;
  final List<String> allergens;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.fiber,
    required this.sugar,
    required this.sodium,
    required this.imageUrl,
    required this.nutrients,
    required this.allergens,
  });
}

class Meal {
  final String id;
  final String name;
  final String type; // breakfast, lunch, dinner, snack
  final DateTime date;
  final List<Food> foods;
  final double totalCalories;
  final String? notes;

  Meal({
    required this.id,
    required this.name,
    required this.type,
    required this.date,
    required this.foods,
    required this.totalCalories,
    this.notes,
  });
}

class NutritionProvider extends ChangeNotifier {
  List<Food> _foods = [];
  final List<Meal> _meals = [];
  final List<Food> _favoriteFoods = [];
  Map<String, double> _dailyNutrition = {
    'calories': 0.0,
    'protein': 0.0,
    'carbs': 0.0,
    'fats': 0.0,
    'fiber': 0.0,
    'sugar': 0.0,
    'sodium': 0.0,
  };

  // Getters
  List<Food> get foods => _foods;
  List<Meal> get meals => _meals;
  List<Food> get favoriteFoods => _favoriteFoods;
  Map<String, double> get dailyNutrition => _dailyNutrition;

  // Add food to favorites
  void toggleFavorite(Food food) {
    if (_favoriteFoods.any((f) => f.id == food.id)) {
      _favoriteFoods.removeWhere((f) => f.id == food.id);
    } else {
      _favoriteFoods.add(food);
    }
    notifyListeners();
  }

  // Add meal
  void addMeal(Meal meal) {
    _meals.add(meal);
    _updateDailyNutrition();
    notifyListeners();
  }

  // Remove meal
  void removeMeal(String mealId) {
    _meals.removeWhere((meal) => meal.id == mealId);
    _updateDailyNutrition();
    notifyListeners();
  }

  // Get meals by date
  List<Meal> getMealsByDate(DateTime date) {
    return _meals
        .where(
          (meal) =>
              meal.date.year == date.year &&
              meal.date.month == date.month &&
              meal.date.day == date.day,
        )
        .toList();
  }

  // Get meals by type
  List<Meal> getMealsByType(String type) {
    return _meals.where((meal) => meal.type == type).toList();
  }

  // Search foods
  List<Food> searchFoods(String query) {
    return _foods
        .where(
          (food) =>
              food.name.toLowerCase().contains(query.toLowerCase()) ||
              food.description.toLowerCase().contains(query.toLowerCase()) ||
              food.category.toLowerCase().contains(query.toLowerCase()) ||
              food.nutrients.any(
                (nutrient) =>
                    nutrient.toLowerCase().contains(query.toLowerCase()),
              ),
        )
        .toList();
  }

  // Get foods by category
  List<Food> getFoodsByCategory(String category) {
    return _foods.where((food) => food.category == category).toList();
  }

  // Update daily nutrition
  void _updateDailyNutrition() {
    final today = DateTime.now();
    final todayMeals = getMealsByDate(today);

    _dailyNutrition = {
      'calories': 0.0,
      'protein': 0.0,
      'carbs': 0.0,
      'fats': 0.0,
      'fiber': 0.0,
      'sugar': 0.0,
      'sodium': 0.0,
    };

    for (final meal in todayMeals) {
      for (final food in meal.foods) {
        _dailyNutrition['calories'] =
            (_dailyNutrition['calories'] ?? 0) + food.calories;
        _dailyNutrition['protein'] =
            (_dailyNutrition['protein'] ?? 0) + food.protein;
        _dailyNutrition['carbs'] = (_dailyNutrition['carbs'] ?? 0) + food.carbs;
        _dailyNutrition['fats'] = (_dailyNutrition['fats'] ?? 0) + food.fats;
        _dailyNutrition['fiber'] = (_dailyNutrition['fiber'] ?? 0) + food.fiber;
        _dailyNutrition['sugar'] = (_dailyNutrition['sugar'] ?? 0) + food.sugar;
        _dailyNutrition['sodium'] =
            (_dailyNutrition['sodium'] ?? 0) + food.sodium;
      }
    }
  }

  // Load sample foods
  void loadSampleFoods() {
    _foods = [
      Food(
        id: '1',
        name: 'Grilled Chicken Breast',
        description: 'Lean protein source',
        category: 'Protein',
        calories: 165,
        protein: 31,
        carbs: 0,
        fats: 3.6,
        fiber: 0,
        sugar: 0,
        sodium: 74,
        imageUrl: 'assets/images/foods/chicken_breast.jpg',
        nutrients: ['Vitamin B6', 'Niacin', 'Selenium'],
        allergens: [],
      ),
      Food(
        id: '2',
        name: 'Brown Rice',
        description: 'Whole grain carbohydrate',
        category: 'Grains',
        calories: 216,
        protein: 4.5,
        carbs: 45,
        fats: 1.8,
        fiber: 3.5,
        sugar: 0.4,
        sodium: 10,
        imageUrl: 'assets/images/foods/brown_rice.jpg',
        nutrients: ['Manganese', 'Selenium', 'Magnesium'],
        allergens: [],
      ),
      Food(
        id: '3',
        name: 'Broccoli',
        description: 'Nutritious green vegetable',
        category: 'Vegetables',
        calories: 55,
        protein: 3.7,
        carbs: 11.2,
        fats: 0.6,
        fiber: 5.2,
        sugar: 2.6,
        sodium: 33,
        imageUrl: 'assets/images/foods/broccoli.jpg',
        nutrients: ['Vitamin C', 'Vitamin K', 'Folate'],
        allergens: [],
      ),
      Food(
        id: '4',
        name: 'Salmon',
        description: 'Omega-3 rich fish',
        category: 'Protein',
        calories: 208,
        protein: 25,
        carbs: 0,
        fats: 12,
        fiber: 0,
        sugar: 0,
        sodium: 59,
        imageUrl: 'assets/images/foods/salmon.jpg',
        nutrients: ['Omega-3', 'Vitamin D', 'B12'],
        allergens: ['Fish'],
      ),
      Food(
        id: '5',
        name: 'Greek Yogurt',
        description: 'High-protein dairy product',
        category: 'Dairy',
        calories: 59,
        protein: 10,
        carbs: 3.6,
        fats: 0.4,
        fiber: 0,
        sugar: 3.2,
        sodium: 36,
        imageUrl: 'assets/images/foods/greek_yogurt.jpg',
        nutrients: ['Calcium', 'Probiotics', 'B12'],
        allergens: ['Milk'],
      ),
      Food(
        id: '6',
        name: 'Quinoa',
        description: 'Complete protein grain',
        category: 'Grains',
        calories: 222,
        protein: 8.1,
        carbs: 39.4,
        fats: 3.6,
        fiber: 5.2,
        sugar: 1.6,
        sodium: 13,
        imageUrl: 'assets/images/foods/quinoa.jpg',
        nutrients: ['Iron', 'Magnesium', 'Zinc'],
        allergens: [],
      ),
      Food(
        id: '7',
        name: 'Spinach',
        description: 'Iron-rich leafy green',
        category: 'Vegetables',
        calories: 23,
        protein: 2.9,
        carbs: 3.6,
        fats: 0.4,
        fiber: 2.2,
        sugar: 0.4,
        sodium: 79,
        imageUrl: 'assets/images/foods/spinach.jpg',
        nutrients: ['Iron', 'Vitamin K', 'Folate'],
        allergens: [],
      ),
      Food(
        id: '8',
        name: 'Almonds',
        description: 'Healthy nuts',
        category: 'Nuts',
        calories: 164,
        protein: 6,
        carbs: 6.1,
        fats: 14.2,
        fiber: 3.5,
        sugar: 1.2,
        sodium: 0,
        imageUrl: 'assets/images/foods/almonds.jpg',
        nutrients: ['Vitamin E', 'Magnesium', 'Fiber'],
        allergens: ['Tree nuts'],
      ),
    ];
    notifyListeners();
  }

  // Reset all data
  void reset() {
    _foods.clear();
    _meals.clear();
    _favoriteFoods.clear();
    _dailyNutrition = {
      'calories': 0.0,
      'protein': 0.0,
      'carbs': 0.0,
      'fats': 0.0,
      'fiber': 0.0,
      'sugar': 0.0,
      'sodium': 0.0,
    };
    notifyListeners();
  }
}
