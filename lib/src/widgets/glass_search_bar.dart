import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A search bar widget with a glassmorphic effect.
///
/// This widget provides a customizable search input field with a frosted glass appearance.
/// It supports all standard text input functionality with additional glassmorphic styling options.
///
/// Example:
/// ```dart
/// GlassSearchBar(
///   controller: _searchController,
///   hintText: 'Search...',
///   onChanged: (value) => _performSearch(value),
///   prefixIcon: Icon(Icons.search),
///   blur: 10.0,
///   opacity: 0.2,
/// )
/// ```
class GlassSearchBar extends StatelessWidget {
  /// The controller for the search text field.
  final TextEditingController? controller;

  /// The placeholder text shown when the search field is empty.
  final String? hintText;

  /// The style for the input text.
  final TextStyle? textStyle;

  /// The style for the hint text.
  final TextStyle? hintStyle;

  /// An icon widget to show before the search text.
  final Widget? prefixIcon;

  /// An icon widget to show after the search text.
  final Widget? suffixIcon;

  /// Called when the search field is tapped.
  final VoidCallback? onTap;

  /// Called when the search text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the search field.
  final ValueChanged<String>? onSubmitted;

  /// The intensity of the blur effect.
  ///
  /// Defaults to [GlassConstants.defaultBlur].
  final double blur;

  /// The opacity of the glass effect.
  ///
  /// Defaults to [GlassConstants.defaultOpacity].
  final double opacity;

  /// The border radius of the search bar.
  final BorderRadius? borderRadius;

  /// Optional gradient to be applied over the blur effect.
  final Gradient? gradient;

  /// Padding around the entire search bar.
  final EdgeInsetsGeometry? padding;

  /// Padding around the input text and icons.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether to focus the search field when it is first displayed.
  ///
  /// Defaults to false.
  final bool autofocus;

  /// An optional focus node to control the focus of the search field.
  final FocusNode? focusNode;

  /// Whether the search field is enabled.
  ///
  /// Defaults to true.
  final bool enabled;

  /// Creates a glass search bar.
  ///
  /// The search bar can be customized with various visual and behavioral properties.
  /// Use [controller] to manage the search text programmatically.
  /// Use [onChanged] to receive updates when the search text changes.
  /// Use [onSubmitted] to handle search submissions.
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
