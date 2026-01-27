import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:figma/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NPLApp());

    // Verify that our app renders the MaterialApp.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
