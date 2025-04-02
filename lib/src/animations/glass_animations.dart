import 'package:flutter/material.dart';

/// A utility class that provides pre-built animations for glassmorphic widgets.
///
/// This class contains static methods that create commonly used animations
/// for enhancing the visual appeal of glass-effect widgets.
class GlassAnimation {
  /// Creates a fade-in animation for glass widgets.
  ///
  /// The animation transitions from fully transparent to fully visible.
  ///
  /// Parameters:
  /// * [controller] - The animation controller that drives this animation
  /// * [duration] - Optional duration for the animation
  static Animation<double> fadeIn({
    required AnimationController controller,
    Duration? duration,
  }) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  /// Creates a scale-in animation for glass widgets.
  ///
  /// The animation starts slightly smaller and scales up to full size.
  ///
  /// Parameters:
  /// * [controller] - The animation controller that drives this animation
  /// * [duration] - Optional duration for the animation
  static Animation<double> scaleIn({
    required AnimationController controller,
    Duration? duration,
  }) {
    return Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }
}
