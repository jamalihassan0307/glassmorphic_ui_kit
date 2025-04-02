<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

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
  glassmorphic_ui_kit: ^1.1.0
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

## Usage Examples 💻

### Glass Container
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

### Glass Button
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

### Glass Card
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

### Glass Navigation Bar
```dart
GlassNavigationBar(
  selectedIndex: _currentIndex,
  onDestinationSelected: (index) => setState(() => _currentIndex = index),
  destinations: [
    GlassNavigationDestination(
      icon: Icon(Icons.home, color: Colors.white70),
      selectedIcon: Icon(Icons.home, color: Colors.white),
      label: 'Home',
    ),
    GlassNavigationDestination(
      icon: Icon(Icons.search, color: Colors.white70),
      selectedIcon: Icon(Icons.search, color: Colors.white),
      label: 'Search',
    ),
    GlassNavigationDestination(
      icon: Icon(Icons.person, color: Colors.white70),
      selectedIcon: Icon(Icons.person, color: Colors.white),
      label: 'Profile',
    ),
  ],
)
```

### Glass Navigation Drawer
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
    ListTile(
      leading: Icon(Icons.settings, color: Colors.white),
      title: Text('Settings', style: TextStyle(color: Colors.white)),
      onTap: () => Navigator.pop(context),
    ),
  ],
)
```

### Glass Dialog
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

### Glass Bottom Sheet
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

### Glass Slider
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

### Glass Text Field
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

### Glass Progress Indicator
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

### Animated Glass Container
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
