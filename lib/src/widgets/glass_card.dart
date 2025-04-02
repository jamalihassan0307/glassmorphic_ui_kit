import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A glassmorphic card widget that provides a frosted glass effect container.
class GlassCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final BoxShadow? shadow;

  const GlassCard({
    Key? key,
    required this.child,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.padding,
    this.margin,
    this.gradient,
    this.width,
    this.height,
    this.onTap,
    this.shadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectivePadding = padding ?? const EdgeInsets.all(16);
    
    Widget card = GlassContainer(
      width: width,
      height: height,
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      gradient: gradient,
      child: Padding(
        padding: effectivePadding,
        child: child,
      ),
    );

    if (shadow != null) {
      card = Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          boxShadow: [shadow!],
        ),
        child: card,
      );
    }

    if (margin != null) {
      card = Padding(
        padding: margin!,
        child: card,
      );
    }

    if (onTap != null) {
      card = GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }
}
