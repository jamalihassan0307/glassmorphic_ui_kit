import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';

class AppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassNavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        GlassNavigationDestination(
          icon: Icon(Icons.dashboard_outlined, color: Colors.white70),
          selectedIcon: Icon(Icons.dashboard, color: Colors.white),
          label: 'Components',
        ),
        GlassNavigationDestination(
          icon: Icon(Icons.palette_outlined, color: Colors.white70),
          selectedIcon: Icon(Icons.palette, color: Colors.white),
          label: 'Themes',
        ),
        GlassNavigationDestination(
          icon: Icon(Icons.code_outlined, color: Colors.white70),
          selectedIcon: Icon(Icons.code, color: Colors.white),
          label: 'Code',
        ),
        GlassNavigationDestination(
          icon: Icon(Icons.info_outline, color: Colors.white70),
          selectedIcon: Icon(Icons.info, color: Colors.white),
          label: 'About',
        ),
      ],
    );
  }
} 