// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';
import 'package:flutter/gestures.dart';

/// A slider widget with a glassmorphic effect.
///
/// This widget provides a customizable slider control with a frosted glass appearance.
/// It supports all standard slider functionality with additional glassmorphic styling options.
///
/// Example:
/// ```dart
/// GlassSlider(
///   value: _value,
///   onChanged: (value) => setState(() => _value = value),
///   min: 0.0,
///   max: 100.0,
///   divisions: 10,
///   label: '${_value.round()}',
///   blur: 10.0,
///   opacity: 0.2,
/// )
/// ```
class GlassSlider extends StatelessWidget {
  /// The current value of the slider.
  ///
  /// Must be between [min] and [max], inclusive.
  final double value;

  /// Called when the user starts dragging the slider.
  final ValueChanged<double>? onChangeStart;

  /// Called during drag operations.
  final ValueChanged<double>? onChanged;

  /// Called when the user is done selecting a new value for the slider.
  final ValueChanged<double>? onChangeEnd;

  /// The minimum value the user can select.
  ///
  /// Defaults to 0.0.
  final double min;

  /// The maximum value the user can select.
  ///
  /// Defaults to 1.0.
  final double max;

  /// The number of discrete divisions.
  ///
  /// If non-null, the slider will snap to these divisions.
  final int? divisions;

  /// A label to show above the slider when the user is dragging it.
  final String? label;

  /// The color of the active portion of the track.
  final Color? activeColor;

  /// The color of the inactive portion of the track.
  final Color? inactiveColor;

  /// The color of the active portion of the track.
  final Color? activeTrackColor;

  /// The color of the inactive portion of the track.
  final Color? inactiveTrackColor;

  /// An image to use for the active thumb.
  final String? activeThumbImage;

  /// An image to use for the inactive thumb.
  final String? inactiveThumbImage;

  /// The color of the thumb.
  final Color? thumbColor;

  /// The color of the track.
  final Color? trackColor;

  /// An icon to show on the thumb.
  final IconData? thumbIcon;

  /// Determines how drag start behavior is handled.
  ///
  /// Defaults to [DragStartBehavior.start].
  final DragStartBehavior dragStartBehavior;

  /// The cursor for a mouse pointer when it enters or is hovering over the slider.
  final MaterialStateMouseCursor? mouseCursor;

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

  /// The height of the track.
  ///
  /// Defaults to 4.0.
  final double trackHeight;

  /// The border radius of the slider track and thumb.
  final BorderRadius? borderRadius;

  /// Creates a glass slider.
  ///
  /// The [value] parameter must not be null and must be between [min] and [max], inclusive.
  /// The [min] parameter must be less than or equal to [max].
  /// The [divisions] parameter must be null or greater than 0.
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
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.thumbColor,
    this.trackColor,
    this.thumbIcon,
    this.dragStartBehavior = DragStartBehavior.start,
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
              (isDark
                  ? Colors.white.withOpacity(0.8)
                  : Colors.black.withOpacity(0.8)),
          inactiveTrackColor: inactiveColor ??
              (isDark
                  ? Colors.white.withOpacity(0.3)
                  : Colors.black.withOpacity(0.3)),
          thumbColor: thumbColor ?? (isDark ? Colors.white : Colors.black),
          overlayColor: (thumbColor ?? (isDark ? Colors.white : Colors.black))
              .withOpacity(0.12),
          valueIndicatorColor:
              thumbColor ?? (isDark ? Colors.white : Colors.black),
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
          mouseCursor: mouseCursor ?? MaterialStateMouseCursor.clickable,
        ),
      ),
    );
  }
}

/// A range slider with a glassmorphic effect.
///
/// This widget provides a customizable range slider control with a frosted glass appearance.
/// It supports all standard range slider functionality with additional glassmorphic styling options.
///
/// Example:
/// ```dart
/// GlassRangeSlider(
///   values: _values,
///   onChanged: (values) => setState(() => _values = values),
///   min: 0.0,
///   max: 100.0,
///   divisions: 10,
///   labels: RangeLabels('${_values.start}', '${_values.end}'),
///   blur: 10.0,
///   opacity: 0.2,
/// )
/// ```
class GlassRangeSlider extends StatelessWidget {
  /// The currently selected values for the start and end thumbs.
  final RangeValues values;

  /// Called when the user is selecting a new value for the slider by dragging.
  final ValueChanged<RangeValues>? onChanged;

  /// Called when the user starts dragging the slider.
  final ValueChanged<RangeValues>? onChangeStart;

  /// Called when the user is done selecting a new value for the slider by dragging.
  final ValueChanged<RangeValues>? onChangeEnd;

  /// The minimum value the user can select.
  final double min;

  /// The maximum value the user can select.
  final double max;

  /// The number of discrete divisions.
  final int? divisions;

  /// The labels to show above the slider thumbs when the user is dragging them.
  final RangeLabels? labels;

  /// The color of the active portion of the track.
  final Color? activeColor;

  /// The color of the inactive portion of the track.
  final Color? inactiveColor;

  /// The color of the thumb.
  final Color? thumbColor;

  /// The cursor for a mouse pointer when it enters or is hovering over the slider.
  final MaterialStateMouseCursor? mouseCursor;

  /// The intensity of the blur effect.
  final double blur;

  /// The opacity of the glass effect.
  final double opacity;

  /// Optional gradient to be applied over the blur effect.
  final Gradient? gradient;

  /// The height of the track.
  final double trackHeight;

  /// The border radius of the slider track and thumbs.
  final BorderRadius? borderRadius;

  /// Creates a glass range slider.
  ///
  /// The [values] parameter must not be null and its values must be between
  /// [min] and [max], inclusive.
  /// The [min] parameter must be less than or equal to [max].
  /// The [divisions] parameter must be null or greater than 0.
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
  }) : super(key: key);

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
              (isDark
                  ? Colors.white.withOpacity(0.8)
                  : Colors.black.withOpacity(0.8)),
          inactiveTrackColor: inactiveColor ??
              (isDark
                  ? Colors.white.withOpacity(0.3)
                  : Colors.black.withOpacity(0.3)),
          thumbColor: thumbColor ?? (isDark ? Colors.white : Colors.black),
          overlayColor: (thumbColor ?? (isDark ? Colors.white : Colors.black))
              .withOpacity(0.12),
          valueIndicatorColor:
              thumbColor ?? (isDark ? Colors.white : Colors.black),
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
          mouseCursor: mouseCursor ?? MaterialStateMouseCursor.clickable,
        ),
      ),
    );
  }
}
