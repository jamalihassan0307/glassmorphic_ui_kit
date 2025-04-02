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
        _buildNavigationSection(
          context,
          'Navigation',
          [
            ('Navigation Bar', '/navigation/bar'),
            ('Navigation Rail', '/navigation/rail'),
            ('Navigation Drawer', '/navigation/drawer'),
            ('Tab Bar', '/navigation/tabs'),
          ],
        ),
        _buildNavigationSection(
          context,
          'Inputs',
          [
            ('Buttons', '/inputs/buttons'),
            ('Text Fields', '/inputs/text-fields'),
            ('Sliders', '/inputs/sliders'),
            ('Switches', '/inputs/switches'),
            ('Menu Button', '/inputs/menu'),
            ('Search Bar', '/inputs/search'),
          ],
        ),
        _buildNavigationSection(
          context,
          'Feedback',
          [
            ('Dialogs', '/feedback/dialogs'),
            ('Bottom Sheets', '/feedback/bottom-sheets'),
            ('Progress Indicators', '/feedback/progress'),
          ],
        ),
        _buildNavigationSection(
          context,
          'Layout',
          [
            ('Container', '/layout/container'),
            ('Card', '/layout/card'),
            ('List Tile', '/layout/list-tile'),
            ('Scaffold', '/layout/scaffold'),
          ],
        ),
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

  Widget _buildNavigationSection(
    BuildContext context,
    String title,
    List<(String, String)> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...items.map(
          (item) => ListTile(
            leading: const Icon(Icons.chevron_right, color: Colors.white70),
            title: Text(
              item.$1,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.pushNamed(context, item.$2),
          ),
        ),
        const Divider(color: Colors.white24),
      ],
    );
  }
} 