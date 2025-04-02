

<div align="center">
  <kbd>
    <img src="https://github.com/jamalihassan0307/glassmorphic_ui_kit/blob/main/image/image.jpg?raw=true" width="250" alt="Jam Ali Hassan"/>
  </kbd>
  
  <h1>🌟 Glassmorphic UI Kit 🌟</h1>
  <p><i>Modern, beautiful glass effects for Flutter apps</i></p>
  
  <p align="center">
    <a href="https://github.com/jamalihassan0307">
      <img src="https://img.shields.io/badge/Created_by-Jam_Ali_Hassan-blue?style=for-the-badge&logo=github&logoColor=white" alt="Created by"/>
    </a>
  </p>

  <p align="center">
    <a href="https://github.com/jamalihassan0307">
      <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" alt="GitHub"/>
    </a>
    <a href="https://www.linkedin.com/in/jamalihassan0307">
      <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn"/>
    </a>
    <a href="https://jamalihassan0307.github.io/portfolio.github.io">
      <img src="https://img.shields.io/badge/Portfolio-255E63?style=for-the-badge&logo=About.me&logoColor=white" alt="Portfolio"/>
    </a>
  </p>

  <p align="center">
    <a href="https://pub.dev/packages/glassmorphic_ui_kit">
      <img src="https://img.shields.io/pub/v/glassmorphic_ui_kit?style=for-the-badge&logo=dart&logoColor=white" alt="Pub Version"/>
    </a>
    <a href="https://flutter.dev">
      <img src="https://img.shields.io/badge/Platform-Flutter-02569B?style=for-the-badge&logo=flutter" alt="Platform"/>
    </a>
    <a href="https://opensource.org/licenses/MIT">
      <img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge" alt="License: MIT"/>
    </a>
  </p>

  <p align="center">
    <a href="https://pub.dev/packages/glassmorphic_ui_kit">
      <img src="https://img.shields.io/pub/likes/glassmorphic_ui_kit?style=for-the-badge&logo=flutter&logoColor=white&label=Pub%20Likes" alt="Pub Likes"/>
    </a>
    <a href="https://pub.dev/packages/glassmorphic_ui_kit">
      <img src="https://img.shields.io/pub/points/glassmorphic_ui_kit?style=for-the-badge&logo=flutter&logoColor=white&label=Pub%20Points" alt="Pub Points"/>
    </a>
    <a href="https://pub.dev/packages/glassmorphic_ui_kit">
      <img src="https://img.shields.io/pub/popularity/glassmorphic_ui_kit?style=for-the-badge&logo=flutter&logoColor=white&label=Popularity" alt="Popularity"/>
    </a>
  </p>

  <p align="center">
    <img src="https://raw.githubusercontent.com/jamalihassan0307/my/plus/main/image/demo.gif" width="600" alt="Demo"/>
  </p>
</div>

---

# Glassmorphic UI Kit 🌟

A Flutter package designed to implement modern glassmorphic UI trends with smooth blur effects, frosted glass appearance, and gradient overlays. Enhance your app's user experience with sleek, futuristic designs.

[![pub package](https://img.shields.io/pub/v/glassmorphic_ui_kit.svg)](https://pub.dev/packages/glassmorphic_ui_kit)
[![likes](https://img.shields.io/pub/likes/glassmorphic_ui_kit)](https://pub.dev/packages/glassmorphic_ui_kit/score)
[![popularity](https://img.shields.io/pub/popularity/glassmorphic_ui_kit)](https://pub.dev/packages/glassmorphic_ui_kit/score)

## Features 🛠️

### 1. Prebuilt Glass Widgets
- `GlassContainer`: Base component for glass effects
- `GlassButton`: Blurred button with ripple effect
- `GlassCard`: Frosted-glass card for UI elements
- `GlassDialog`: Customizable glass dialog
- `GlassBottomSheet`: Blurred bottom sheet with opacity control
- `GlassNavigationBar`: Modern navigation bar with glass effect
- `GlassNavigationDrawer`: Drawer with glass effect and custom tiles
- `GlassProgressIndicator`: Progress bar with glass effect
- `GlassSlider`: Customizable slider with glass effect
- `GlassTextField`: Text input with glass effect

### 2. Customizable Blur & Transparency
- Adjustable blur intensity
- Dynamic opacity control
- Customizable border radius
- Improved MouseCursor handling

### 3. Gradient Overlays
- Linear gradient support
- Radial gradient support
- Dynamic gradient animations
- Custom gradient patterns

### 4. Performance Optimized
- Efficient rendering
- Smooth animations
- Reduced widget rebuild cycles
- Better state management
- Flutter's Skia engine optimized

### 5. Cross-Platform Support
- iOS ✓
- Android ✓
- Web ✓
- Windows & macOS ✓

## Getting Started 🚀

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  glassmorphic_ui_kit: ^1.1.2
```



## Usage Examples 💻

### Navigation Components

#### 1. Navigation Drawer
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/drawer.gif" width="250" alt="Basic Drawer"/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/navigation_drawer.gif" width="250" alt="Custom Drawer"/>
</div>

```dart
GlassNavigationDrawer(
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
    UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Colors.transparent),
      accountName: Text('John Doe'),
      accountEmail: Text('john.doe@example.com'),
      currentAccountPicture: CircleAvatar(
        child: Icon(Icons.person),
      ),
    ),
    ListTile(
      leading: Icon(Icons.home, color: Colors.white),
      title: Text('Home', style: TextStyle(color: Colors.white)),
      onTap: () => Navigator.pop(context),
    ),
  ],
)
```

#### 2. Navigation Bar
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/navigation_bar.png" width="250" alt="Basic Navigation Bar"/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/navigation_bar.gif" width="250" alt="Interactive Navigation Bar"/>
</div>

```dart
GlassNavigationBar(
  selectedIndex: _selectedIndex,
  onDestinationSelected: (index) => setState(() => _selectedIndex = index),
  destinations: [
    GlassNavigationDestination(
      icon: Icon(Icons.home_outlined, color: Colors.white70),
      selectedIcon: Icon(Icons.home, color: Colors.white),
      label: 'Home',
    ),
    GlassNavigationDestination(
      icon: Icon(Icons.favorite_outline, color: Colors.white70),
      selectedIcon: Icon(Icons.favorite, color: Colors.white),
      label: 'Favorites',
    ),
    GlassNavigationDestination(
      icon: Icon(Icons.person_outline, color: Colors.white70),
      selectedIcon: Icon(Icons.person, color: Colors.white),
      label: 'Profile',
    ),
  ],
)
```

#### 3. Navigation Rail
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/navigation_rail.png" width="250" alt="Basic Navigation Rail"/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/navigation_rail.gif" width="250" alt="Interactive Navigation Rail"/>
</div>

```dart
GlassNavigationRail(
  selectedIndex: _selectedIndex,
  onDestinationSelected: (index) => setState(() => _selectedIndex = index),
  elevation: 1,
  gradient: LinearGradient(
    colors: [
      Colors.purple.withAlpha(77),
      Colors.blue.withAlpha(51),
    ],
  ),
  leading: CircleAvatar(
    radius: 20,
    backgroundColor: Colors.white24,
    child: Icon(Icons.person, color: Colors.white),
  ),
  destinations: const [
    GlassNavigationRailDestination(
      icon: Icon(Icons.dashboard_outlined),
      selectedIcon: Icon(Icons.dashboard),
      label: Text('Dashboard'),
    ),
    GlassNavigationRailDestination(
      icon: Icon(Icons.analytics_outlined),
      selectedIcon: Icon(Icons.analytics),
      label: Text('Analytics'),
    ),
  ],
)
```

#### 4. Tab Bar
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/tab_bar.png" width="250" alt="Basic Tab Bar"/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/tab_bar.gif" width="250" alt="Interactive Tab Bar"/>
</div>

```dart
GlassTabBar(
  controller: _tabController,
  tabs: const [
    Tab(text: 'Photos'),
    Tab(text: 'Videos'),
    Tab(text: 'Files'),
  ],
)
```

### Basic Components

#### 1. Glass Container
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Components"/>
</div>

```dart
GlassContainer(
  width: 300,
  height: 200,
  blur: 20,
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withAlpha(51),
      Colors.white.withAlpha(26),
    ],
  ),
  child: Center(child: Text("Glassmorphic Container")),
)
```

#### 2. Glass Button
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Button"/>
</div>

```dart
GlassButton(
  onPressed: () => print('Button pressed'),
  blur: 10,
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    colors: [
      Colors.blue.withAlpha(77),
      Colors.purple.withAlpha(51),
    ],
  ),
  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.add, color: Colors.white),
      SizedBox(width: 8),
      Text("Glass Button", style: TextStyle(color: Colors.white)),
    ],
  ),
)
```

#### 3. Glass Card
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Card"/>
</div>

```dart
GlassCard(
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
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Glass Card Title",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "This is a card with glass effect that can contain any widget.",
          style: TextStyle(color: Colors.white70),
        ),
      ],
    ),
  ),
)
```

#### 4. Glass Dialog
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Dialog"/>
</div>

```dart
showDialog(
  context: context,
  builder: (context) => GlassDialog(
    title: Text(
      'Glass Dialog',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      'This is a glassmorphic dialog with blur effect and gradient overlay.',
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      GlassButton(
        onPressed: () => Navigator.pop(context),
        child: Text('Cancel', style: TextStyle(color: Colors.white)),
      ),
      GlassButton(
        onPressed: () => Navigator.pop(context, true),
        child: Text('Confirm', style: TextStyle(color: Colors.white)),
      ),
    ],
  ),
)
```

#### 5. Glass Bottom Sheet
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Bottom Sheet"/>
</div>

```dart
showModalBottomSheet(
  context: context,
  backgroundColor: Colors.transparent,
  builder: (context) => GlassContainer(
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
        ListTile(
          leading: Icon(Icons.share, color: Colors.white),
          title: Text('Share', style: TextStyle(color: Colors.white)),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          leading: Icon(Icons.edit, color: Colors.white),
          title: Text('Edit', style: TextStyle(color: Colors.white)),
          onTap: () => Navigator.pop(context),
        ),
      ],
    ),
  ),
)
```

#### 6. Glass Text Field
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Text Field"/>
</div>

```dart
GlassTextField(
  controller: _textController,
  hintText: 'Enter text...',
  blur: 10,
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    colors: [
      Colors.white.withAlpha(51),
      Colors.white.withAlpha(26),
    ],
  ),
  style: TextStyle(color: Colors.white),
  cursorColor: Colors.white,
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.search, color: Colors.white70),
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.white70),
  ),
)
```

#### 7. Glass Progress Indicator
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Progress Indicator"/>
</div>

```dart
GlassProgressIndicator(
  value: 0.7, // 70% progress
  height: 8.0,
  blur: 10,
  borderRadius: BorderRadius.circular(4),
  gradient: LinearGradient(
    colors: [
      Colors.blue.withAlpha(77),
      Colors.purple.withAlpha(51),
    ],
  ),
)
```

#### 8. Glass Slider
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Glass Slider"/>
</div>

```dart
GlassSlider(
  value: _sliderValue,
  onChanged: (value) => setState(() => _sliderValue = value),
  min: 0.0,
  max: 100.0,
  divisions: 10,
  label: '${_sliderValue.round()}',
  activeColor: Colors.white.withAlpha(200),
  inactiveColor: Colors.white.withAlpha(100),
  blur: 10,
  borderRadius: BorderRadius.circular(10),
)
```

#### 9. Animated Glass Container
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/glassmorphic_ui_kit/refs/heads/main/screenshots/components.gif" width="300" alt="Animated Glass Container"/>
</div>

```dart
AnimatedGlassContainer(
  duration: Duration(milliseconds: 500),
  width: _isExpanded ? 300 : 200,
  height: _isExpanded ? 200 : 100,
  blur: _isExpanded ? 20 : 10,
  gradient: LinearGradient(
    colors: [
      Colors.white.withAlpha(_isExpanded ? 51 : 26),
      Colors.white.withAlpha(_isExpanded ? 26 : 13),
    ],
  ),
  child: Center(
    child: Text(
      "Tap to Animate",
      style: TextStyle(color: Colors.white),
    ),
  ),
)
```

## Usage 💻

### Basic Glass Container

```dart
GlassContainer(
  width: 300,
  height: 200,
  blur: 20,
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    colors: [
      Colors.white.withAlpha(51),  // 0.2 opacity
      Colors.white.withAlpha(26),  // 0.1 opacity
    ],
  ),
  child: Center(child: Text("Glassmorphic Container")),
)
```

### Glass Button

```dart
GlassButton(
  onPressed: () => print('Button pressed'),
  blur: 10,
  borderRadius: BorderRadius.circular(15),
  child: Text("Glass Button"),
)
```

### Glass Bottom Navigation Bar

```dart
GlassBottomNavigationBar(
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
  ],
)
```

### Glass Drawer

```dart
GlassDrawer(
  blur: 10,
  opacity: 0.2,
  child: Column(
    children: [
      GlassDrawerTile(
        leading: Icon(Icons.home),
        title: Text('Home'),
        onTap: () {},
      ),
      GlassDrawerTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {},
      ),
    ],
  ),
)
```

### Glass Progress Indicator

```dart
GlassProgressIndicator(
  value: 0.7, // 70% progress
  height: 8.0,
  blur: 10,
  borderRadius: BorderRadius.circular(4),
)
```

### Glass Navigation Rail
```dart
GlassNavigationRail(
  selectedIndex: _selectedIndex,
  onDestinationSelected: (index) => setState(() => _selectedIndex = index),
  elevation: 1, // New parameter for proper elevation
  gradient: LinearGradient(
    colors: [
      Colors.purple.withAlpha(77),
      Colors.blue.withAlpha(51),
    ],
  ),
  leading: Column(
    children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white24,
        child: Icon(Icons.person, color: Colors.white),
      ),
      SizedBox(height: 8),
      Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    ],
  ),
  destinations: const [
    GlassNavigationRailDestination(
      icon: Icon(Icons.dashboard_outlined, color: Colors.white70),
      selectedIcon: Icon(Icons.dashboard, color: Colors.white),
      label: Text('Dashboard'),
    ),
    GlassNavigationRailDestination(
      icon: Icon(Icons.analytics_outlined, color: Colors.white70),
      selectedIcon: Icon(Icons.analytics, color: Colors.white),
      label: Text('Analytics'),
    ),
  ],
)
```

## Theming 🎨

You can create a consistent glass effect theme across your app:

```dart
final glassTheme = GlassTheme(
  blur: 10.0,
  opacity: 0.2,
  borderRadius: BorderRadius.circular(15),
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withAlpha(51),
      Colors.white.withAlpha(26),
    ],
  ),
);

// Use the theme
GlassContainer(
  blur: glassTheme.blur,
  opacity: glassTheme.opacity,
  borderRadius: glassTheme.borderRadius,
  gradient: glassTheme.gradient,
  child: YourWidget(),
)
```

## Additional Information 📚

### Customization
All components support extensive customization:
- Blur intensity
- Opacity levels
- Gradient colors
- Border radius
- Animations

### Best Practices
1. Use against contrasting backgrounds
2. Maintain readable text contrast
3. Consider performance impact with multiple overlapping effects
4. Test on various devices for consistent appearance
5. Use withAlpha instead of withOpacity for better precision

### Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support ❤️

If you find this package helpful, please give it a ⭐️ on [GitHub](https://github.com/jamalihassan0307/glassmorphic_ui_kit)!

For issues, feature requests, or questions, please file an issue on the GitHub repository.

### Best Practices for Navigation Components
1. Always wrap buttons that use `Scaffold.of(context)` with a `Builder` widget
2. Use proper constraints to prevent overflow in navigation layouts
3. Set appropriate elevation values for navigation components
4. Handle state management properly in navigation screens
5. Consider responsive design for different screen sizes
