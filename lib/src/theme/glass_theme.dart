import 'package:flutter/material.dart';

class GlassTheme {
  static const double defaultBlur = 10.0;
  static const double defaultOpacity = 0.2;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  static LinearGradient defaultGradient(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        (isDark ? Colors.white : Colors.white).withOpacity(0.2),
        (isDark ? Colors.white : Colors.white).withOpacity(0.1),
      ],
    );
  }
} 