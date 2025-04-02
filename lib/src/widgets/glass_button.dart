// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A glassmorphic button widget that provides a frosted glass effect.
class GlassButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final bool enabled;
  final Duration animationDuration;

  const GlassButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.padding,
    this.gradient,
    this.enabled = true,
    this.animationDuration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.enabled && widget.onPressed != null) {
      setState(() => _isPressed = true);
      _controller.reverse();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.enabled && widget.onPressed != null) {
      setState(() => _isPressed = false);
      _controller.forward();
      widget.onPressed?.call();
    }
  }

  void _handleTapCancel() {
    if (widget.enabled && widget.onPressed != null) {
      setState(() => _isPressed = false);
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveOpacity =
        widget.enabled ? widget.opacity : widget.opacity * 0.6;
    final effectivePadding = widget.padding ??
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        );

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 0.95 + (_controller.value * 0.05),
            child: Padding(
              padding: effectivePadding,
              child: GlassContainer(
                blur: widget.blur,
                opacity: effectiveOpacity,
                borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
                gradient: widget.gradient,
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color:
                                widget.enabled ? Colors.white : Colors.white60,
                          ) ??
                      const TextStyle(color: Colors.white),
                  child: widget.child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
