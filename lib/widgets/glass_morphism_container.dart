import 'package:flutter/material.dart';
import 'dart:ui';
import '../constants/app_colors.dart';

class GlassMorphismContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final Color? backgroundColor;
  final Gradient? gradient;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final bool enableBlur;
  final Duration? animationDuration;
  final Curve? animationCurve;

  const GlassMorphismContainer({
    super.key,
    required this.child,
    this.borderRadius = 24,
    this.blur = 16,
    this.backgroundColor,
    this.gradient,
    this.border,
    this.boxShadow,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.alignment,
    this.enableBlur = true,
    this.animationDuration,
    this.animationCurve,
  });

  // Factory constructor for quick styling
  factory GlassMorphismContainer.primary({
    Key? key,
    required Widget child,
    double borderRadius = 24,
    double blur = 16,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    BuildContext? context,
  }) {
    final isDark =
        context != null && Theme.of(context).brightness == Brightness.dark;
    return GlassMorphismContainer(
      key: key,
      borderRadius: borderRadius,
      blur: blur,
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.15)
          : Colors.white.withValues(alpha: 0.15),
      border: Border.all(
        color: isDark
            ? AppColors.borderDark.withValues(alpha: 0.2)
            : Colors.white.withValues(alpha: 0.2),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      alignment: alignment,
      child: child,
    );
  }

  // Factory constructor for gradient styling
  factory GlassMorphismContainer.gradient({
    Key? key,
    required Widget child,
    required List<Color> colors,
    double borderRadius = 24,
    double blur = 16,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    List<BoxShadow>? boxShadow,
  }) {
    return GlassMorphismContainer(
      key: key,
      borderRadius: borderRadius,
      blur: blur,
      gradient: LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow:
          boxShadow ??
          [
            BoxShadow(
              color: colors.first.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      alignment: alignment,
      child: child,
    );
  }

  // Factory constructor for card styling
  factory GlassMorphismContainer.card({
    Key? key,
    required Widget child,
    double borderRadius = 20,
    double blur = 10,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? shadowColor,
    AlignmentGeometry? alignment,
    BuildContext? context,
  }) {
    final isDark =
        context != null && Theme.of(context).brightness == Brightness.dark;
    return GlassMorphismContainer(
      key: key,
      borderRadius: borderRadius,
      blur: blur,
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.05)
          : Colors.white.withValues(alpha: 0.05),
      border: Border.all(
        color: isDark
            ? AppColors.borderDark.withValues(alpha: 0.2)
            : Colors.white.withValues(alpha: 0.2),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: (shadowColor ?? Colors.black).withValues(alpha: 0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
      padding: padding ?? const EdgeInsets.all(20),
      margin: margin,
      alignment: alignment,
      child: child,
    );
  }

  // Factory constructor for input field styling
  factory GlassMorphismContainer.input({
    Key? key,
    required Widget child,
    double borderRadius = 16,
    double blur = 8,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? borderColor,
    AlignmentGeometry? alignment,
    BuildContext? context,
  }) {
    final isDark =
        context != null && Theme.of(context).brightness == Brightness.dark;
    return GlassMorphismContainer(
      key: key,
      borderRadius: borderRadius,
      blur: blur,
      backgroundColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.1)
          : Colors.white.withValues(alpha: 0.1),
      border: Border.all(
        color: (borderColor ?? (isDark ? AppColors.borderDark : Colors.white))
            .withValues(alpha: 0.2),
        width: 1,
      ),
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      margin: margin,
      alignment: alignment,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Cache theme check to avoid repeated calls
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget container = Container(
      margin: margin,
      width: width,
      height: height,
      alignment: alignment,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: enableBlur
            ? BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: _buildInnerContainer(isDark),
              )
            : _buildInnerContainer(isDark),
      ),
    );

    // Add animation if duration is provided
    if (animationDuration != null) {
      return AnimatedContainer(
        duration: animationDuration!,
        curve: animationCurve ?? Curves.easeInOut,
        margin: margin,
        width: width,
        height: height,
        alignment: alignment,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: enableBlur
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                  child: _buildInnerContainer(isDark),
                )
              : _buildInnerContainer(isDark),
        ),
      );
    }

    return container;
  }

  Widget _buildInnerContainer(bool isDark) {
    final defaultBackgroundColor =
        backgroundColor ??
        (isDark
            ? AppColors.surfaceDark.withValues(alpha: 0.15)
            : Colors.white.withValues(alpha: 0.15));

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: defaultBackgroundColor,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

// Extension for easier color manipulation
extension ColorExtension on Color {
  Color withValues({double? alpha, double? red, double? green, double? blue}) {
    return Color.fromARGB(
      alpha != null ? (alpha * 255).round() : (a as int),
      red != null ? (red * 255).round() : (r as int),
      green != null ? (green * 255).round() : (g as int),
      blue != null ? (blue * 255).round() : (b as int),
    );
  }
}
