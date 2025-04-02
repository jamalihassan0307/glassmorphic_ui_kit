import 'package:flutter/material.dart';
import 'glass_container.dart';

/// A bottom sheet widget with a glassmorphic effect.
///
/// This widget creates a bottom sheet with a frosted glass appearance, using blur and
/// gradient effects. It can be used to display modal content from the bottom of the screen.
///
/// Example:
/// ```dart
/// GlassBottomSheet.show(
///   context: context,
///   child: ListView(
///     children: [
///       ListTile(title: Text('Item 1')),
///       ListTile(title: Text('Item 2')),
///     ],
///   ),
/// );
/// ```
class GlassBottomSheet extends StatelessWidget {
  /// The content to be displayed in the bottom sheet.
  final Widget child;

  /// The intensity of the blur effect. Defaults to 10.
  final double blur;

  /// Optional height of the bottom sheet. If null, the height will be determined by the content.
  final double? height;

  /// The border radius of the bottom sheet. Defaults to rounded top corners.
  final BorderRadius? borderRadius;

  /// Optional gradient to be applied over the blur effect.
  final Gradient? gradient;

  /// Padding around the content. Defaults to EdgeInsets.all(16.0).
  final EdgeInsetsGeometry? padding;

  /// Creates a glass bottom sheet.
  ///
  /// The [child] parameter is required and specifies the content of the bottom sheet.
  /// The [blur] parameter controls the intensity of the frosted glass effect.
  /// The [height] parameter can be used to set a fixed height for the bottom sheet.
  /// The [borderRadius] parameter controls the rounding of the corners.
  /// The [gradient] parameter can be used to add a gradient overlay.
  /// The [padding] parameter controls the spacing around the content.
  const GlassBottomSheet({
    Key? key,
    required this.child,
    this.blur = 10,
    this.height,
    this.borderRadius,
    this.gradient,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      blur: blur,
      borderRadius: borderRadius ??
          const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
      gradient: gradient,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(128),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  /// Shows a modal bottom sheet with a glassmorphic effect.
  ///
  /// Parameters:
  /// * [context] - The build context
  /// * [child] - The content to be displayed in the bottom sheet
  /// * [blur] - The intensity of the blur effect (default: 10)
  /// * [height] - Optional fixed height for the bottom sheet
  /// * [borderRadius] - Custom border radius for the sheet
  /// * [gradient] - Optional gradient overlay
  /// * [padding] - Custom padding around the content
  ///
  /// Returns a [Future] that resolves to the value passed to [Navigator.pop]
  /// when the bottom sheet is closed.
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double blur = 10,
    double? height,
    BorderRadius? borderRadius,
    Gradient? gradient,
    EdgeInsetsGeometry? padding,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassBottomSheet(
        blur: blur,
        height: height,
        borderRadius: borderRadius,
        gradient: gradient,
        padding: padding,
        child: child,
      ),
    );
  }
}
