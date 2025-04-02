import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A menu button with a glassmorphic effect.
class GlassMenuButton<T> extends StatelessWidget {
  final T? initialValue;
  final List<PopupMenuEntry<T>> items;
  final PopupMenuItemSelected<T>? onSelected;
  final Widget? child;
  final String? tooltip;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final Color? iconColor;
  final double? iconSize;
  final Offset? offset;
  final bool enabled;

  const GlassMenuButton({
    Key? key,
    this.initialValue,
    required this.items,
    this.onSelected,
    this.child,
    this.tooltip,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.gradient,
    this.padding,
    this.iconColor,
    this.iconSize,
    this.offset,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return GlassContainer(
      blur: blur,
      opacity: opacity * (enabled ? 1.0 : 0.6),
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      gradient: gradient,
      child: PopupMenuButton<T>(
        initialValue: initialValue,
        onSelected: enabled ? onSelected : null,
        enabled: enabled,
        tooltip: tooltip,
        offset: offset ?? Offset.zero,
        itemBuilder: (context) => items,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: child ??
              Icon(
                Icons.more_vert,
                color: iconColor ?? (isDark ? Colors.white : Colors.black),
                size: iconSize ?? 24.0,
              ),
        ),
      ),
    );
  }
}

/// A menu item with a glassmorphic effect.
class GlassMenuItem<T> extends PopupMenuItem<T> {
  final double blur;
  final double opacity;
  final Gradient? gradient;

  GlassMenuItem({
    Key? key,
    T? value,
    bool enabled = true,
    required Widget child,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
  }) : super(
          key: key,
          value: value,
          enabled: enabled,
          child: GlassContainer(
            blur: blur,
            opacity: opacity * (enabled ? 1.0 : 0.6),
            gradient: gradient,
            child: child,
          ),
        );
}
