import 'package:flutter/material.dart';

/// A class that holds theme-related properties for glassmorphic widgets.
class GlassTheme {
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? shadowColor;
  final double? elevation;

  const GlassTheme({
    this.blur = 10.0,
    this.opacity = 0.2,
    this.borderRadius,
    this.gradient,
    this.foregroundColor,
    this.backgroundColor,
    this.shadowColor,
    this.elevation,
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  GlassTheme copyWith({
    double? blur,
    double? opacity,
    BorderRadius? borderRadius,
    Gradient? gradient,
    Color? foregroundColor,
    Color? backgroundColor,
    Color? shadowColor,
    double? elevation,
  }) {
    return GlassTheme(
      blur: blur ?? this.blur,
      opacity: opacity ?? this.opacity,
      borderRadius: borderRadius ?? this.borderRadius,
      gradient: gradient ?? this.gradient,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
    );
  }

  /// Creates a theme that's lerped between two glass themes.
  static GlassTheme lerp(GlassTheme? a, GlassTheme? b, double t) {
    if (a == null && b == null) return const GlassTheme();
    if (a == null) return b!;
    if (b == null) return a;
    return GlassTheme(
      blur: lerpDouble(a.blur, b.blur, t)!,
      opacity: lerpDouble(a.opacity, b.opacity, t)!,
      borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t),
      gradient: Gradient.lerp(a.gradient, b.gradient, t),
      foregroundColor: Color.lerp(a.foregroundColor, b.foregroundColor, t),
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      shadowColor: Color.lerp(a.shadowColor, b.shadowColor, t),
      elevation: lerpDouble(a.elevation, b.elevation, t),
    );
  }
}

/// Extension method to get a double value that can be null.
double? lerpDouble(double? a, double? b, double t) {
  if (a == null && b == null) return null;
  if (a == null) return b! * t;
  if (b == null) return a * (1.0 - t);
  return a + (b - a) * t;
} 