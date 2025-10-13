import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassNavigationDrawer(
      blur: 15,
      opacity: 0.15,
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0x40FFFFFF), // Colors.white.withOpacity(0.25)
          Color(0x1AFFFFFF), // Colors.white.withOpacity(0.1)
        ],
      ),
      children: [
        _buildHeader(),
        const Divider(color: Colors.white24),
        _buildNavigationItem(
          context,
          'Components Gallery',
          Icons.widgets,
          '/components',
        ),
        _buildNavigationItem(
          context,
          'Navigation Bar',
          Icons.navigation,
          '/navigation/bar',
        ),
        _buildNavigationItem(
          context,
          'Navigation Rail',
          Icons.view_sidebar,
          '/navigation/rail',
        ),
        _buildNavigationItem(
          context,
          'Navigation Drawer',
          Icons.menu,
          '/navigation/drawer',
        ),
        _buildNavigationItem(
          context,
          'Tab Bar',
          Icons.tab,
          '/navigation/tabs',
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: const Icon(
              Icons.auto_awesome,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Glassmorphic UI Kit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Example Gallery',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(
    BuildContext context,
    String title,
    IconData icon,
    String route,
  ) {
    final isSelected = ModalRoute.of(context)?.settings.name == route;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? Colors.white.withValues(alpha: 0.15) : null,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.white70,
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: () {
          Navigator.pop(context); // Close the drawer
          if (!isSelected) {
            Navigator.pushNamed(context, route);
          }
        },
      ),
    );
  }
}
