class Food {
  final String id;
  final String name;
  final String description;
  final String category;
  final double calories; // per 100g
  final double protein; // grams per 100g
  final double carbohydrates; // grams per 100g
  final double fat; // grams per 100g
  final double fiber; // grams per 100g
  final double sugar; // grams per 100g
  final double sodium; // mg per 100g
  final List<String> vitamins;
  final List<String> minerals;
  final List<String> allergens;
  final String? imageUrl;
  final bool isRecommended;
  final String healthRisk; // 'low', 'medium', 'high'
  final Map<String, dynamic> metadata;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.fiber,
    required this.sugar,
    required this.sodium,
    this.vitamins = const [],
    this.minerals = const [],
    this.allergens = const [],
    this.imageUrl,
    this.isRecommended = false,
    this.healthRisk = 'low',
    this.metadata = const {},
  });

  // Calculate glycemic index category
  String get glycemicIndexCategory {
    if (carbohydrates < 10) return 'Low';
    if (carbohydrates < 20) return 'Medium';
    return 'High';
  }

  // Check if food is suitable for diabetes
  bool get isDiabetesFriendly {
    return sugar < 5 && carbohydrates < 15;
  }

  // Check if food is suitable for hypertension
  bool get isHypertensionFriendly {
    return sodium < 140;
  }

  // Check if food is suitable for high cholesterol
  bool get isCholesterolFriendly {
    return fat < 3 && !allergens.contains('dairy');
  }

  // Copy with method
  Food copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    double? calories,
    double? protein,
    double? carbohydrates,
    double? fat,
    double? fiber,
    double? sugar,
    double? sodium,
    List<String>? vitamins,
    List<String>? minerals,
    List<String>? allergens,
    String? imageUrl,
    bool? isRecommended,
    String? healthRisk,
    Map<String, dynamic>? metadata,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      sugar: sugar ?? this.sugar,
      sodium: sodium ?? this.sodium,
      vitamins: vitamins ?? this.vitamins,
      minerals: minerals ?? this.minerals,
      allergens: allergens ?? this.allergens,
      imageUrl: imageUrl ?? this.imageUrl,
      isRecommended: isRecommended ?? this.isRecommended,
      healthRisk: healthRisk ?? this.healthRisk,
      metadata: metadata ?? this.metadata,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'calories': calories,
      'protein': protein,
      'carbohydrates': carbohydrates,
      'fat': fat,
      'fiber': fiber,
      'sugar': sugar,
      'sodium': sodium,
      'vitamins': vitamins,
      'minerals': minerals,
      'allergens': allergens,
      'imageUrl': imageUrl,
      'isRecommended': isRecommended,
      'healthRisk': healthRisk,
      'metadata': metadata,
    };
  }

  // Create from Map
  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      calories: (map['calories'] ?? 0).toDouble(),
      protein: (map['protein'] ?? 0).toDouble(),
      carbohydrates: (map['carbohydrates'] ?? 0).toDouble(),
      fat: (map['fat'] ?? 0).toDouble(),
      fiber: (map['fiber'] ?? 0).toDouble(),
      sugar: (map['sugar'] ?? 0).toDouble(),
      sodium: (map['sodium'] ?? 0).toDouble(),
      vitamins: List<String>.from(map['vitamins'] ?? []),
      minerals: List<String>.from(map['minerals'] ?? []),
      allergens: List<String>.from(map['allergens'] ?? []),
      imageUrl: map['imageUrl'],
      isRecommended: map['isRecommended'] ?? false,
      healthRisk: map['healthRisk'] ?? 'low',
      metadata: Map<String, dynamic>.from(map['metadata'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'Food(id: $id, name: $name, category: $category, calories: $calories)';
  }
}

class Meal {
  final String id;
  final String name;
  final String type; // breakfast, lunch, dinner, snack
  final List<FoodItem> foods;
  final double totalCalories;
  final double totalProtein;
  final double totalCarbohydrates;
  final double totalFat;
  final double totalFiber;
  final double totalSugar;
  final double totalSodium;
  final DateTime date;
  final String? notes;

  Meal({
    required this.id,
    required this.name,
    required this.type,
    required this.foods,
    required this.totalCalories,
    required this.totalProtein,
    required this.totalCarbohydrates,
    required this.totalFat,
    required this.totalFiber,
    required this.totalSugar,
    required this.totalSodium,
    required this.date,
    this.notes,
  });

  // Copy with method
  Meal copyWith({
    String? id,
    String? name,
    String? type,
    List<FoodItem>? foods,
    double? totalCalories,
    double? totalProtein,
    double? totalCarbohydrates,
    double? totalFat,
    double? totalFiber,
    double? totalSugar,
    double? totalSodium,
    DateTime? date,
    String? notes,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      foods: foods ?? this.foods,
      totalCalories: totalCalories ?? this.totalCalories,
      totalProtein: totalProtein ?? this.totalProtein,
      totalCarbohydrates: totalCarbohydrates ?? this.totalCarbohydrates,
      totalFat: totalFat ?? this.totalFat,
      totalFiber: totalFiber ?? this.totalFiber,
      totalSugar: totalSugar ?? this.totalSugar,
      totalSodium: totalSodium ?? this.totalSodium,
      date: date ?? this.date,
      notes: notes ?? this.notes,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'foods': foods.map((food) => food.toMap()).toList(),
      'totalCalories': totalCalories,
      'totalProtein': totalProtein,
      'totalCarbohydrates': totalCarbohydrates,
      'totalFat': totalFat,
      'totalFiber': totalFiber,
      'totalSugar': totalSugar,
      'totalSodium': totalSodium,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }

  // Create from Map
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      foods:
          (map['foods'] as List?)
              ?.map((food) => FoodItem.fromMap(food))
              .toList() ??
          [],
      totalCalories: (map['totalCalories'] ?? 0).toDouble(),
      totalProtein: (map['totalProtein'] ?? 0).toDouble(),
      totalCarbohydrates: (map['totalCarbohydrates'] ?? 0).toDouble(),
      totalFat: (map['totalFat'] ?? 0).toDouble(),
      totalFiber: (map['totalFiber'] ?? 0).toDouble(),
      totalSugar: (map['totalSugar'] ?? 0).toDouble(),
      totalSodium: (map['totalSodium'] ?? 0).toDouble(),
      date: DateTime.parse(map['date']),
      notes: map['notes'],
    );
  }

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, type: $type, foods: ${foods.length})';
  }
}

class FoodItem {
  final String id;
  final Food food;
  final double quantity; // in grams
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  final double fiber;
  final double sugar;
  final double sodium;

  FoodItem({
    required this.id,
    required this.food,
    required this.quantity,
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.fiber,
    required this.sugar,
    required this.sodium,
  });

  // Copy with method
  FoodItem copyWith({
    String? id,
    Food? food,
    double? quantity,
    double? calories,
    double? protein,
    double? carbohydrates,
    double? fat,
    double? fiber,
    double? sugar,
    double? sodium,
  }) {
    return FoodItem(
      id: id ?? this.id,
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbohydrates: carbohydrates ?? this.carbohydrates,
      fat: fat ?? this.fat,
      fiber: fiber ?? this.fiber,
      sugar: sugar ?? this.sugar,
      sodium: sodium ?? this.sodium,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'food': food.toMap(),
      'quantity': quantity,
      'calories': calories,
      'protein': protein,
      'carbohydrates': carbohydrates,
      'fat': fat,
      'fiber': fiber,
      'sugar': sugar,
      'sodium': sodium,
    };
  }

  // Create from Map
  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      id: map['id'] ?? '',
      food: Food.fromMap(map['food']),
      quantity: (map['quantity'] ?? 0).toDouble(),
      calories: (map['calories'] ?? 0).toDouble(),
      protein: (map['protein'] ?? 0).toDouble(),
      carbohydrates: (map['carbohydrates'] ?? 0).toDouble(),
      fat: (map['fat'] ?? 0).toDouble(),
      fiber: (map['fiber'] ?? 0).toDouble(),
      sugar: (map['sugar'] ?? 0).toDouble(),
      sodium: (map['sodium'] ?? 0).toDouble(),
    );
  }

  @override
  String toString() {
    return 'FoodItem(id: $id, food: ${food.name}, quantity: $quantity g)';
  }
}

class NutritionPlan {
  final String id;
  final String name;
  final String description;
  final String userId;
  final List<Meal> meals;
  final double dailyCalories;
  final double dailyProtein;
  final double dailyCarbohydrates;
  final double dailyFat;
  final double dailyFiber;
  final String dietType; // vegetarian, vegan, keto, etc.
  final bool isActive;
  final DateTime createdAt;
  final DateTime? completedAt;

  NutritionPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
    required this.meals,
    required this.dailyCalories,
    required this.dailyProtein,
    required this.dailyCarbohydrates,
    required this.dailyFat,
    required this.dailyFiber,
    required this.dietType,
    this.isActive = true,
    required this.createdAt,
    this.completedAt,
  });

  // Copy with method
  NutritionPlan copyWith({
    String? id,
    String? name,
    String? description,
    String? userId,
    List<Meal>? meals,
    double? dailyCalories,
    double? dailyProtein,
    double? dailyCarbohydrates,
    double? dailyFat,
    double? dailyFiber,
    String? dietType,
    bool? isActive,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return NutritionPlan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      meals: meals ?? this.meals,
      dailyCalories: dailyCalories ?? this.dailyCalories,
      dailyProtein: dailyProtein ?? this.dailyProtein,
      dailyCarbohydrates: dailyCarbohydrates ?? this.dailyCarbohydrates,
      dailyFat: dailyFat ?? this.dailyFat,
      dailyFiber: dailyFiber ?? this.dailyFiber,
      dietType: dietType ?? this.dietType,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'userId': userId,
      'meals': meals.map((meal) => meal.toMap()).toList(),
      'dailyCalories': dailyCalories,
      'dailyProtein': dailyProtein,
      'dailyCarbohydrates': dailyCarbohydrates,
      'dailyFat': dailyFat,
      'dailyFiber': dailyFiber,
      'dietType': dietType,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  // Create from Map
  factory NutritionPlan.fromMap(Map<String, dynamic> map) {
    return NutritionPlan(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      userId: map['userId'] ?? '',
      meals:
          (map['meals'] as List?)?.map((meal) => Meal.fromMap(meal)).toList() ??
          [],
      dailyCalories: (map['dailyCalories'] ?? 0).toDouble(),
      dailyProtein: (map['dailyProtein'] ?? 0).toDouble(),
      dailyCarbohydrates: (map['dailyCarbohydrates'] ?? 0).toDouble(),
      dailyFat: (map['dailyFat'] ?? 0).toDouble(),
      dailyFiber: (map['dailyFiber'] ?? 0).toDouble(),
      dietType: map['dietType'] ?? '',
      isActive: map['isActive'] ?? true,
      createdAt: DateTime.parse(map['createdAt']),
      completedAt: map['completedAt'] != null
          ? DateTime.parse(map['completedAt'])
          : null,
    );
  }

  @override
  String toString() {
    return 'NutritionPlan(id: $id, name: $name, meals: ${meals.length})';
  }
}
