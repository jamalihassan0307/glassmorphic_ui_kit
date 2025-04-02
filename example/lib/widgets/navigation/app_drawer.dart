import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassNavigationDrawer(
      blur: 10,
      opacity: 0.2,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withAlpha(51),
          Colors.white.withAlpha(26),
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
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white24,
            child: Icon(Icons.auto_awesome, color: Colors.white, size: 40),
          ),
          SizedBox(height: 16),
          Text(
            'Glassmorphic UI Kit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Example Gallery',
            style: TextStyle(color: Colors.white70),
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
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
