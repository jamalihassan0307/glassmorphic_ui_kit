import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import '../../widgets/common/example_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExampleScreen(
      title: 'Tab Bar',
      children: [
        const Text(
          'Basic Tab Bar',
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
                'A tab bar with glass effect. Perfect for content organization.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              GlassTabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Photos'),
                  Tab(text: 'Videos'),
                  Tab(text: 'Files'),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTabContent('Photos Content'),
                    _buildTabContent('Videos Content'),
                    _buildTabContent('Files Content'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Customized Tab Bar',
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
                'A tab bar with custom gradient and icons.',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              GlassTabBar(
                controller: _tabController,
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withAlpha(77),
                    Colors.blue.withAlpha(51),
                  ],
                ),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.image),
                    text: 'Photos',
                  ),
                  Tab(
                    icon: Icon(Icons.videocam),
                    text: 'Videos',
                  ),
                  Tab(
                    icon: Icon(Icons.folder),
                    text: 'Files',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildTabContent('Photos Content'),
                    _buildTabContent('Videos Content'),
                    _buildTabContent('Files Content'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(String text) {
    return GlassContainer(
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
