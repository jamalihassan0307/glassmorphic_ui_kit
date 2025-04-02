import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassBottomSheet extends StatelessWidget {
  final Widget child;
  final double blur;
  final double? height;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;

  const GlassBottomSheet({
    Key? key,
    required this.child,
    this.blur = 10,
    this.height,
    this.borderRadius,
    this.gradient,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      blur: blur,
      borderRadius: borderRadius ?? const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      gradient: gradient,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double blur = 10,
    double? height,
    BorderRadius? borderRadius,
    Gradient? gradient,
    EdgeInsetsGeometry? padding,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassBottomSheet(
        blur: blur,
        height: height,
        borderRadius: borderRadius,
        gradient: gradient,
        padding: padding,
        child: child,
      ),
    );
  }
} 