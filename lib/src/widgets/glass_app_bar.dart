import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A glassmorphic app bar widget.
class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final double blur;
  final double opacity;
  final double height;
  final Gradient? gradient;

  const GlassAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.height = kToolbarHeight,
    this.gradient,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: preferredSize.height,
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      child: SafeArea(
        child: Row(
          children: [
            if (leading != null)
              leading!
            else if (Navigator.canPop(context))
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            if (title != null)
              Expanded(
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                  child: title!,
                ),
              ),
            if (actions != null) ...actions!,
          ],
        ),
      ),
    );
  }
} 