import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A navigation rail with a glassmorphic effect.
class GlassNavigationRail extends StatelessWidget {
  final List<GlassNavigationRailDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;
  final Widget? leading;
  final Widget? trailing;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final double? width;
  final bool extended;
  final bool useIndicator;
  final Color? indicatorColor;
  final NavigationRailLabelType labelType;

  const GlassNavigationRail({
    Key? key,
    required this.destinations,
    required this.selectedIndex,
    this.onDestinationSelected,
    this.leading,
    this.trailing,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.gradient,
    this.width,
    this.extended = false,
    this.useIndicator = true,
    this.indicatorColor,
    this.labelType = NavigationRailLabelType.all,
  })  : assert(destinations.length >= 2),
        assert(selectedIndex >= 0 && selectedIndex < destinations.length),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: width,
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ??
          const BorderRadius.horizontal(
            right: Radius.circular(16),
          ),
      gradient: gradient,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations,
        leading: leading,
        trailing: trailing,
        extended: extended,
        useIndicator: useIndicator,
        indicatorColor: indicatorColor,
        labelType: labelType,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

/// A destination item for [GlassNavigationRail].
class GlassNavigationRailDestination extends NavigationRailDestination {
  final double iconSize;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final Color? selectedLabelColor;
  final Color? unselectedLabelColor;

  GlassNavigationRailDestination({
    Key? key,
    required Widget icon,
    required Widget label,
    Widget? selectedIcon,
    this.iconSize = 24.0,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
  }) : super(
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
                  child: selectedIcon,
                )
              : null,
          label: DefaultTextStyle(
            style: TextStyle(
              color: unselectedLabelColor ?? Colors.white70,
            ),
            child: label,
          ),
        );
}
