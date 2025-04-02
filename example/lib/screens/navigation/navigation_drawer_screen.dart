import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import '../../widgets/common/example_screen.dart';

class NavigationDrawerScreen extends StatelessWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExampleScreen(
      title: 'Navigation Drawer',
      children: [
        const Text(
          'Basic Navigation Drawer',
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
                'A navigation drawer with glass effect. Perfect for side navigation.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              GlassButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => SizedBox(
                      height: 400,
                      child: GlassNavigationDrawer(
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
                          _buildDrawerHeader(),
                          const Divider(color: Colors.white24),
                          _buildDrawerItem(
                            icon: Icons.home,
                            title: 'Home',
                            onTap: () => Navigator.pop(context),
                          ),
                          _buildDrawerItem(
                            icon: Icons.person,
                            title: 'Profile',
                            onTap: () => Navigator.pop(context),
                          ),
                          _buildDrawerItem(
                            icon: Icons.settings,
                            title: 'Settings',
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('Show Basic Drawer',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Customized Navigation Drawer',
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
                'A navigation drawer with custom gradient and styling.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              GlassButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => SizedBox(
                      height: 400,
                      child: GlassNavigationDrawer(
                        blur: 15,
                        opacity: 0.3,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.purple.withAlpha(77),
                            Colors.blue.withAlpha(51),
                          ],
                        ),
                        children: [
                          _buildCustomDrawerHeader(),
                          const Divider(color: Colors.white24),
                          _buildCustomDrawerItem(
                            icon: Icons.dashboard,
                            title: 'Dashboard',
                            subtitle: '5 new updates',
                            onTap: () => Navigator.pop(context),
                          ),
                          _buildCustomDrawerItem(
                            icon: Icons.analytics,
                            title: 'Analytics',
                            subtitle: 'View reports',
                            onTap: () => Navigator.pop(context),
                          ),
                          _buildCustomDrawerItem(
                            icon: Icons.notifications,
                            title: 'Notifications',
                            subtitle: '3 unread messages',
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withAlpha(77),
                    Colors.blue.withAlpha(51),
                  ],
                ),
                child: const Text('Show Custom Drawer',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.white24,
            child: Icon(Icons.person, color: Colors.white, size: 32),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'john.doe@example.com',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }

  Widget _buildCustomDrawerHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(32),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomDrawerItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
      trailing: const Icon(Icons.chevron_right, color: Colors.white70),
      onTap: onTap,
    );
  }
} 