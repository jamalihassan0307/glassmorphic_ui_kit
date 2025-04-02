import 'package:flutter/material.dart';

class GlassAnimation {
  static Animation<double> fadeIn({
    required AnimationController controller,
    Duration? duration,
  }) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  static Animation<double> scaleIn({
    required AnimationController controller,
    Duration? duration,
  }) {
    return Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }
} 