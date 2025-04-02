import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import 'dialogs.dart';

class HomeContent extends StatelessWidget {
  final Animation<double> fadeAnimation;
  final Animation<double> scaleAnimation;

  const HomeContent({
    Key? key,
    required this.fadeAnimation,
    required this.scaleAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Glassmorphic UI Kit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildAnimatedCard(),
          const SizedBox(height: 30),
          _buildFeatureCards(),
          const SizedBox(height: 30),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildAnimatedCard() {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: GlassCard(
          width: double.infinity,
          height: 200,
          blur: 20,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withAlpha(51),
              Colors.white.withAlpha(26),
            ],
          ),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome, color: Colors.white, size: 48),
                SizedBox(height: 16),
                Text(
                  "Animated Glass Card",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCards() {
    return Row(
      children: [
        Expanded(
          child: GlassCard(
            height: 120,
            blur: 15,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.blue.withAlpha(77),
                Colors.blue.withAlpha(26),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.blur_on, color: Colors.white),
                  SizedBox(height: 8),
                  Text("Blur Effect", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: GlassCard(
            height: 120,
            blur: 15,
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.purple.withAlpha(77),
                Colors.purple.withAlpha(26),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.gradient, color: Colors.white),
                  SizedBox(height: 8),
                  Text("Gradient", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GlassButton(
            onPressed: () => Dialogs.showGlassDialog(context),
            blur: 10,
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Colors.blue.withAlpha(77),
                Colors.purple.withAlpha(51),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.info_outline, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Show Glass Dialog",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GlassButton(
            onPressed: () => Dialogs.showGlassBottomSheet(context),
            blur: 10,
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Colors.purple.withAlpha(77),
                Colors.blue.withAlpha(51),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.swipe_up, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Show Bottom Sheet",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
