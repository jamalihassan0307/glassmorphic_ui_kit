import 'dart:ui';

import 'package:flutter/material.dart';
// import '../theme/glass_theme.dart';
import '../utils/glass_constants.dart';

/// A container widget that implements the glassmorphism effect.
///
/// This widget creates a frosted glass appearance by applying a blur effect
/// and optional gradient overlay. It serves as the base component for all
/// other glass-effect widgets in this package.
///
/// Example:
/// ```dart
/// GlassContainer(
///   width: 300,
///   height: 200,
///   blur: 20,
///   borderRadius: BorderRadius.circular(15),
///   gradient: LinearGradient(
///     colors: [
///       Colors.white.withOpacity(0.2),
///       Colors.white.withOpacity(0.1),
///     ],
///   ),
///   child: Center(child: Text("Glassmorphic Container")),
/// )
/// ```
class GlassContainer extends StatelessWidget {
  /// The width of the container. If null, the container will expand to fit its parent.
  final double? width;

  /// The height of the container. If null, the container will expand to fit its parent.
  final double? height;

  /// The intensity of the blur effect. Higher values create a more frosted appearance.
  final double blur;

  /// The opacity of the container's background color.
  final double opacity;

  /// The border radius of the container. Controls the roundness of the corners.
  final BorderRadius? borderRadius;

  /// The widget to display inside the glass container.
  final Widget? child;

  /// An optional gradient to overlay on top of the blur effect.
  final Gradient? gradient;

  /// An optional border to draw around the container.
  final BoxBorder? border;

  /// The background color of the container. If null, white with [opacity] will be used.
  final Color? color;

  /// Creates a glass container with customizable blur and gradient effects.
  ///
  /// The [blur] parameter controls the intensity of the frosted glass effect,
  /// while [opacity] determines how transparent the container appears.
  const GlassContainer({
    Key? key,
    this.width,
    this.height,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.child,
    this.gradient,
    this.border,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? Colors.white.withOpacity(opacity),
            borderRadius: borderRadius,
            gradient: gradient,
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
