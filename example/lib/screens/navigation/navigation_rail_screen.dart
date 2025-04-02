import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import '../../widgets/common/example_screen.dart';

class NavigationRailScreen extends StatefulWidget {
  const NavigationRailScreen({Key? key}) : super(key: key);

  @override
  State<NavigationRailScreen> createState() => _NavigationRailScreenState();
}

class _NavigationRailScreenState extends State<NavigationRailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ExampleScreen(
      title: 'Navigation Rail',
      children: [
        const Text(
          'Basic Navigation Rail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GlassContainer(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              GlassNavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) =>
                    setState(() => _selectedIndex = index),
                destinations: const [
                  GlassNavigationRailDestination(
                    icon: Icon(Icons.home_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.home, color: Colors.white),
                    label: Text('Home'),
                  ),
                  GlassNavigationRailDestination(
                    icon: Icon(Icons.favorite_outline, color: Colors.white70),
                    selectedIcon: Icon(Icons.favorite, color: Colors.white),
                    label: Text('Favorites'),
                  ),
                  GlassNavigationRailDestination(
                    icon: Icon(Icons.person_outline, color: Colors.white70),
                    selectedIcon: Icon(Icons.person, color: Colors.white),
                    label: Text('Profile'),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GlassContainer(
                  child: Center(
                    child: Text(
                      'Selected Index: $_selectedIndex',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Customized Navigation Rail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GlassContainer(
          width: double.infinity,
          height: 300,
          padding: const EdgeInsets.all(16),
          gradient: LinearGradient(
            colors: [
              Colors.purple.withAlpha(77),
              Colors.blue.withAlpha(51),
            ],
          ),
          child: Row(
            children: [
              GlassNavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (index) =>
                    setState(() => _selectedIndex = index),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withAlpha(77),
                    Colors.blue.withAlpha(51),
                  ],
                ),
                leading: Column(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
                destinations: const [
                  GlassNavigationRailDestination(
                    icon: Icon(Icons.dashboard_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.dashboard, color: Colors.white),
                    label: Text('Dashboard'),
                  ),
                  GlassNavigationRailDestination(
                    icon: Icon(Icons.analytics_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.analytics, color: Colors.white),
                    label: Text('Analytics'),
                  ),
                  GlassNavigationRailDestination(
                    icon: Icon(Icons.settings_outlined, color: Colors.white70),
                    selectedIcon: Icon(Icons.settings, color: Colors.white),
                    label: Text('Settings'),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GlassContainer(
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.withAlpha(51),
                      Colors.blue.withAlpha(26),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Selected Index: $_selectedIndex',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
} 