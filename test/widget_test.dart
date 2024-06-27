// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:codelab_4/main.dart'; // Asegúrate de que esta ruta sea correcta

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Menu());

    // Verify that our initial widgets are present.
    expect(find.text('Menu Demo'), findsOneWidget);
    expect(find.text('Explore the restaurant\'s delicious menu items below!'),
        findsOneWidget);

    // Verify that menu items are present.
    expect(find.text('Burger'), findsOneWidget);
    expect(find.text('Hot Dog'), findsOneWidget);
    expect(find.text('Fries'), findsOneWidget);
    expect(find.text('Soda'), findsOneWidget);
    expect(find.text('Ice Cream'), findsOneWidget);

    // Tap the 'Pickup' button and trigger a frame.
    await tester.tap(find.text('Pickup'));
    await tester.pump();

    // Tap the 'Delivery' button and trigger a frame.
    await tester.tap(find.text('Delivery'));
    await tester.pump();
  });
}
