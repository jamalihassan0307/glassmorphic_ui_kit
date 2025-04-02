import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A glassmorphic drawer widget.
class GlassDrawer extends StatelessWidget {
  final Widget? child;
  final double blur;
  final double opacity;
  final Gradient? gradient;
  final double? width;
  final Widget? header;
  final Color? scrimColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const GlassDrawer({
    Key? key,
    this.child,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
    this.width,
    this.header,
    this.scrimColor,
    this.borderRadius,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double effectiveWidth = width ?? MediaQuery.of(context).size.width * 0.85;
    
    return Drawer(
      width: effectiveWidth,
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        width: effectiveWidth,
        blur: blur,
        opacity: opacity,
        gradient: gradient,
        borderRadius: borderRadius ?? const BorderRadius.horizontal(right: Radius.circular(16)),
        child: Column(
          children: [
            if (header != null)
              header!,
            if (child != null)
              Expanded(
                child: Padding(
                  padding: padding ?? EdgeInsets.zero,
                  child: child!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// A list tile designed for use in [GlassDrawer].
class GlassDrawerTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool selected;
  final EdgeInsetsGeometry? padding;

  const GlassDrawerTile({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.selected = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconTheme(
                  data: IconThemeData(
                    color: selected ? Colors.white : Colors.white70,
                    size: 24,
                  ),
                  child: leading!,
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: selected ? Colors.white : Colors.white70,
                      ) ?? TextStyle(
                        color: selected ? Colors.white : Colors.white70,
                      ),
                      child: title!,
                    ),
                  if (subtitle != null)
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: selected ? Colors.white70 : Colors.white54,
                      ) ?? TextStyle(
                        color: selected ? Colors.white70 : Colors.white54,
                      ),
                      child: subtitle!,
                    ),
                ],
              ),
            ),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: IconTheme(
                  data: IconThemeData(
                    color: selected ? Colors.white : Colors.white70,
                    size: 24,
                  ),
                  child: trailing!,
                ),
              ),
          ],
        ),
      ),
    );
  }
} 