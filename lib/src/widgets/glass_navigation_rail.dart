import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A Material Design navigation rail with a glassmorphic effect.
///
/// A navigation rail provides an application with a side navigation that can be
/// expanded or collapsed. The rail is typically used for apps with multiple top-level
/// destinations that require quick switching between views.
class GlassNavigationRail extends StatelessWidget {
  /// The index into [destinations] for the current selected destination.
  final int selectedIndex;

  /// Called when one of the [destinations] is selected.
  final ValueChanged<int>? onDestinationSelected;

  /// The entries to be displayed in the rail.
  final List<GlassNavigationRailDestination> destinations;

  /// An optional leading widget that is placed above the destinations.
  final Widget? leading;

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

  /// The elevation of the glass navigation rail.
  ///
  /// Defaults to 1.
  final double elevation;

  /// Creates a glass navigation rail.
  ///
  /// The [selectedIndex] must be a valid index in [destinations].
  const GlassNavigationRail({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    this.leading,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
    this.elevation = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        leading: leading,
        elevation: elevation,
        destinations: destinations,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

/// A Material Design destination within a [GlassNavigationRail].
class GlassNavigationRailDestination extends NavigationRailDestination {
  /// Creates a glass navigation rail destination.
  ///
  /// The [icon] and [label] arguments must not be null.
  const GlassNavigationRailDestination({
    required Widget icon,
    required Widget label,
    Widget? selectedIcon,
  }) : super(
          icon: icon,
          label: label,
          selectedIcon: selectedIcon,
        );
}
