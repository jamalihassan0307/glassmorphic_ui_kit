import 'package:flutter/material.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import 'screens/navigation/navigation_bar_screen.dart';
import 'screens/navigation/navigation_drawer_screen.dart';
import 'screens/navigation/navigation_rail_screen.dart';
import 'screens/navigation/tab_bar_screen.dart';
import 'screens/components/components_screen.dart';
import 'widgets/navigation/app_drawer.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/components': (context) => const ComponentsScreen(),
        '/navigation/bar': (context) => const NavigationBarScreen(),
        '/navigation/drawer': (context) => const NavigationDrawerScreen(),
        '/navigation/rail': (context) => const NavigationRailScreen(),
        '/navigation/tabs': (context) => const TabBarScreen(),
      },
    );
  }
  }


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.elasticOut,
          ),
        );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        // Logo/Icon
                        GlassContainer(
                          width: 120,
                          height: 120,
                          blur: 25,
                          opacity: 0.15,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(60),
                          child: const Center(
                            child: Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Title
                        const Text(
                          'Glassmorphic',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const Text(
                          'UI Kit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Beautiful glass morphism components\nfor modern Flutter applications',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Feature Cards
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildFeatureCard(
                          Icons.widgets,
                          'Components',
                          'Rich UI\nelements',
                          [
                            Colors.blue.withOpacity(0.9),
                            Colors.cyan.withOpacity(0.5),
                          ],
                          '/components',
                          context,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildFeatureCard(
                          Icons.palette,
                          'Customizable',
                          'Easy to\ncustomize',
                          [
                            Colors.purple.withOpacity(0.6),
                            Colors.pink.withOpacity(0.3),
                          ],
                          '/navigation/drawer',
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildFeatureCard(
                          Icons.code,
                          'Navigation',
                          'Bars',
                          [
                            Colors.orange.withOpacity(0.6),
                            Colors.red.withOpacity(0.3),
                          ],
                          '/navigation/bar',
                          context,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildFeatureCard(
                          Icons.speed,
                          'Tabs',
                          'Navigation Rails',
                          [
                            Colors.red.withOpacity(0.6),
                            Colors.orange.withOpacity(0.3),
                          ],
                         
                          '/navigation/rail',
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Tap hint text
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    'Tap any card above to explore features',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Action Buttons
                
              ],
            ),
          ),
        );

      case 1:
        return const ComponentsScreen();
      case 2:
        return const NavigationBarScreen();
      case 3:
      default:
        return const _AboutPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.3, 0.6, 1.0],
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
              Color(0xFFf093fb),
              Color(0xFFf5576c),
            ],
          ),
        ),
        child: _buildBody(),
      ),

    );
  }
}

class _AboutPage extends StatelessWidget {
  const _AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.info_outline, size: 56, color: Colors.white70),
            SizedBox(height: 12),
            Text(
              'About this App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'This is a demo of the Glassmorphic UI Kit. Use the navigation bar to explore screens.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFeatureCard(
  IconData icon,
  String title,
  String subtitle,
  List<Color> gradientColors,
  String route,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, route),
    child: GlassContainer(
      height: 100,
      blur: 20,
      opacity: 0.15,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: gradientColors,
      ),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 1),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 9),
            ),
          ],
        ),
      ),
    ),
  );
}
