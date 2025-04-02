import 'package:flutter_test/flutter_test.dart';
import 'package:glassmorphic_ui_kit/glassmorphic_ui_kit.dart';
import 'package:flutter/material.dart';

void main() {
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
}
