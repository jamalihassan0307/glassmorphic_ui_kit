import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/glass_theme.dart';
import '../utils/glass_constants.dart';

class GlassContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Gradient? gradient;
  final BoxBorder? border;
  final Color? color;

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