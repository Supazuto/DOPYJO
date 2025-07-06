import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/// Performance monitoring utility for DOPYJO app
class PerformanceMonitor {
  static final Map<String, Stopwatch> _timers = {};
  static final Map<String, List<Duration>> _measurements = {};
  static bool _enabled = kDebugMode;

  /// Enable or disable performance monitoring
  static void setEnabled(bool enabled) {
    _enabled = enabled;
  }

  /// Start timing a performance measurement
  static void startTimer(String name) {
    if (!_enabled) return;

    _timers[name] = Stopwatch()..start();
    developer.log('⏱️ Started timer: $name', name: 'PerformanceMonitor');
  }

  /// Stop timing and log the duration
  static void stopTimer(String name) {
    if (!_enabled) return;

    final timer = _timers[name];
    if (timer != null) {
      timer.stop();
      final duration = timer.elapsed;

      _measurements.putIfAbsent(name, () => []).add(duration);

      developer.log(
        '⏱️ Timer $name: ${duration.inMilliseconds}ms',
        name: 'PerformanceMonitor',
      );

      _timers.remove(name);
    }
  }

  /// Get average duration for a measurement
  static Duration getAverageDuration(String name) {
    final measurements = _measurements[name];
    if (measurements == null || measurements.isEmpty) {
      return Duration.zero;
    }

    final total = measurements.fold<Duration>(
      Duration.zero,
      (sum, duration) => sum + duration,
    );

    return Duration(microseconds: total.inMicroseconds ~/ measurements.length);
  }

  /// Clear all measurements
  static void clearMeasurements() {
    _measurements.clear();
    _timers.clear();
  }

  /// Get performance summary
  static Map<String, Duration> getPerformanceSummary() {
    final summary = <String, Duration>{};

    for (final entry in _measurements.entries) {
      summary[entry.key] = getAverageDuration(entry.key);
    }

    return summary;
  }

  /// Monitor widget build performance
  static Widget monitorWidget(String name, Widget child) {
    if (!_enabled) return child;

    return _PerformanceWidget(name: name, child: child);
  }

  /// Monitor function execution time
  static T monitorFunction<T>(String name, T Function() function) {
    if (!_enabled) return function();

    startTimer(name);
    try {
      final result = function();
      stopTimer(name);
      return result;
    } catch (e) {
      stopTimer(name);
      rethrow;
    }
  }

  /// Monitor async function execution time
  static Future<T> monitorAsyncFunction<T>(
    String name,
    Future<T> Function() function,
  ) async {
    if (!_enabled) return await function();

    startTimer(name);
    try {
      final result = await function();
      stopTimer(name);
      return result;
    } catch (e) {
      stopTimer(name);
      rethrow;
    }
  }
}

/// Performance monitoring widget
class _PerformanceWidget extends StatefulWidget {
  final String name;
  final Widget child;

  const _PerformanceWidget({required this.name, required this.child});

  @override
  State<_PerformanceWidget> createState() => _PerformanceWidgetState();
}

class _PerformanceWidgetState extends State<_PerformanceWidget> {
  @override
  void initState() {
    super.initState();
    PerformanceMonitor.startTimer('${widget.name}_build');
  }

  @override
  Widget build(BuildContext context) {
    PerformanceMonitor.stopTimer('${widget.name}_build');
    PerformanceMonitor.startTimer('${widget.name}_build');

    return widget.child;
  }
}

/// Performance-aware mixin for StatefulWidget
mixin PerformanceMixin<T extends StatefulWidget> on State<T> {
  String get performanceName => runtimeType.toString();

  @override
  void initState() {
    super.initState();
    PerformanceMonitor.startTimer('${performanceName}_init');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PerformanceMonitor.stopTimer('${performanceName}_init');
  }

  @override
  Widget build(BuildContext context) {
    PerformanceMonitor.startTimer('${performanceName}_build');
    final widget = buildWithPerformance(context);
    PerformanceMonitor.stopTimer('${performanceName}_build');
    return widget;
  }

  Widget buildWithPerformance(BuildContext context);
}

/// Performance-aware StatelessWidget
class PerformanceStatelessWidget extends StatelessWidget {
  final String name;
  final Widget Function(BuildContext) builder;

  const PerformanceStatelessWidget({
    super.key,
    required this.name,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return PerformanceMonitor.monitorWidget(name, builder(context));
  }
}
