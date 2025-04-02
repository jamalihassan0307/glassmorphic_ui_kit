import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A navigation drawer with a glassmorphic effect.
class GlassNavigationDrawer extends StatelessWidget {
  final Widget? header;
  final List<Widget> children;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Color? shadowColor;
  final double? elevation;

  const GlassNavigationDrawer({
    Key? key,
    this.header,
    this.children = const <Widget>[],
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.gradient,
    this.padding,
    this.width,
    this.backgroundColor,
    this.surfaceTintColor,
    this.shadowColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double effectiveWidth = width ?? MediaQuery.of(context).size.width * 0.85;

    return NavigationDrawer(
      backgroundColor: Colors.transparent,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      elevation: elevation ?? 0,
      children: [
        GlassContainer(
          width: effectiveWidth,
          blur: blur,
          opacity: opacity,
          borderRadius: borderRadius ?? const BorderRadius.horizontal(
            right: Radius.circular(16),
          ),
          gradient: gradient,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (header != null)
                Padding(
                  padding: padding ?? EdgeInsets.zero,
                  child: header!,
                ),
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}

/// A navigation drawer item with a glassmorphic effect.
class GlassNavigationDrawerItem extends StatelessWidget {
  final Widget? icon;
  final Widget? selectedIcon;
  final Widget label;
  final bool selected;
  final VoidCallback? onPressed;
  final double blur;
  final double opacity;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;

  const GlassNavigationDrawerItem({
    Key? key,
    this.icon,
    this.selectedIcon,
    required this.label,
    this.selected = false,
    this.onPressed,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                IconTheme(
                  data: IconThemeData(
                    color: selected ? Colors.white : Colors.white70,
                    size: 24.0,
                  ),
                  child: selected ? (selectedIcon ?? icon!) : icon!,
                ),
                const SizedBox(width: 12.0),
              ],
              Expanded(
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: selected ? Colors.white : Colors.white70,
                    fontWeight: selected ? FontWeight.bold : null,
                  ),
                  child: label,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 