import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';

class Dialogs {
  static void showGlassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => GlassDialog(
        title: const Text(
          'Glass Dialog',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'This is a glassmorphic dialog with blur effect and gradient overlay. '
          'You can customize the blur intensity, gradient colors, and border radius.',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GlassButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  static void showGlassBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GlassContainer(
        height: 300,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withAlpha(51),
            Colors.white.withAlpha(26),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Glass Bottom Sheet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'This is a glassmorphic bottom sheet with customizable height, '
                'blur effect, and gradient overlay.',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            GlassButton(
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withAlpha(77),
                  Colors.purple.withAlpha(51),
                ],
              ),
              child: const Text('Close', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
