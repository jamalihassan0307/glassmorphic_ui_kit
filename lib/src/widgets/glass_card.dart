import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double blur;
  final BorderRadius? borderRadius;
  final Widget? child;
  final Gradient? gradient;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;

  const GlassCard({
    Key? key,
    this.width,
    this.height,
    this.blur = 10,
    this.borderRadius,
    this.child,
    this.gradient,
    this.border,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: width,
      height: height,
      blur: blur,
      borderRadius: borderRadius,
      gradient: gradient,
      border: border,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
} 