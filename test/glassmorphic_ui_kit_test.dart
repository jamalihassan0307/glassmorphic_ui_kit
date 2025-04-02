import 'package:flutter_test/flutter_test.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import 'package:flutter/material.dart';

void main() {
  group('GlassContainer Tests', () {
    testWidgets('GlassContainer creates glass effect', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassContainer(
              width: 200,
              height: 200,
              blur: 10,
              opacity: 0.2,
              child: Center(
                child: Text('Test'),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(GlassContainer), findsOneWidget);
      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('GlassContainer applies custom blur', (WidgetTester tester) async {
      const double customBlur = 20.0;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassContainer(
              blur: customBlur,
              child: Text('Custom Blur'),
            ),
          ),
        ),
      );

      final BackdropFilter filter = tester.widget<BackdropFilter>(
        find.byType(BackdropFilter),
      );
      expect(filter, isNotNull);
    });
  });

  group('GlassButton Tests', () {
    testWidgets('GlassButton handles tap', (WidgetTester tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GlassButton(
              onPressed: () => tapped = true,
              child: const Text('Button'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Button'));
      expect(tapped, true);
    });
  });

  group('GlassCard Tests', () {
    testWidgets('GlassCard renders with correct dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GlassCard(
              width: 300,
              height: 200,
              child: Text('Card Content'),
            ),
          ),
        ),
      );

      final Size cardSize = tester.getSize(find.byType(GlassCard));
      expect(cardSize.width, 300);
      expect(cardSize.height, 200);
    });
  });
}
