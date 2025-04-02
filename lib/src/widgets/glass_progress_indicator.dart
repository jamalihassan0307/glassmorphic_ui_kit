import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A glassmorphic progress indicator widget.
class GlassProgressIndicator extends StatelessWidget {
  final double value;
  final double height;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? backgroundGradient;
  final Gradient? progressGradient;

  const GlassProgressIndicator({
    Key? key,
    required this.value,
    this.height = 8.0,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.backgroundGradient,
    this.progressGradient,
  })  : assert(value >= 0.0 && value <= 1.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
      gradient: backgroundGradient,
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value,
        child: GlassContainer(
          blur: blur,
          opacity: opacity,
          borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
          gradient: progressGradient ??
              LinearGradient(
                colors: [
                  Colors.white.withAlpha(102), // 0.4 opacity
                  Colors.white.withAlpha(51),  // 0.2 opacity
                ],
              ),
        ),
      ),
    );
  }
} 