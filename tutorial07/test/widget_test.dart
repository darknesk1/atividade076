import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial07/main.dart'; // Ensure this matches your project name

void main() {
  testWidgets('Movie list smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify the AppBar title appears
    expect(find.text('CineFlutter'), findsOneWidget);

    // Verify that movie icons are being rendered
    expect(find.byIcon(Icons.movie), findsAtLeastNWidgets(1));

    // Test the LongPress SnackBar interaction
    // Note: This assumes your Database.getFilmes() isn't empty
    await tester.longPress(find.byType(ListTile).first);
    await tester.pump(); // Start the animation
    await tester.pump(const Duration(seconds: 1)); // Wait for SnackBar to appear

    // Verify the SnackBar text appears
    expect(find.textContaining('Você segurou em:'), findsOneWidget);
  });
}