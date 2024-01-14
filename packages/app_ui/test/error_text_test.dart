import 'package:app_ui/src/widgets/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorText', () {
    testWidgets('should display the error message', (WidgetTester tester) async {
      const errorMessage = 'An error occurred';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorText(errorMessage),
          ),
        ),
      );

      final errorTextFinder = find.text(errorMessage);
      expect(errorTextFinder, findsOneWidget);
    });

    testWidgets('should center the error message', (WidgetTester tester) async {
      const errorMessage = 'An error occurred';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorText(errorMessage),
          ),
        ),
      );

      final centerFinder = find.byType(Center);
      expect(centerFinder, findsOneWidget);
    });

    testWidgets('should apply horizontal padding to the error message', (WidgetTester tester) async {
      const errorMessage = 'An error occurred';
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ErrorText(errorMessage),
          ),
        ),
      );

      final paddingFinder = find.byType(Padding);
      expect(paddingFinder, findsOneWidget);
      final paddingWidget = tester.widget<Padding>(paddingFinder);
      expect(paddingWidget.padding, const EdgeInsets.symmetric(horizontal: 30));
    });
  });
}
