import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nexora/features/home/home_screen.dart';

void main() {
  testWidgets('Nexora home screen loads successfully',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(),
      ),
    );

    // Check home screen title
    expect(find.text('Meet Our Team'), findsOneWidget);

    // Check tagline
    expect(find.text('Nine identities. One connection.'), findsOneWidget);

    // Check member cards
    expect(find.text('Member 1'), findsOneWidget);
    expect(find.text('Member 9'), findsOneWidget);
  });
}