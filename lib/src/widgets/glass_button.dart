import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;

  const GlassButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.blur = 10,
    this.opacity = 0.2,
    this.borderRadius,
    this.gradient,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
        child: GlassContainer(
          blur: blur,
          opacity: opacity,
          borderRadius: borderRadius ?? BorderRadius.circular(15),
          gradient: gradient,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
            child: child,
          ),
        ),
      ),
    );
  }
}
