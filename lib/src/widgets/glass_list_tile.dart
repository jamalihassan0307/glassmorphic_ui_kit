import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A ListTile with a glassmorphic effect.
class GlassListTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool selected;
  final bool enabled;
  final double blur;
  final double opacity;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final Gradient? gradient;

  const GlassListTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.enabled = true,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.contentPadding,
    this.borderRadius,
    this.gradient,
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
      child: InkWell(
        onTap: enabled ? onTap : null,
        onLongPress: enabled ? onLongPress : null,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        child: Padding(
          padding: contentPadding ??
              const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
          child: Row(
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconTheme(
                    data: IconThemeData(
                      color: _getIconColor(theme, isDark),
                      size: 24.0,
                    ),
                    child: leading!,
                  ),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      DefaultTextStyle(
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: _getTextColor(theme, isDark),
                          fontWeight: selected ? FontWeight.bold : null,
                        ),
                        child: title!,
                      ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4.0),
                      DefaultTextStyle(
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: _getSubtitleColor(theme, isDark),
                        ),
                        child: subtitle!,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: IconTheme(
                    data: IconThemeData(
                      color: _getIconColor(theme, isDark),
                      size: 24.0,
                    ),
                    child: trailing!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getIconColor(ThemeData theme, bool isDark) {
    if (!enabled) return isDark ? Colors.white38 : Colors.black38;
    return selected
        ? (isDark ? Colors.white : Colors.black)
        : (isDark ? Colors.white70 : Colors.black87);
  }

  Color _getTextColor(ThemeData theme, bool isDark) {
    if (!enabled) return isDark ? Colors.white38 : Colors.black38;
    return selected
        ? (isDark ? Colors.white : Colors.black)
        : (isDark ? Colors.white : Colors.black);
  }

  Color _getSubtitleColor(ThemeData theme, bool isDark) {
    if (!enabled) return isDark ? Colors.white24 : Colors.black26;
    return isDark ? Colors.white60 : Colors.black54;
  }
}
