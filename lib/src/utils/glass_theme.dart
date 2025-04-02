import 'package:flutter/material.dart';

/// A class that defines the visual appearance of glassmorphic widgets.
///
/// This class encapsulates all the styling properties that can be applied to
/// glassmorphic widgets, providing a consistent look and feel across the application.
///
/// Example:
/// ```dart
/// final theme = GlassTheme(
///   blur: 15.0,
///   opacity: 0.2,
///   borderRadius: BorderRadius.circular(12),
///   gradient: LinearGradient(
///     colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.1)],
///   ),
/// );
/// ```
class GlassTheme {
  /// The intensity of the blur effect.
  ///
  /// Higher values create a more frosted appearance. Defaults to 10.0.
  final double blur;

  /// The opacity of the glass effect.
  ///
  /// Controls how transparent the glass appears. Defaults to 0.2.
  final double opacity;

  /// The border radius applied to the glass container.
  ///
  /// Determines the rounding of corners. Can be null for sharp corners.
  final BorderRadius? borderRadius;

  /// The gradient overlay applied to the glass effect.
  ///
  /// Can be used to create color transitions or tints. Can be null.
  final Gradient? gradient;

  /// The color of text and icons within the glass container.
  ///
  /// If null, defaults to the current theme's foreground color.
  final Color? foregroundColor;

  /// The base color of the glass container.
  ///
  /// If null, defaults to white with the specified opacity.
  final Color? backgroundColor;

  /// The color of the shadow cast by the glass container.
  ///
  /// Can be null for no shadow.
  final Color? shadowColor;

  /// The elevation of the glass container.
  ///
  /// Controls the shadow depth. Can be null for no elevation.
  final double? elevation;

  /// Creates a glass theme with customizable properties.
  ///
  /// All parameters are optional and will use default values if not specified.
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
  ///
  /// This method is useful for creating variations of an existing theme while
  /// preserving other properties.
  ///
  /// Example:
  /// ```dart
  /// final highlightedTheme = baseTheme.copyWith(
  ///   blur: 20.0,
  ///   opacity: 0.3,
  /// );
  /// ```
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

  /// Linearly interpolates between two [GlassTheme]s.
  ///
  /// The `t` parameter represents the position on the timeline, with 0.0 meaning
  /// this theme, and 1.0 meaning the [other] theme.
  ///
  /// Example:
  /// ```dart
  /// final midwayTheme = GlassTheme.lerp(theme1, theme2, 0.5);
  /// ```
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
