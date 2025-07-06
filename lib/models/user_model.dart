class User {
  final String id;
  final String email;
  final String name;
  final String? phoneNumber;
  final DateTime dateOfBirth;
  final String gender;
  final double height;
  final double weight;
  final String? profileImageUrl;
  final List<String> healthConditions;
  final List<String> allergies;
  final List<String> medications;
  final String activityLevel;
  final String fitnessGoal;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isProfileComplete;
  final String? emergencyContact;
  final String? emergencyPhone;
  final Map<String, dynamic> preferences;

  User({
    required this.id,
    required this.email,
    required this.name,
    this.phoneNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.height,
    required this.weight,
    this.profileImageUrl,
    this.healthConditions = const [],
    this.allergies = const [],
    this.medications = const [],
    this.activityLevel = 'moderate',
    this.fitnessGoal = 'maintain',
    required this.createdAt,
    required this.updatedAt,
    this.isProfileComplete = false,
    this.emergencyContact,
    this.emergencyPhone,
    this.preferences = const {},
  });

  // Calculate BMI
  double get bmi {
    if (height <= 0) return 0;
    return weight / ((height / 100) * (height / 100));
  }

  // Get BMI category
  String get bmiCategory {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  // Get age
  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  // Copy with method
  User copyWith({
    String? id,
    String? email,
    String? name,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? gender,
    double? height,
    double? weight,
    String? profileImageUrl,
    List<String>? healthConditions,
    List<String>? allergies,
    List<String>? medications,
    String? activityLevel,
    String? fitnessGoal,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isProfileComplete,
    String? emergencyContact,
    String? emergencyPhone,
    Map<String, dynamic>? preferences,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      healthConditions: healthConditions ?? this.healthConditions,
      allergies: allergies ?? this.allergies,
      medications: medications ?? this.medications,
      activityLevel: activityLevel ?? this.activityLevel,
      fitnessGoal: fitnessGoal ?? this.fitnessGoal,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isProfileComplete: isProfileComplete ?? this.isProfileComplete,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      emergencyPhone: emergencyPhone ?? this.emergencyPhone,
      preferences: preferences ?? this.preferences,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'height': height,
      'weight': weight,
      'profileImageUrl': profileImageUrl,
      'healthConditions': healthConditions,
      'allergies': allergies,
      'medications': medications,
      'activityLevel': activityLevel,
      'fitnessGoal': fitnessGoal,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isProfileComplete': isProfileComplete,
      'emergencyContact': emergencyContact,
      'emergencyPhone': emergencyPhone,
      'preferences': preferences,
    };
  }

  // Create from Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
      gender: map['gender'] ?? '',
      height: (map['height'] ?? 0).toDouble(),
      weight: (map['weight'] ?? 0).toDouble(),
      profileImageUrl: map['profileImageUrl'],
      healthConditions: List<String>.from(map['healthConditions'] ?? []),
      allergies: List<String>.from(map['allergies'] ?? []),
      medications: List<String>.from(map['medications'] ?? []),
      activityLevel: map['activityLevel'] ?? 'moderate',
      fitnessGoal: map['fitnessGoal'] ?? 'maintain',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      isProfileComplete: map['isProfileComplete'] ?? false,
      emergencyContact: map['emergencyContact'],
      emergencyPhone: map['emergencyPhone'],
      preferences: Map<String, dynamic>.from(map['preferences'] ?? {}),
    );
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, age: $age, bmi: ${bmi.toStringAsFixed(1)})';
  }
}
