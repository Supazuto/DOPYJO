class Exercise {
  final String id;
  final String name;
  final String description;
  final String category;
  final String difficulty;
  final int duration; // in minutes
  final int caloriesBurn; // calories per hour
  final List<String> muscleGroups;
  final List<String> equipment;
  final String? imageUrl;
  final String? videoUrl;
  final List<String> instructions;
  final List<String> benefits;
  final List<String> precautions;
  final bool isRecommended;
  final Map<String, dynamic> metadata;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.difficulty,
    required this.duration,
    required this.caloriesBurn,
    required this.muscleGroups,
    required this.equipment,
    this.imageUrl,
    this.videoUrl,
    this.instructions = const [],
    this.benefits = const [],
    this.precautions = const [],
    this.isRecommended = false,
    this.metadata = const {},
  });

  // Copy with method
  Exercise copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    String? difficulty,
    int? duration,
    int? caloriesBurn,
    List<String>? muscleGroups,
    List<String>? equipment,
    String? imageUrl,
    String? videoUrl,
    List<String>? instructions,
    List<String>? benefits,
    List<String>? precautions,
    bool? isRecommended,
    Map<String, dynamic>? metadata,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      duration: duration ?? this.duration,
      caloriesBurn: caloriesBurn ?? this.caloriesBurn,
      muscleGroups: muscleGroups ?? this.muscleGroups,
      equipment: equipment ?? this.equipment,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      instructions: instructions ?? this.instructions,
      benefits: benefits ?? this.benefits,
      precautions: precautions ?? this.precautions,
      isRecommended: isRecommended ?? this.isRecommended,
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
      'difficulty': difficulty,
      'duration': duration,
      'caloriesBurn': caloriesBurn,
      'muscleGroups': muscleGroups,
      'equipment': equipment,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
      'instructions': instructions,
      'benefits': benefits,
      'precautions': precautions,
      'isRecommended': isRecommended,
      'metadata': metadata,
    };
  }

  // Create from Map
  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      difficulty: map['difficulty'] ?? '',
      duration: map['duration'] ?? 0,
      caloriesBurn: map['caloriesBurn'] ?? 0,
      muscleGroups: List<String>.from(map['muscleGroups'] ?? []),
      equipment: List<String>.from(map['equipment'] ?? []),
      imageUrl: map['imageUrl'],
      videoUrl: map['videoUrl'],
      instructions: List<String>.from(map['instructions'] ?? []),
      benefits: List<String>.from(map['benefits'] ?? []),
      precautions: List<String>.from(map['precautions'] ?? []),
      isRecommended: map['isRecommended'] ?? false,
      metadata: Map<String, dynamic>.from(map['metadata'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, category: $category, difficulty: $difficulty)';
  }
}

class ExercisePlan {
  final String id;
  final String name;
  final String description;
  final String userId;
  final List<ExerciseSession> sessions;
  final int totalDuration; // in minutes
  final int totalCalories;
  final String difficulty;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? completedAt;

  ExercisePlan({
    required this.id,
    required this.name,
    required this.description,
    required this.userId,
    required this.sessions,
    required this.totalDuration,
    required this.totalCalories,
    required this.difficulty,
    this.isActive = true,
    required this.createdAt,
    this.completedAt,
  });

  // Copy with method
  ExercisePlan copyWith({
    String? id,
    String? name,
    String? description,
    String? userId,
    List<ExerciseSession>? sessions,
    int? totalDuration,
    int? totalCalories,
    String? difficulty,
    bool? isActive,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return ExercisePlan(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      sessions: sessions ?? this.sessions,
      totalDuration: totalDuration ?? this.totalDuration,
      totalCalories: totalCalories ?? this.totalCalories,
      difficulty: difficulty ?? this.difficulty,
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
      'sessions': sessions.map((session) => session.toMap()).toList(),
      'totalDuration': totalDuration,
      'totalCalories': totalCalories,
      'difficulty': difficulty,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }

  // Create from Map
  factory ExercisePlan.fromMap(Map<String, dynamic> map) {
    return ExercisePlan(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      userId: map['userId'] ?? '',
      sessions:
          (map['sessions'] as List?)
              ?.map((session) => ExerciseSession.fromMap(session))
              .toList() ??
          [],
      totalDuration: map['totalDuration'] ?? 0,
      totalCalories: map['totalCalories'] ?? 0,
      difficulty: map['difficulty'] ?? '',
      isActive: map['isActive'] ?? true,
      createdAt: DateTime.parse(map['createdAt']),
      completedAt: map['completedAt'] != null
          ? DateTime.parse(map['completedAt'])
          : null,
    );
  }

  @override
  String toString() {
    return 'ExercisePlan(id: $id, name: $name, sessions: ${sessions.length})';
  }
}

class ExerciseSession {
  final String id;
  final Exercise exercise;
  final int duration; // in minutes
  final int sets;
  final int reps;
  final int restTime; // in seconds
  final String? notes;

  ExerciseSession({
    required this.id,
    required this.exercise,
    required this.duration,
    this.sets = 1,
    this.reps = 1,
    this.restTime = 0,
    this.notes,
  });

  // Copy with method
  ExerciseSession copyWith({
    String? id,
    Exercise? exercise,
    int? duration,
    int? sets,
    int? reps,
    int? restTime,
    String? notes,
  }) {
    return ExerciseSession(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      duration: duration ?? this.duration,
      sets: sets ?? this.sets,
      reps: reps ?? this.reps,
      restTime: restTime ?? this.restTime,
      notes: notes ?? this.notes,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exercise': exercise.toMap(),
      'duration': duration,
      'sets': sets,
      'reps': reps,
      'restTime': restTime,
      'notes': notes,
    };
  }

  // Create from Map
  factory ExerciseSession.fromMap(Map<String, dynamic> map) {
    return ExerciseSession(
      id: map['id'] ?? '',
      exercise: Exercise.fromMap(map['exercise']),
      duration: map['duration'] ?? 0,
      sets: map['sets'] ?? 1,
      reps: map['reps'] ?? 1,
      restTime: map['restTime'] ?? 0,
      notes: map['notes'],
    );
  }

  @override
  String toString() {
    return 'ExerciseSession(id: $id, exercise: ${exercise.name}, duration: $duration)';
  }
}
