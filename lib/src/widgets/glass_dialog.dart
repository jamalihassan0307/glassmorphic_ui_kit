import 'package:flutter/material.dart';
import 'glass_container.dart';

class GlassDialog extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final double blur;
  final BorderRadius? borderRadius;
  final Gradient? gradient;

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