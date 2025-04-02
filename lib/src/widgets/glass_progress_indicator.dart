import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// The type of progress indicator to display.
enum GlassProgressType {
  /// A linear progress indicator that displays progress along a line.
  linear,

  /// A circular progress indicator that displays progress along a circle.
  circular,
}

/// A Material Design progress indicator with a glassmorphic effect.
///
/// This widget creates either a linear or circular progress indicator with
/// a frosted glass appearance.
class GlassProgressIndicator extends StatelessWidget {
  /// The type of progress indicator to display.
  ///
  /// Defaults to [GlassProgressType.linear].
  final GlassProgressType type;

  /// The value of the progress indicator.
  ///
  /// If null, the progress indicator will be indeterminate.
  final double? value;

  /// The intensity of the blur effect.
  ///
  /// Defaults to [GlassConstants.defaultBlur].
  final double blur;

  /// The opacity of the glass effect.
  ///
  /// Defaults to [GlassConstants.defaultOpacity].
  final double opacity;

  /// Optional gradient to be applied over the blur effect.
  final Gradient? gradient;

  /// Creates a glass progress indicator.
  ///
  /// The [type] determines whether the indicator is linear or circular.
  const GlassProgressIndicator({
    Key? key,
    this.type = GlassProgressType.linear,
    this.value,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      borderRadius: type == GlassProgressType.linear
          ? BorderRadius.circular(4)
          : BorderRadius.circular(25),
      child: SizedBox(
        width: type == GlassProgressType.linear ? 200 : 50,
        height: type == GlassProgressType.linear ? 4 : 50,
        child: type == GlassProgressType.linear
            ? LinearProgressIndicator(
                value: value,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : CircularProgressIndicator(
                value: value,
                backgroundColor: Colors.white24,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
      ),
    );
  }
}
