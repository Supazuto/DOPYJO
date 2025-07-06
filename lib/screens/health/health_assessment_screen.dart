import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../widgets/glass_morphism_container.dart';

class HealthAssessmentScreen extends StatefulWidget {
  const HealthAssessmentScreen({super.key});

  @override
  State<HealthAssessmentScreen> createState() => _HealthAssessmentScreenState();
}

class _HealthAssessmentScreenState extends State<HealthAssessmentScreen> {
  int _currentStep = 0;
  final List<Map<String, dynamic>> _questions = [
    {'question': 'What is your age?', 'type': 'number', 'options': null},
    {
      'question': 'What is your gender?',
      'type': 'choice',
      'options': ['Male', 'Female', 'Other'],
    },
    {
      'question': 'What is your height (cm)?',
      'type': 'number',
      'options': null,
    },
    {
      'question': 'What is your weight (kg)?',
      'type': 'number',
      'options': null,
    },
    {
      'question': 'How would you rate your activity level?',
      'type': 'choice',
      'options': [
        'Sedentary',
        'Lightly Active',
        'Moderately Active',
        'Very Active',
      ],
    },
    {
      'question': 'Do you have any medical conditions?',
      'type': 'choice',
      'options': ['None', 'Diabetes', 'Hypertension', 'Heart Disease', 'Other'],
    },
  ];

  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _questions.length; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      appBar: AppBar(
        title: Text(
          'Health Assessment',
          style: TextStyle(
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: IconThemeData(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            child: Column(
              children: [
                // Progress Indicator
                GlassMorphismContainer(
                  borderRadius: AppConstants.borderRadiusMedium,
                  blur: 8,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Question ${_currentStep + 1} of ${_questions.length}',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            '${((_currentStep + 1) / _questions.length * 100).toInt()}%',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppConstants.paddingSmall),
                      LinearProgressIndicator(
                        value: (_currentStep + 1) / _questions.length,
                        backgroundColor: isDark
                            ? AppColors.surfaceDark.withValues(alpha: 0.3)
                            : AppColors.border.withValues(alpha: 0.3),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppConstants.paddingLarge),

                // Question Card
                Expanded(
                  child: GlassMorphismContainer(
                    borderRadius: AppConstants.borderRadiusXLarge,
                    blur: 15,
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
                        // Question
                        Text(
                          _questions[_currentStep]['question'],
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary,
                                letterSpacing: 0.5,
                              ),
                        ),
                        const SizedBox(height: AppConstants.paddingLarge),

                        // Answer Options
                        Expanded(child: _buildAnswerOptions()),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppConstants.paddingLarge),

                // Navigation Buttons
                Row(
                  children: [
                    if (_currentStep > 0)
                      Expanded(
                        child: GlassMorphismContainer(
                          borderRadius: AppConstants.borderRadiusMedium,
                          blur: 8,
                          padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.paddingMedium,
                          ),
                          backgroundColor: isDark
                              ? AppColors.surfaceDark.withValues(alpha: 0.1)
                              : Colors.white.withValues(alpha: 0.1),
                          border: Border.all(
                            color: isDark
                                ? AppColors.borderDark.withValues(alpha: 0.2)
                                : AppColors.border.withValues(alpha: 0.2),
                            width: 1,
                          ),
                          child: TextButton(
                            onPressed: _previousQuestion,
                            child: Text(
                              'Previous',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? AppColors.textPrimaryDark
                                        : AppColors.textPrimary,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    if (_currentStep > 0)
                      const SizedBox(width: AppConstants.paddingMedium),
                    Expanded(
                      child: GlassMorphismContainer(
                        borderRadius: AppConstants.borderRadiusMedium,
                        blur: 8,
                        padding: const EdgeInsets.symmetric(
                          vertical: AppConstants.paddingMedium,
                        ),
                        backgroundColor: AppColors.primary.withValues(
                          alpha: 0.1,
                        ),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          width: 1,
                        ),
                        child: TextButton(
                          onPressed: _nextQuestion,
                          child: Text(
                            _currentStep == _questions.length - 1
                                ? 'Complete'
                                : 'Next',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerOptions() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final question = _questions[_currentStep];

    if (question['type'] == 'number') {
      return TextField(
        controller: _controllers[_currentStep],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Enter your answer',
          hintStyle: TextStyle(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppConstants.borderRadiusMedium,
            ),
          ),
        ),
        style: TextStyle(
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimary,
        ),
      );
    } else if (question['type'] == 'choice') {
      return ListView.builder(
        itemCount: question['options'].length,
        itemBuilder: (context, index) {
          final option = question['options'][index];
          final isSelected = _controllers[_currentStep].text == option;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: GlassMorphismContainer(
              borderRadius: AppConstants.borderRadiusMedium,
              blur: 5,
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              backgroundColor: isSelected
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : (isDark
                        ? AppColors.surfaceDark.withValues(alpha: 0.1)
                        : Colors.white.withValues(alpha: 0.1)),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : (isDark
                          ? AppColors.borderDark.withValues(alpha: 0.2)
                          : AppColors.border.withValues(alpha: 0.2)),
                width: 1,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _controllers[_currentStep].text = option;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: isSelected
                          ? AppColors.primary
                          : (isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondary),
                    ),
                    const SizedBox(width: AppConstants.paddingMedium),
                    Text(
                      option,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return const SizedBox.shrink();
  }

  void _previousQuestion() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _nextQuestion() {
    if (_controllers[_currentStep].text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide an answer'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_currentStep < _questions.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      _completeAssessment();
    }
  }

  void _completeAssessment() {
    // TODO: Process assessment results
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Assessment Complete'),
        content: Text('Thank you for completing the health assessment!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
