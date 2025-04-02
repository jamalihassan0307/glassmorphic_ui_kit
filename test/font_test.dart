import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Roboto fonts are bundled', () async {
    final regularFont = rootBundle
        .load('packages/glassmorphic_ui_kit/assets/fonts/Roboto-Regular.ttf');
    final boldFont = rootBundle
        .load('packages/glassmorphic_ui_kit/assets/fonts/Roboto-Bold.ttf');

    expect(regularFont, completes);
    expect(boldFont, completes);
  });
}
