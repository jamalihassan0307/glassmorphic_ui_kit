import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A navigation bar with a glassmorphic effect.
class GlassNavigationBar extends StatelessWidget {
  final List<GlassNavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final double blur;
  final double opacity;
  final double height;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final bool animateLabels;
  final NavigationDestinationLabelBehavior labelBehavior;

  const GlassNavigationBar({
    Key? key,
    required this.destinations,
    required this.selectedIndex,
    this.onDestinationSelected,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.height = 80.0,
    this.borderRadius,
    this.gradient,
    this.padding,
    this.animateLabels = true,
    this.labelBehavior = NavigationDestinationLabelBehavior.alwaysShow,
  })  : assert(destinations.length >= 2),
        assert(selectedIndex >= 0 && selectedIndex < destinations.length),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ??
          const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
      gradient: gradient,
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations,
        backgroundColor: Colors.transparent,
        elevation: 0,
        height: height,
        labelBehavior: labelBehavior,
      ),
    );
  }
}

/// A navigation destination with a glassmorphic effect.
class GlassNavigationDestination extends NavigationDestination {
  /// The size of the icon.
  final double iconSize;

  /// The color of the selected icon.
  final Color? selectedIconColor;

  /// The color of the unselected icon.
  final Color? unselectedIconColor;

  /// The color of the selected label.
  final Color? selectedLabelColor;

  /// The color of the unselected label.
  final Color? unselectedLabelColor;

  /// Creates a glass navigation destination.
  ///
  /// The [icon] and [label] parameters are required.
  /// The [iconSize] parameter defaults to 24.0.
  const GlassNavigationDestination({
    Key? key,
    required Widget icon,
    required String label,
    Widget? selectedIcon,
    this.iconSize = 24.0,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    String? tooltip,
  }) : super(
          key: key,
          icon: icon,
          selectedIcon: selectedIcon,
          label: label,
          tooltip: tooltip,
        );

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: IconTheme(
        data: IconThemeData(
          size: iconSize,
          color: unselectedIconColor ?? Colors.white70,
        ),
        child: icon,
      ),
      selectedIcon: selectedIcon != null
          ? IconTheme(
              data: IconThemeData(
                size: iconSize,
                color: selectedIconColor ?? Colors.white,
              ),
              child: selectedIcon!,
            )
          : null,
      label: label,
      tooltip: tooltip,
    );
  }
}
