import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import '../../widgets/common/example_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ExampleScreen(
      title: 'Navigation Bar',
      children: [
        const Text(
          'Basic Navigation Bar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GlassContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'A navigation bar with glass effect. Perfect for bottom navigation.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              GlassNavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) => setState(() => _selectedIndex = index),
                destinations: const [
                  GlassNavigationDestination(
                    icon: Icon(Icons.home_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.home, color: Colors.white),
                    label: 'Home',
                  ),
                  GlassNavigationDestination(
                    icon: Icon(Icons.favorite_outline, color: Colors.white70),
                    selectedIcon: Icon(Icons.favorite, color: Colors.white),
                    label: 'Favorites',
                  ),
                  GlassNavigationDestination(
                    icon: Icon(Icons.person_outline, color: Colors.white70),
                    selectedIcon: Icon(Icons.person, color: Colors.white),
                    label: 'Profile',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Customized Navigation Bar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GlassContainer(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          gradient: LinearGradient(
            colors: [
              Colors.purple.withAlpha(77),
              Colors.blue.withAlpha(51),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'A navigation bar with custom gradient and styling.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              GlassNavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) => setState(() => _selectedIndex = index),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withAlpha(77),
                    Colors.blue.withAlpha(51),
                  ],
                ),
                destinations: const [
                  GlassNavigationDestination(
                    icon: Icon(Icons.dashboard_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.dashboard, color: Colors.white),
                    label: 'Dashboard',
                  ),
                  GlassNavigationDestination(
                    icon: Icon(Icons.analytics_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.analytics, color: Colors.white),
                    label: 'Analytics',
                  ),
                  GlassNavigationDestination(
                    icon: Icon(Icons.settings_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.settings, color: Colors.white),
                    label: 'Settings',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
} 