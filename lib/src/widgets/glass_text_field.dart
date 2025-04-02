import 'package:flutter/material.dart';
import 'glass_container.dart';
import '../utils/glass_constants.dart';

/// A Material Design text field with a glassmorphic effect.
///
/// This widget creates a text input field with a frosted glass appearance.
class GlassTextField extends StatelessWidget {
  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The text that suggests what sort of input the field accepts.
  final String? hintText;

  /// An icon that appears before the editable part of the text field.
  final Widget? prefixIcon;

  /// The intensity of the blur effect.
  ///
  /// Defaults to [GlassConstants.defaultBlur].
  final double blur;

  /// The opacity of the glass effect.
  ///
  /// Defaults to [GlassConstants.defaultOpacity].
  final double opacity;

  /// Optional gradient to be applied over the blur effect.
  final Gradient? gradient;

  /// Creates a glass text field.
  ///
  /// The [controller] is used to control the text being edited.
  const GlassTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.blur = GlassConstants.defaultBlur,
    this.opacity = GlassConstants.defaultOpacity,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      opacity: opacity,
      gradient: gradient,
      borderRadius: BorderRadius.circular(8),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white70),
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
