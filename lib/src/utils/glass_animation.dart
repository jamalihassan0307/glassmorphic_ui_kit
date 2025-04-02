import 'package:flutter/material.dart';
import 'glass_theme.dart';

/// A class that provides animation utilities for glassmorphic widgets.
class GlassAnimation {
  /// Creates a tween for animating between two glass themes.
  static Tween<GlassTheme> themeTween(GlassTheme begin, GlassTheme end) {
    return _GlassThemeTween(begin: begin, end: end);
  }

  /// Creates an animated builder for glass theme transitions.
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
class _GlassThemeTween extends Tween<GlassTheme> {
  _GlassThemeTween({
    required GlassTheme begin,
    required GlassTheme end,
  }) : super(begin: begin, end: end);

  @override
  GlassTheme lerp(double t) => GlassTheme.lerp(begin, end, t);
}

/// Extension methods for glass animations.
extension GlassAnimationExtension on Widget {
  /// Wraps the widget with a glass fade transition.
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