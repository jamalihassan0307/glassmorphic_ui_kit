import 'package:flutter/material.dart';
import 'glass_container.dart';

/// A dialog widget with a glassmorphic effect.
///
/// This widget creates a dialog with a frosted glass appearance, using blur and
/// gradient effects. It's ideal for displaying modal content with a modern,
/// translucent look.
///
/// Example:
/// ```dart
/// showDialog(
///   context: context,
///   builder: (context) => GlassDialog(
///     title: Text('Confirmation'),
///     content: Text('Are you sure you want to proceed?'),
///     actions: [
///       GlassButton(
///         onPressed: () => Navigator.pop(context),
///         child: Text('Cancel'),
///       ),
///       GlassButton(
///         onPressed: () => Navigator.pop(context, true),
///         child: Text('Confirm'),
///       ),
///     ],
///   ),
/// );
/// ```
class GlassDialog extends StatelessWidget {
  /// The title of the dialog.
  ///
  /// Typically a [Text] widget. Displayed at the top of the dialog.
  final Widget? title;

  /// The content of the dialog.
  ///
  /// The primary content of the dialog. Can be any widget, but typically
  /// contains text or form elements.
  final Widget? content;

  /// The actions to display at the bottom of the dialog.
  ///
  /// Typically a list of [GlassButton]s that allow the user to respond
  /// to the dialog's content.
  final List<Widget>? actions;

  /// The intensity of the blur effect. Defaults to 10.
  ///
  /// Higher values create a more frosted appearance.
  final double blur;

  /// The border radius of the dialog.
  ///
  /// Controls the rounding of the dialog's corners. Defaults to 15 logical pixels.
  final BorderRadius? borderRadius;

  /// Optional gradient to be applied over the blur effect.
  ///
  /// Can be used to add color tinting or create visual hierarchy.
  final Gradient? gradient;

  /// Creates a glass dialog.
  ///
  /// All parameters are optional except [key].
  /// The [blur] parameter defaults to 10.0.
  const GlassDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
    this.blur = 10,
    this.borderRadius,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        blur: blur,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
        gradient: gradient,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) ...[
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleLarge!,
                  child: title!,
                ),
                const SizedBox(height: 16),
              ],
              if (content != null) ...[
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyMedium!,
                  child: content!,
                ),
                const SizedBox(height: 16),
              ],
              if (actions != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
