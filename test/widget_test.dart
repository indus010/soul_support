// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:soulsupport_app/main.dart';

void main() {
  testWidgets('Soul Support App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SoulSupportApp());

    // Verify that the app title is present
    expect(find.text('Soul Support'), findsOneWidget);

    // Verify that the greeting text is present
    // Verify that the greeting text is present (emoji rendering may vary by encoding)
    expect(find.textContaining('Welcome back, Adi!'), findsOneWidget);

    // Verify that quick access section is present
    expect(find.text('QUICK ACCESS'), findsOneWidget);
    expect(find.text('Essential Wellness Services'), findsOneWidget);
  });
}
