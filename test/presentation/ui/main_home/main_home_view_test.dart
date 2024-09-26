import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_clean_architecture/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainHomeView test', () {
    testWidgets('Find a BottomNavigationBar widget', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MyApp(),
      );
      await widgetTester.pumpAndSettle();
      final bottomNav = find.byType(BottomNavigationBar);
      expect(bottomNav, findsOneWidget);
    });
  });
}
