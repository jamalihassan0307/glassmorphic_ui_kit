import 'package:flutter/material.dart';

/// A theme class that provides default values and styling for glassmorphic widgets.
///
/// This class contains constants and utility methods for maintaining consistent
/// appearance across all glassmorphic components in the application.
class GlassTheme {
  /// The default blur intensity used for glass effects.
  static const double defaultBlur = 10.0;

  /// The default opacity value for glass containers.
  static const double defaultOpacity = 0.2;

  /// The default duration for glass-related animations.
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  /// Creates a default gradient for glass effects that adapts to the current theme.
  ///
  /// The gradient's colors are adjusted based on whether the app is in dark or light mode.
  /// Returns a [LinearGradient] with appropriate opacity values.
  static LinearGradient defaultGradient(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.white : Colors.white;
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        baseColor.withAlpha(51),  // 0.2 opacity = 51 in alpha (255 * 0.2)
        baseColor.withAlpha(26),  // 0.1 opacity = 26 in alpha (255 * 0.1)
      ],
    );
  }
}
