import 'package:flutter/material.dart';
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
      initialRoute: '/components',
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
        child: const SafeArea(
          child: ComponentsScreen(),
        ),
      ),
    );
  }
}
