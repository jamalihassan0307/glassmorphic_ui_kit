import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import '../widgets/home_content.dart';
import '../widgets/drawer_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    _scaleAnimation =
        Tween<double>(begin: 0.8, end: 1.0).animate(_scaleController);

    _fadeController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GlassNavigationDrawer(
        blur: 10,
        opacity: 0.2,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Colors.white.withAlpha(51),
            Colors.white.withAlpha(26),
          ],
        ),
        children: [DrawerContent()],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const [
              Colors.blue.shade600,
              Colors.purple.shade600,
            ],
          ),
        ),
        child: SafeArea(
          child: HomeContent(
            fadeAnimation: _fadeAnimation,
            scaleAnimation: _scaleAnimation,
          ),
        ),
      ),
      bottomNavigationBar: GlassNavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          GlassNavigationDestination(
            icon: const Icon(Icons.home, color: Colors.white70),
            selectedIcon: const Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          GlassNavigationDestination(
            icon: const Icon(Icons.search, color: Colors.white70),
            selectedIcon: const Icon(Icons.search, color: Colors.white),
            label: 'Search',
          ),
          GlassNavigationDestination(
            icon: const Icon(Icons.person, color: Colors.white70),
            selectedIcon: const Icon(Icons.person, color: Colors.white),
            label: 'Profile',
          ),
          GlassNavigationDestination(
            icon: const Icon(Icons.settings, color: Colors.white70),
            selectedIcon: const Icon(Icons.settings, color: Colors.white),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
