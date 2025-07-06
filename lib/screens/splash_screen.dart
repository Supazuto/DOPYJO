import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../widgets/glass_morphism_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _fadeController.forward();
    _scaleController.forward();

    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    AppColors.backgroundDark,
                    AppColors.primary.withValues(alpha: 0.3),
                    AppColors.backgroundDark,
                  ]
                : [
                    AppColors.background,
                    AppColors.primary.withValues(alpha: 0.1),
                    AppColors.background,
                  ],
          ),
        ),
        child: Stack(
          children: [
            // Background Pattern
            Positioned.fill(
              child: CustomPaint(
                painter: BackgroundPatternPainter(isDark: isDark),
              ),
            ),

            // Main Content
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo with Glass Effect
                      GlassMorphismContainer(
                        borderRadius: 50,
                        blur: 20,
                        padding: const EdgeInsets.all(20),
                        backgroundColor: isDark
                            ? AppColors.surfaceDark.withValues(alpha: 0.9)
                            : Colors.white.withValues(alpha: 0.9),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          ),
                        ],
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.primary, AppColors.accent],
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.favorite,
                            size: 50,
                            color: isDark
                                ? AppColors.primaryLight
                                : Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // App Title
                      GlassMorphismContainer(
                        borderRadius: AppConstants.borderRadiusXLarge,
                        blur: 15,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        backgroundColor: isDark
                            ? AppColors.surfaceDark.withValues(alpha: 0.15)
                            : Colors.white.withValues(alpha: 0.15),
                        border: Border.all(
                          color: isDark
                              ? AppColors.borderDark.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.2),
                          width: 1,
                        ),
                        child: Text(
                          'DOPYJO',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimary,
                                letterSpacing: 2.0,
                              ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Tagline
                      GlassMorphismContainer(
                        borderRadius: AppConstants.borderRadiusLarge,
                        blur: 10,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        backgroundColor: isDark
                            ? AppColors.surfaceDark.withValues(alpha: 0.1)
                            : Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: isDark
                              ? AppColors.borderDark.withValues(alpha: 0.3)
                              : Colors.white.withValues(alpha: 0.3),
                          width: 1,
                        ),
                        child: Text(
                          'Smart Health & Fitness',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondary,
                                letterSpacing: 1.0,
                              ),
                        ),
                      ),

                      const SizedBox(height: 60),

                      // Loading Indicator
                      GlassMorphismContainer(
                        borderRadius: AppConstants.borderRadiusMedium,
                        blur: 8,
                        padding: const EdgeInsets.all(15),
                        backgroundColor: isDark
                            ? AppColors.surfaceDark.withValues(alpha: 0.1)
                            : Colors.white.withValues(alpha: 0.1),
                        border: Border.all(
                          color: isDark
                              ? AppColors.borderDark.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.2),
                          width: 1,
                        ),
                        child: const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundPatternPainter extends CustomPainter {
  final bool isDark;

  BackgroundPatternPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark
          ? AppColors.primary.withValues(alpha: 0.05)
          : Colors.white.withValues(alpha: 0.05)
      ..strokeWidth = 1;

    // Draw grid pattern
    for (double i = 0; i < size.width; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 50) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
