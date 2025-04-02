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
- `GlassButton`: Blurred button with ripple effect
- `GlassCard`: Frosted-glass card for UI elements
- `GlassDialog`: Customizable glass dialog
- `GlassBottomSheet`: Blurred bottom sheet with opacity control

### 2. Customizable Blur & Transparency
- Adjustable blur intensity
- Dynamic opacity control
- Customizable border radius

### 3. Gradient Overlays
- Linear gradient support
- Radial gradient support
- Dynamic gradient animations

### 4. Performance Optimized
- Efficient rendering
- Smooth animations
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
  glassmorphic_ui_kit: ^1.0.0
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
      Colors.white.withOpacity(0.2),
      Colors.white.withOpacity(0.1),
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

### Glass Card

```dart
GlassCard(
  width: 300,
  height: 200,
  blur: 20,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text("Glass Card Title"),
        Text("Content goes here"),
      ],
    ),
  ),
)
```

### Glass Dialog

```dart
GlassDialog(
  title: Text("Glass Dialog"),
  content: Text("This is a glassmorphic dialog!"),
  actions: [
    GlassButton(
      onPressed: () => Navigator.pop(context),
      child: Text("Close"),
    ),
  ],
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

### Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support ❤️

If you find this package helpful, please give it a ⭐️ on [GitHub](https://github.com/yourusername/glassmorphic_ui_kit)!

For issues, feature requests, or questions, please file an issue on the GitHub repository.
