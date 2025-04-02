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
