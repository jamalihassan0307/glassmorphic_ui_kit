import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A tab bar with a glassmorphic effect.
class GlassTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;
  final TabController? controller;
  final bool isScrollable;
  final EdgeInsetsGeometry? padding;
  final Color? indicatorColor;
  final double indicatorWeight;
  final EdgeInsetsGeometry? indicatorPadding;
  final Decoration? indicator;
  final TabBarIndicatorSize? indicatorSize;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final Color? unselectedLabelColor;
  final TextStyle? unselectedLabelStyle;
  final DragStartBehavior dragStartBehavior;
  final MaterialStateProperty<MouseCursor?>? mouseCursor;
  final ScrollPhysics? physics;
  final InteractiveInkFeatureFactory? splashFactory;
  final BorderRadius? borderRadius;
  final double blur;
  final double opacity;
  final Gradient? gradient;
  final double height;

  const GlassTabBar({
    Key? key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.padding,
    this.indicatorColor,
    this.indicatorWeight = 2.0,
    this.indicatorPadding,
    this.indicator,
    this.indicatorSize,
    this.labelColor,
    this.labelStyle,
    this.labelPadding,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.dragStartBehavior = DragStartBehavior.start,
    this.mouseCursor,
    this.physics,
    this.splashFactory,
    this.borderRadius,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return GlassContainer(
      height: height,
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius,
      gradient: gradient,
      child: TabBar(
        controller: controller,
        tabs: tabs,
        isScrollable: isScrollable,
        padding: padding,
        indicatorColor: indicatorColor ?? (isDark ? Colors.white : Colors.black),
        indicatorWeight: indicatorWeight,
        indicatorPadding: indicatorPadding ?? EdgeInsets.zero,
        indicator: indicator,
        indicatorSize: indicatorSize,
        labelColor: labelColor ?? (isDark ? Colors.white : Colors.black),
        labelStyle: labelStyle,
        labelPadding: labelPadding,
        unselectedLabelColor: unselectedLabelColor ??
            (isDark ? Colors.white60 : Colors.black54),
        unselectedLabelStyle: unselectedLabelStyle,
        dragStartBehavior: dragStartBehavior,
        mouseCursor: mouseCursor,
        physics: physics,
        splashFactory: splashFactory,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

/// A tab with a glassmorphic effect.
class GlassTab extends StatelessWidget {
  final Widget? icon;
  final Widget? text;
  final EdgeInsetsGeometry? padding;
  final double blur;
  final double opacity;
  final Gradient? gradient;
  final BorderRadius? borderRadius;

  const GlassTab({
    Key? key,
    this.icon,
    this.text,
    this.padding,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
    this.borderRadius,
  })  : assert(icon != null || text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      borderRadius: borderRadius,
      child: Tab(
        icon: icon,
        text: text is String ? text as String : null,
        child: text is! String ? text : null,
      ),
    );
  }
} 