import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nexora/features/home/home_screen.dart';

void main() {
  testWidgets('Nexora home screen loads and displays members successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    // Verify Nexora branding and directory headline
    expect(find.text('NEXORA'), findsOneWidget);
    expect(find.text('Community Directory'), findsOneWidget);

    // Verify first and last member names are present
    expect(find.text('Mohamed Mahroos'), findsOneWidget);
    expect(find.text('Buddhika Sandaru'), findsOneWidget);
  });
}
