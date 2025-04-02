import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A search bar with a glassmorphic effect.
class GlassSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final bool autofocus;
  final FocusNode? focusNode;
  final bool enabled;

  const GlassSearchBar({
    Key? key,
    this.controller,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.gradient,
    this.padding,
    this.contentPadding,
    this.autofocus = false,
    this.focusNode,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: GlassContainer(
        blur: blur,
        opacity: opacity * (enabled ? 1.0 : 0.6),
        borderRadius: borderRadius ?? BorderRadius.circular(24),
        gradient: gradient,
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autofocus,
          enabled: enabled,
          style: textStyle?.copyWith(
                color: enabled
                    ? (isDark ? Colors.white : Colors.black)
                    : (isDark ? Colors.white38 : Colors.black38),
              ) ??
              TextStyle(
                color: enabled
                    ? (isDark ? Colors.white : Colors.black)
                    : (isDark ? Colors.white38 : Colors.black38),
              ),
          decoration: InputDecoration(
            hintText: hintText ?? 'Search',
            hintStyle: hintStyle?.copyWith(
                  color: enabled
                      ? (isDark ? Colors.white70 : Colors.black54)
                      : (isDark ? Colors.white38 : Colors.black38),
                ) ??
                TextStyle(
                  color: enabled
                      ? (isDark ? Colors.white70 : Colors.black54)
                      : (isDark ? Colors.white38 : Colors.black38),
                ),
            prefixIcon: prefixIcon ??
                Icon(
                  Icons.search,
                  color: enabled
                      ? (isDark ? Colors.white70 : Colors.black54)
                      : (isDark ? Colors.white38 : Colors.black38),
                ),
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
          ),
          onTap: enabled ? onTap : null,
          onChanged: enabled ? onChanged : null,
          onSubmitted: enabled ? onSubmitted : null,
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
