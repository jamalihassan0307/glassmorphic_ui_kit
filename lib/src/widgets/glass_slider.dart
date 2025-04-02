import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A slider with a glassmorphic effect.
class GlassSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final String? activeThumbImage;
  final String? inactiveThumbImage;
  final Color? thumbColor;
  final Color? trackColor;
  final IconData? thumbIcon;
  final DragStartBehavior dragStartBehavior;
  final MaterialStateProperty<MouseCursor?>? mouseCursor;
  final double blur;
  final double opacity;
  final Gradient? gradient;
  final double trackHeight;
  final BorderRadius? borderRadius;

  const GlassSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.mouseCursor,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
    this.trackHeight = 4.0,
    this.borderRadius,
  })  : assert(value >= min && value <= max),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool enabled = onChanged != null;

    return GlassContainer(
      blur: blur,
      opacity: opacity * (enabled ? 1.0 : 0.6),
      borderRadius: borderRadius ?? BorderRadius.circular(trackHeight / 2),
      gradient: gradient,
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: trackHeight,
          activeTrackColor: activeColor ??
              (isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8)),
          inactiveTrackColor: inactiveColor ??
              (isDark ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.3)),
          thumbColor: thumbColor ??
              (isDark ? Colors.white : Colors.black),
          overlayColor: (thumbColor ?? (isDark ? Colors.white : Colors.black))
              .withOpacity(0.12),
          valueIndicatorColor: thumbColor ??
              (isDark ? Colors.white : Colors.black),
          valueIndicatorTextStyle: TextStyle(
            color: isDark ? Colors.black : Colors.white,
          ),
        ),
        child: Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: label,
          onChanged: enabled ? onChanged : null,
          onChangeStart: enabled ? onChangeStart : null,
          onChangeEnd: enabled ? onChangeEnd : null,
          mouseCursor: mouseCursor,
        ),
      ),
    );
  }
}

/// A range slider with a glassmorphic effect.
class GlassRangeSlider extends StatelessWidget {
  final RangeValues values;
  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangeStart;
  final ValueChanged<RangeValues>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final RangeLabels? labels;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final MouseCursor? mouseCursor;
  final double blur;
  final double opacity;
  final Gradient? gradient;
  final double trackHeight;
  final BorderRadius? borderRadius;

  const GlassRangeSlider({
    Key? key,
    required this.values,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.labels,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.mouseCursor,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
    this.trackHeight = 4.0,
    this.borderRadius,
  })  : assert(values.start >= min && values.end <= max),
        assert(values.start <= values.end),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool enabled = onChanged != null;

    return GlassContainer(
      blur: blur,
      opacity: opacity * (enabled ? 1.0 : 0.6),
      borderRadius: borderRadius ?? BorderRadius.circular(trackHeight / 2),
      gradient: gradient,
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: trackHeight,
          activeTrackColor: activeColor ??
              (isDark ? Colors.white.withOpacity(0.8) : Colors.black.withOpacity(0.8)),
          inactiveTrackColor: inactiveColor ??
              (isDark ? Colors.white.withOpacity(0.3) : Colors.black.withOpacity(0.3)),
          thumbColor: thumbColor ??
              (isDark ? Colors.white : Colors.black),
          overlayColor: (thumbColor ?? (isDark ? Colors.white : Colors.black))
              .withOpacity(0.12),
          valueIndicatorColor: thumbColor ??
              (isDark ? Colors.white : Colors.black),
          valueIndicatorTextStyle: TextStyle(
            color: isDark ? Colors.black : Colors.white,
          ),
        ),
        child: RangeSlider(
          values: values,
          min: min,
          max: max,
          divisions: divisions,
          labels: labels,
          onChanged: enabled ? onChanged : null,
          onChangeStart: enabled ? onChangeStart : null,
          onChangeEnd: enabled ? onChangeEnd : null,
          mouseCursor: mouseCursor,
        ),
      ),
    );
  }
} 