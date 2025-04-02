import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A text field with a glassmorphic effect.
class GlassTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final double blur;
  final double opacity;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  const GlassTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.borderRadius,
    this.padding,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      borderRadius: borderRadius ?? BorderRadius.circular(15),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        style: textStyle ?? const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyle(color: Colors.white.withAlpha(153)),
          border: InputBorder.none,
          contentPadding: padding ?? const EdgeInsets.all(16),
        ),
      ),
    );
  }
} 