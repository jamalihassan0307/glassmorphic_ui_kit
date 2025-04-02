import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A switch widget with a glassmorphic effect.
///
/// This widget provides a customizable switch control with a frosted glass appearance.
/// It supports all standard switch functionality with additional glassmorphic styling options.
///
/// Example:
/// ```dart
/// GlassSwitch(
///   value: _isEnabled,
///   onChanged: (value) => setState(() => _isEnabled = value),
///   activeColor: Colors.blue,
///   blur: 10.0,
///   opacity: 0.2,
/// )
/// ```
class GlassSwitch extends StatelessWidget {
  /// Whether this switch is on or off.
  final bool value;

  /// Called when the user toggles the switch.
  final ValueChanged<bool>? onChanged;

  /// The color to use when this switch is on.
  final Color? activeColor;

  /// The color to use when this switch is off.
  final Color? inactiveColor;

  /// The color of the track when this switch is on.
  final Color? activeTrackColor;

  /// The color of the track when this switch is off.
  final Color? inactiveTrackColor;

  /// An image to use for the thumb when the switch is on.
  final ImageProvider? activeThumbImage;

  /// An image to use for the thumb when the switch is off.
  final ImageProvider? inactiveThumbImage;

  /// The color of the thumb based on the current state of the switch.
  final WidgetStateProperty<Color?>? thumbColor;

  /// The color of the track based on the current state of the switch.
  final WidgetStateProperty<Color?>? trackColor;

  /// The icon of the thumb based on the current state of the switch.
  final WidgetStateProperty<Icon?>? thumbIcon;

  /// Determines how drag start behavior is handled.
  ///
  /// Defaults to [DragStartBehavior.start].
  final DragStartBehavior dragStartBehavior;

  /// The cursor for a mouse pointer when it enters or is hovering over the switch.
  final MouseCursor? mouseCursor;

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

  /// The border radius of the switch container.
  final BorderRadius? borderRadius;

  /// Whether the switch should focus itself if nothing else is already focused.
  final bool autofocus;

  /// An optional focus node to use as the focus node for this switch.
  final FocusNode? focusNode;

  /// Creates a glass switch.
  ///
  /// The [value] parameter determines whether this switch is on or off.
  /// The [onChanged] parameter is called when the user toggles the switch.
  const GlassSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
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
    this.borderRadius,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool enabled = onChanged != null;

    final defaultActiveColor = isDark ? Colors.white : Colors.black;
    final defaultInactiveColor = isDark ? Colors.white38 : Colors.black38;

    return GlassContainer(
      blur: blur,
      opacity: opacity * (enabled ? 1.0 : 0.6),
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      gradient: gradient,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? defaultActiveColor,
        inactiveThumbColor: inactiveColor ?? defaultInactiveColor,
        activeTrackColor: activeTrackColor ?? defaultActiveColor.withAlpha(128),
        inactiveTrackColor:
            inactiveTrackColor ?? defaultInactiveColor.withAlpha(77),
        activeThumbImage: activeThumbImage,
        inactiveThumbImage: inactiveThumbImage,
        thumbColor: thumbColor,
        trackColor: trackColor,
        thumbIcon: thumbIcon,
        dragStartBehavior: dragStartBehavior,
        mouseCursor: mouseCursor,
        autofocus: autofocus,
        focusNode: focusNode,
      ),
    );
  }
}
