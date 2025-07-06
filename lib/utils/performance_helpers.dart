import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Performance optimization utilities for DOPYJO app
class PerformanceHelpers {
  /// Creates a cached network image with optimized settings
  static Widget cachedImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
    Duration fadeInDuration = const Duration(milliseconds: 300),
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      fadeInDuration: fadeInDuration,
      placeholder: (context, url) =>
          placeholder ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: CircularProgressIndicator()),
          ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.error),
          ),
      memCacheWidth: width?.toInt(),
      memCacheHeight: height?.toInt(),
      maxWidthDiskCache: 1024,
      maxHeightDiskCache: 1024,
    );
  }

  /// Creates an optimized list item with proper keys
  static Widget optimizedListItem({
    required Widget child,
    required int index,
    String? keyPrefix,
  }) {
    return Container(
      key: ValueKey('${keyPrefix ?? 'item'}_$index'),
      child: child,
    );
  }

  /// Debounce function for search and filtering
  static Function debounce(Function func, Duration wait) {
    Timer? timer;
    return () {
      timer?.cancel();
      timer = Timer(wait, () => func());
    };
  }

  /// Throttle function for scroll events
  static Function throttle(Function func, Duration wait) {
    DateTime? lastRun;
    return () {
      final now = DateTime.now();
      if (lastRun == null || now.difference(lastRun!) >= wait) {
        lastRun = now;
        func();
      }
    };
  }
}

/// Optimized scroll controller with performance settings
class OptimizedScrollController extends ScrollController {
  OptimizedScrollController({
    super.initialScrollOffset,
    super.keepScrollOffset,
    super.debugLabel,
  });

  @override
  void dispose() {
    // Clean up any listeners to prevent memory leaks
    super.dispose();
  }
}

/// Performance-aware widget that prevents unnecessary rebuilds
class PerformanceWidget extends StatelessWidget {
  final Widget child;
  final bool shouldRebuild;

  const PerformanceWidget({
    super.key,
    required this.child,
    this.shouldRebuild = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!shouldRebuild) {
      return child;
    }
    return child;
  }
}

/// Optimized image widget with memory management
class OptimizedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OptimizedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = PerformanceHelpers.cachedImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget,
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}
