import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';

/// Memory optimization utilities for DOPYJO app
class MemoryOptimizer {
  static final Map<String, Timer> _cleanupTimers = {};
  static final Map<String, dynamic> _cachedData = {};
  static final int _maxCacheSize = 50; // Maximum number of cached items
  static bool _enabled = true;

  /// Enable or disable memory optimization
  static void setEnabled(bool enabled) {
    _enabled = enabled;
  }

  /// Cache data with automatic cleanup
  static void cacheData<T>(String key, T data, {Duration? ttl}) {
    if (!_enabled) return;

    // Remove old cache entry if exists
    _cachedData.remove(key);
    _cleanupTimers[key]?.cancel();

    // Add new cache entry
    _cachedData[key] = data;

    // Set up cleanup timer
    if (ttl != null) {
      _cleanupTimers[key] = Timer(ttl, () {
        _cachedData.remove(key);
        _cleanupTimers.remove(key);
        developer.log('🗑️ Cached data expired: $key', name: 'MemoryOptimizer');
      });
    }

    // Enforce cache size limit
    if (_cachedData.length > _maxCacheSize) {
      final oldestKey = _cachedData.keys.first;
      _cachedData.remove(oldestKey);
      _cleanupTimers[oldestKey]?.cancel();
      _cleanupTimers.remove(oldestKey);
      developer.log(
        '🗑️ Cache limit reached, removed: $oldestKey',
        name: 'MemoryOptimizer',
      );
    }
  }

  /// Get cached data
  static T? getCachedData<T>(String key) {
    if (!_enabled) return null;
    return _cachedData[key] as T?;
  }

  /// Clear specific cached data
  static void clearCachedData(String key) {
    _cachedData.remove(key);
    _cleanupTimers[key]?.cancel();
    _cleanupTimers.remove(key);
  }

  /// Clear all cached data
  static void clearAllCachedData() {
    _cachedData.clear();
    for (final timer in _cleanupTimers.values) {
      timer.cancel();
    }
    _cleanupTimers.clear();
    developer.log('🗑️ All cached data cleared', name: 'MemoryOptimizer');
  }

  /// Get cache statistics
  static Map<String, dynamic> getCacheStats() {
    return {
      'size': _cachedData.length,
      'maxSize': _maxCacheSize,
      'keys': _cachedData.keys.toList(),
    };
  }

  /// Optimize image memory usage
  static Widget optimizeImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: CircularProgressIndicator()),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.error),
            );
      },
      // Memory optimization settings
      cacheWidth: width?.toInt(),
      cacheHeight: height?.toInt(),
      filterQuality: FilterQuality.medium,
    );
  }

  /// Debounced function to reduce memory usage
  static Function debounce(Function func, Duration wait) {
    Timer? timer;
    return () {
      timer?.cancel();
      timer = Timer(wait, () => func());
    };
  }

  /// Throttled function to reduce memory usage
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

/// Memory-aware widget that automatically cleans up resources
class MemoryAwareWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback? onDispose;

  const MemoryAwareWidget({super.key, required this.child, this.onDispose});

  @override
  State<MemoryAwareWidget> createState() => _MemoryAwareWidgetState();
}

class _MemoryAwareWidgetState extends State<MemoryAwareWidget> {
  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Lazy loading widget for better memory management
class LazyLoadingWidget extends StatefulWidget {
  final Widget Function() builder;
  final Widget? placeholder;
  final Duration delay;

  const LazyLoadingWidget({
    super.key,
    required this.builder,
    this.placeholder,
    this.delay = const Duration(milliseconds: 100),
  });

  @override
  State<LazyLoadingWidget> createState() => _LazyLoadingWidgetState();
}

class _LazyLoadingWidgetState extends State<LazyLoadingWidget> {
  bool _isLoaded = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(widget.delay, () {
      if (mounted) {
        setState(() {
          _isLoaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return widget.placeholder ??
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
    }

    return widget.builder();
  }
}

/// Memory-efficient list item widget
class MemoryEfficientListItem extends StatelessWidget {
  final Widget child;
  final bool shouldRebuild;

  const MemoryEfficientListItem({
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
