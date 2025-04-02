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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
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

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
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
          child: Center(
            child: GlassContainer(
              width: 300,
              height:300,
              blur: 20,
              opacity: 0.2,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Builder(
                    builder: (context) => GlassButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 48,
                  ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Glassmorphic UI Kit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Builder(
                    builder: (context) => GlassButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Open Menu'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
