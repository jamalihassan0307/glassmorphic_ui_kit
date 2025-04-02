import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A scaffold with a glassmorphic effect.
class GlassScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;
  final double blur;
  final double opacity;
  final Gradient? gradient;

  const GlassScaffold({
    Key? key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (gradient != null)
          Container(
            decoration: BoxDecoration(gradient: gradient),
          ),
        GlassContainer(
          blur: blur,
          opacity: opacity,
          child: Scaffold(
            appBar: appBar,
            body: body,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            drawer: drawer,
            endDrawer: endDrawer,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            backgroundColor: backgroundColor ?? Colors.transparent,
          ),
        ),
      ],
    );
  }
}

/// A floating action button with a glassmorphic effect.
class GlassFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? tooltip;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final Gradient? gradient;
  final double? elevation;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const GlassFloatingActionButton({
    Key? key,
    this.onPressed,
    this.child,
    this.tooltip,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.gradient,
    this.elevation,
    this.foregroundColor,
    this.backgroundColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ?? BorderRadius.circular(28),
      gradient: gradient,
      child: Material(
        color: Colors.transparent,
        elevation: elevation ?? 6.0,
        borderRadius: borderRadius ?? BorderRadius.circular(28),
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius ?? BorderRadius.circular(28),
          child: Tooltip(
            message: tooltip ?? '',
            child: Padding(
              padding: padding ?? const EdgeInsets.all(16.0),
              child: IconTheme(
                data: IconThemeData(
                  color: foregroundColor ?? Colors.white,
                  size: 24.0,
                ),
                child: child ?? const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 