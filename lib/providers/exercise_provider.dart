import 'package:flutter/foundation.dart';

class Exercise {
  final String id;
  final String name;
  final String description;
  final String category;
  final String difficulty;
  final int duration; // in minutes
  final int calories;
  final String imageUrl;
  final List<String> instructions;
  final List<String> equipment;
  final List<String> targetMuscles;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.difficulty,
    required this.duration,
    required this.calories,
    required this.imageUrl,
    required this.instructions,
    required this.equipment,
    required this.targetMuscles,
  });
}

class ExerciseProvider extends ChangeNotifier {
  List<Exercise> _exercises = [];
  final List<Exercise> _favoriteExercises = [];
  final List<Exercise> _completedExercises = [];
  final Map<String, int> _exerciseStats = {}; // exerciseId -> completion count

  // Getters
  List<Exercise> get exercises => _exercises;
  List<Exercise> get favoriteExercises => _favoriteExercises;
  List<Exercise> get completedExercises => _completedExercises;
  Map<String, int> get exerciseStats => _exerciseStats;

  // Add exercise to favorites
  void toggleFavorite(Exercise exercise) {
    if (_favoriteExercises.any((e) => e.id == exercise.id)) {
      _favoriteExercises.removeWhere((e) => e.id == exercise.id);
    } else {
      _favoriteExercises.add(exercise);
    }
    notifyListeners();
  }

  // Mark exercise as completed
  void markCompleted(Exercise exercise) {
    if (!_completedExercises.any((e) => e.id == exercise.id)) {
      _completedExercises.add(exercise);
    }

    _exerciseStats[exercise.id] = (_exerciseStats[exercise.id] ?? 0) + 1;
    notifyListeners();
  }

  // Get exercises by category
  List<Exercise> getExercisesByCategory(String category) {
    return _exercises
        .where((exercise) => exercise.category == category)
        .toList();
  }

  // Get exercises by difficulty
  List<Exercise> getExercisesByDifficulty(String difficulty) {
    return _exercises
        .where((exercise) => exercise.difficulty == difficulty)
        .toList();
  }

  // Search exercises
  List<Exercise> searchExercises(String query) {
    return _exercises
        .where(
          (exercise) =>
              exercise.name.toLowerCase().contains(query.toLowerCase()) ||
              exercise.description.toLowerCase().contains(
                query.toLowerCase(),
              ) ||
              exercise.category.toLowerCase().contains(query.toLowerCase()) ||
              exercise.targetMuscles.any(
                (muscle) => muscle.toLowerCase().contains(query.toLowerCase()),
              ),
        )
        .toList();
  }

  // Get total calories burned today
  int getTotalCaloriesToday() {
    return _completedExercises.fold(
      0,
      (sum, exercise) => sum + exercise.calories,
    );
  }

  // Get total exercise time today
  int getTotalExerciseTimeToday() {
    return _completedExercises.fold(
      0,
      (sum, exercise) => sum + exercise.duration,
    );
  }

  // Load sample exercises
  void loadSampleExercises() {
    _exercises = [
      Exercise(
        id: '1',
        name: 'Walking',
        description: 'Low-impact cardiovascular exercise',
        category: 'Cardio',
        difficulty: 'Beginner',
        duration: 30,
        calories: 150,
        imageUrl: 'assets/images/exercises/walking.jpg',
        instructions: [
          'Start with a comfortable pace',
          'Maintain good posture',
          'Swing your arms naturally',
          'Breathe regularly',
        ],
        equipment: ['Comfortable shoes'],
        targetMuscles: ['Legs', 'Core'],
      ),
      Exercise(
        id: '2',
        name: 'Push-ups',
        description: 'Bodyweight exercise for upper body strength',
        category: 'Strength',
        difficulty: 'Intermediate',
        duration: 15,
        calories: 100,
        imageUrl: 'assets/images/exercises/pushups.jpg',
        instructions: [
          'Start in plank position',
          'Lower your body',
          'Push back up',
          'Keep your core tight',
        ],
        equipment: [],
        targetMuscles: ['Chest', 'Triceps', 'Shoulders'],
      ),
      Exercise(
        id: '3',
        name: 'Squats',
        description: 'Lower body strength exercise',
        category: 'Strength',
        difficulty: 'Beginner',
        duration: 20,
        calories: 120,
        imageUrl: 'assets/images/exercises/squats.jpg',
        instructions: [
          'Stand with feet shoulder-width apart',
          'Lower your body as if sitting',
          'Keep your knees behind toes',
          'Return to standing position',
        ],
        equipment: [],
        targetMuscles: ['Quadriceps', 'Glutes', 'Hamstrings'],
      ),
      Exercise(
        id: '4',
        name: 'Yoga',
        description: 'Mind-body exercise for flexibility and relaxation',
        category: 'Flexibility',
        difficulty: 'Beginner',
        duration: 45,
        calories: 180,
        imageUrl: 'assets/images/exercises/yoga.jpg',
        instructions: [
          'Find a quiet space',
          'Start with basic poses',
          'Focus on breathing',
          'Listen to your body',
        ],
        equipment: ['Yoga mat'],
        targetMuscles: ['Full body', 'Core'],
      ),
      Exercise(
        id: '5',
        name: 'Cycling',
        description: 'Cardiovascular exercise on a stationary bike',
        category: 'Cardio',
        difficulty: 'Beginner',
        duration: 30,
        calories: 200,
        imageUrl: 'assets/images/exercises/cycling.jpg',
        instructions: [
          'Adjust seat height',
          'Start with low resistance',
          'Maintain steady pace',
          'Keep your back straight',
        ],
        equipment: ['Stationary bike'],
        targetMuscles: ['Legs', 'Core'],
      ),
    ];
    notifyListeners();
  }

  // Reset all data
  void reset() {
    _exercises.clear();
    _favoriteExercises.clear();
    _completedExercises.clear();
    _exerciseStats.clear();
    notifyListeners();
  }
}
