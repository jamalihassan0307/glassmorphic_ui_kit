import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glassmorphic UI Kit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: GlassTheme.defaultAnimationDuration,
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: GlassTheme.defaultAnimationDuration,
      vsync: this,
    );

    _fadeAnimation = GlassAnimation.fadeIn(controller: _fadeController);
    _scaleAnimation = GlassAnimation.scaleIn(controller: _scaleController);

    _fadeController.forward();
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _showGlassDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => GlassDialog(
        title: const Text(
          'Glass Dialog',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'This is a glassmorphic dialog with blur effect and gradient overlay. '
          'You can customize the blur intensity, gradient colors, and border radius.',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GlassButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showGlassBottomSheet(BuildContext context) {
    GlassBottomSheet.show(
      context: context,
      height: 300,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withAlpha(51),
          Colors.white.withAlpha(26),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Glass Bottom Sheet',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'This is a glassmorphic bottom sheet with customizable height, '
            'blur effect, and gradient overlay.',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          GlassButton(
            onPressed: () => Navigator.pop(context),
            gradient: LinearGradient(
              colors: [
                Colors.blue.withAlpha(77),
                Colors.purple.withAlpha(51),
              ],
            ),
            child: const Text('Close', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerContent() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.white, size: 32),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            ],
          ),
        ),
        const Divider(color: Colors.white24),
        GlassDrawerTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          selected: true,
          onTap: () {},
        ),
        GlassDrawerTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        GlassDrawerTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          subtitle: const Text('Version 1.0.0'),
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GlassDrawer(
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
        child: _buildDrawerContent(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade600,
              Colors.purple.shade600,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
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
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
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
                            Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 48,
                            ),
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
                ),
                const SizedBox(height: 30),
                Row(
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
                              Text(
                                "Blur Effect",
                                style: TextStyle(color: Colors.white),
                              ),
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
                              Text(
                                "Gradient",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      GlassButton(
                        onPressed: () => _showGlassDialog(context),
                        blur: 10,
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withAlpha(77),
                            Colors.purple.withAlpha(51),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.info_outline, color: Colors.white),
                            const SizedBox(width: 8),
                            const Text(
                              "Show Glass Dialog",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GlassButton(
                        onPressed: () => _showGlassBottomSheet(context),
                        blur: 10,
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.withAlpha(77),
                            Colors.blue.withAlpha(51),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.swipe_up, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Show Bottom Sheet",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GlassBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          GlassBottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          GlassBottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          GlassBottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          GlassBottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
