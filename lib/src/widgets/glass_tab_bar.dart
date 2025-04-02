import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A Material Design tab bar with a glassmorphic effect.
///
/// A tab bar displays a row of tabs, each representing a different view in an app.
/// This widget adds a glass effect to the standard [TabBar] widget.
class GlassTabBar extends StatelessWidget implements PreferredSizeWidget {
  /// The controller for this tab bar.
  final TabController controller;

  /// The tabs to display in this tab bar.
  final List<Widget> tabs;

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

  /// Creates a glass tab bar.
  ///
  /// The [controller] and [tabs] arguments must not be null.
  const GlassTabBar({
    Key? key,
    required this.controller,
    required this.tabs,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
