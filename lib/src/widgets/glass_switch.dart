import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A switch with a glassmorphic effect.
class GlassSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final MaterialStateProperty<Color?>? thumbColor;
  final MaterialStateProperty<Color?>? trackColor;
  final MaterialStateProperty<Icon?>? thumbIcon;
  final DragStartBehavior dragStartBehavior;
  final MouseCursor? mouseCursor;
  final double blur;
  final double opacity;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final bool autofocus;
  final FocusNode? focusNode;

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
        activeTrackColor:
            activeTrackColor ?? defaultActiveColor.withOpacity(0.5),
        inactiveTrackColor:
            inactiveTrackColor ?? defaultInactiveColor.withOpacity(0.3),
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
