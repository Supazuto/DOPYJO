import 'package:flutter/foundation.dart';

class HealthProvider extends ChangeNotifier {
  // Health metrics
  double _bmi = 0.0;
  double _bloodPressureSystolic = 0.0;
  double _bloodPressureDiastolic = 0.0;
  double _bloodSugar = 0.0;
  double _cholesterol = 0.0;
  double _weight = 0.0;
  double _height = 0.0;
  int _age = 0;
  String _gender = '';

  // Health status
  String _healthStatus = 'Unknown';
  final List<String> _healthRisks = [];
  final List<String> _recommendations = [];

  // Getters
  double get bmi => _bmi;
  double get bloodPressureSystolic => _bloodPressureSystolic;
  double get bloodPressureDiastolic => _bloodPressureDiastolic;
  double get bloodSugar => _bloodSugar;
  double get cholesterol => _cholesterol;
  double get weight => _weight;
  double get height => _height;
  int get age => _age;
  String get gender => _gender;
  String get healthStatus => _healthStatus;
  List<String> get healthRisks => _healthRisks;
  List<String> get recommendations => _recommendations;

  // Update health metrics
  void updateHealthMetrics({
    double? weight,
    double? height,
    int? age,
    String? gender,
    double? bloodPressureSystolic,
    double? bloodPressureDiastolic,
    double? bloodSugar,
    double? cholesterol,
  }) {
    if (weight != null) _weight = weight;
    if (height != null) _height = height;
    if (age != null) _age = age;
    if (gender != null) _gender = gender;
    if (bloodPressureSystolic != null) {
      _bloodPressureSystolic = bloodPressureSystolic;
    }
    if (bloodPressureDiastolic != null) {
      _bloodPressureDiastolic = bloodPressureDiastolic;
    }
    if (bloodSugar != null) _bloodSugar = bloodSugar;
    if (cholesterol != null) _cholesterol = cholesterol;

    _calculateBMI();
    _assessHealthStatus();
    _generateRecommendations();

    notifyListeners();
  }

  // Calculate BMI
  void _calculateBMI() {
    if (_height > 0) {
      _bmi = _weight / ((_height / 100) * (_height / 100));
    }
  }

  // Assess health status
  void _assessHealthStatus() {
    _healthRisks.clear();

    // BMI assessment
    if (_bmi < 18.5) {
      _healthRisks.add('Underweight');
    } else if (_bmi >= 25 && _bmi < 30) {
      _healthRisks.add('Overweight');
    } else if (_bmi >= 30) {
      _healthRisks.add('Obese');
    }

    // Blood pressure assessment
    if (_bloodPressureSystolic >= 140 || _bloodPressureDiastolic >= 90) {
      _healthRisks.add('High Blood Pressure');
    }

    // Blood sugar assessment
    if (_bloodSugar >= 126) {
      _healthRisks.add('High Blood Sugar');
    }

    // Cholesterol assessment
    if (_cholesterol >= 200) {
      _healthRisks.add('High Cholesterol');
    }

    // Determine overall health status
    if (_healthRisks.isEmpty) {
      _healthStatus = 'Excellent';
    } else if (_healthRisks.length <= 2) {
      _healthStatus = 'Good';
    } else if (_healthRisks.length <= 4) {
      _healthStatus = 'Moderate';
    } else {
      _healthStatus = 'Poor';
    }
  }

  // Generate recommendations
  void _generateRecommendations() {
    _recommendations.clear();

    if (_healthRisks.contains('Overweight') || _healthRisks.contains('Obese')) {
      _recommendations.add('Consider a balanced diet with calorie deficit');
      _recommendations.add(
        'Increase physical activity to 150 minutes per week',
      );
    }

    if (_healthRisks.contains('High Blood Pressure')) {
      _recommendations.add('Reduce sodium intake');
      _recommendations.add('Consider DASH diet');
      _recommendations.add('Regular cardiovascular exercise');
    }

    if (_healthRisks.contains('High Blood Sugar')) {
      _recommendations.add('Monitor carbohydrate intake');
      _recommendations.add('Regular blood sugar testing');
      _recommendations.add('Consult with healthcare provider');
    }

    if (_healthRisks.contains('High Cholesterol')) {
      _recommendations.add('Reduce saturated fat intake');
      _recommendations.add('Increase fiber consumption');
      _recommendations.add('Regular exercise');
    }

    if (_recommendations.isEmpty) {
      _recommendations.add('Maintain current healthy lifestyle');
      _recommendations.add('Regular health check-ups');
    }
  }

  // Reset all data
  void reset() {
    _bmi = 0.0;
    _bloodPressureSystolic = 0.0;
    _bloodPressureDiastolic = 0.0;
    _bloodSugar = 0.0;
    _cholesterol = 0.0;
    _weight = 0.0;
    _height = 0.0;
    _age = 0;
    _gender = '';
    _healthStatus = 'Unknown';
    _healthRisks.clear();
    _recommendations.clear();

    notifyListeners();
  }
}
