import 'package:flutter/material.dart';
import 'glass_theme.dart';

/// A utility class that provides animation capabilities for glassmorphic widgets.
///
/// This class contains methods for creating smooth transitions between different
/// glass themes and provides utility methods for common animation patterns.
///
/// Example:
/// ```dart
/// final animation = GlassAnimation.themeTween(
///   GlassTheme(blur: 5, opacity: 0.1),
///   GlassTheme(blur: 15, opacity: 0.3),
/// ).animate(controller);
/// ```
class GlassAnimation {
  /// Creates a tween for animating between two glass themes.
  ///
  /// Parameters:
  /// * [begin] - The starting glass theme
  /// * [end] - The ending glass theme
  ///
  /// Returns a [Tween] that can interpolate between the two themes.
  static Tween<GlassTheme> themeTween(GlassTheme begin, GlassTheme end) {
    return _GlassThemeTween(begin: begin, end: end);
  }

  /// Creates an animated builder for glass theme transitions.
  ///
  /// This method provides a convenient way to animate between two glass themes
  /// using an animation controller.
  ///
  /// Parameters:
  /// * [builder] - A function that builds the widget tree based on the current theme
  /// * [begin] - The starting glass theme
  /// * [end] - The ending glass theme
  /// * [animation] - The animation that drives the transition
  /// * [child] - An optional child widget that doesn't depend on the animation
  ///
  /// Returns an [AnimatedBuilder] that rebuilds when the animation value changes.
  static Widget builder({
    required Widget Function(BuildContext, GlassTheme, Widget?) builder,
    required GlassTheme begin,
    required GlassTheme end,
    required Animation<double> animation,
    Widget? child,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final GlassTheme theme = GlassTheme.lerp(begin, end, animation.value);
        return builder(context, theme, child);
      },
      child: child,
    );
  }
}

/// A tween for interpolating between two glass themes.
///
/// This class handles the smooth transition between two [GlassTheme] instances,
/// interpolating all their properties based on the animation value.
class _GlassThemeTween extends Tween<GlassTheme> {
  _GlassThemeTween({
    required GlassTheme begin,
    required GlassTheme end,
  }) : super(begin: begin, end: end);

  @override
  GlassTheme lerp(double t) => GlassTheme.lerp(begin, end, t);
}

/// Extension methods for adding glass animations to widgets.
///
/// These methods provide easy-to-use animation wrappers for any widget,
/// adding glassmorphic effects with smooth transitions.
extension GlassAnimationExtension on Widget {
  /// Wraps the widget with a glass fade transition.
  ///
  /// Creates a fade animation with glassmorphic properties.
  ///
  /// Parameters:
  /// * [animation] - The animation that drives the transition
  /// * [theme] - Optional glass theme to apply during the animation
  Widget glassFadeTransition({
    required Animation<double> animation,
    GlassTheme? theme,
  }) {
    return FadeTransition(
      opacity: animation,
      child: this,
    );
  }

  /// Wraps the widget with a glass scale transition.
  ///
  /// Creates a scale animation with glassmorphic properties.
  ///
  /// Parameters:
  /// * [animation] - The animation that drives the transition
  /// * [alignment] - The alignment point for the scaling animation
  /// * [theme] - Optional glass theme to apply during the animation
  Widget glassScaleTransition({
    required Animation<double> animation,
    Alignment alignment = Alignment.center,
    GlassTheme? theme,
  }) {
    return ScaleTransition(
      scale: animation,
      alignment: alignment,
      child: this,
    );
  }

  /// Wraps the widget with a glass slide transition.
  ///
  /// Creates a slide animation with glassmorphic properties.
  ///
  /// Parameters:
  /// * [animation] - The animation that drives the transition
  /// * [beginOffset] - The starting offset for the slide animation
  /// * [endOffset] - The ending offset for the slide animation
  /// * [theme] - Optional glass theme to apply during the animation
  Widget glassSlideTransition({
    required Animation<double> animation,
    Offset beginOffset = const Offset(-1.0, 0.0),
    Offset endOffset = Offset.zero,
    GlassTheme? theme,
  }) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: beginOffset,
        end: endOffset,
      ).animate(animation),
      child: this,
    );
  }
}
