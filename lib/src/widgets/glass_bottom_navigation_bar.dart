import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A glassmorphic bottom navigation bar widget.
class GlassBottomNavigationBar extends StatelessWidget {
  final List<GlassBottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final double blur;
  final double opacity;
  final double height;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const GlassBottomNavigationBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    this.onTap,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.height = kBottomNavigationBarHeight,
    this.gradient,
    this.padding,
    this.borderRadius,
  })  : assert(items.length >= 2),
        assert(currentIndex >= 0 && currentIndex < items.length),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      borderRadius: borderRadius ?? const BorderRadius.vertical(top: Radius.circular(16)),
      child: SafeArea(
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;
              
              return Expanded(
                child: InkWell(
                  onTap: onTap != null ? () => onTap!(index) : null,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconTheme(
                          data: IconThemeData(
                            color: isSelected ? Colors.white : Colors.white60,
                            size: 24,
                          ),
                          child: item.icon,
                        ),
                        if (item.label != null)
                          DefaultTextStyle(
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: isSelected ? Colors.white : Colors.white60,
                            ) ?? TextStyle(
                              color: isSelected ? Colors.white : Colors.white60,
                              fontSize: 12,
                            ),
                            child: Text(item.label!),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// An item in a [GlassBottomNavigationBar].
class GlassBottomNavigationBarItem {
  final Widget icon;
  final String? label;

  const GlassBottomNavigationBarItem({
    required this.icon,
    this.label,
  });
} 