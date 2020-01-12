import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/field_validator.dart';
import 'package:flutter_mentoring_programm/main_testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final page = MaterialApp(
    home: MainPage(),
  );

  group('testing input field', () {
    testWidgets('Input field is empty, error should be shown',
        (WidgetTester tester) async {
      await tester.pumpWidget(page);
      await tester.tap(find.byKey(Key('rePrint')));
      await tester.pump();

      final messageFinder = find.text('Something');
      expect(messageFinder, findsNothing);

      final messageErrorFinder = find.text(ERROR_INPUT_VALIDATOR);
      expect(messageErrorFinder, findsOneWidget);
    });

    testWidgets('Input field is filled correctly, no error',
        (WidgetTester tester) async {
      await tester.pumpWidget(page);

      final inputField = find.byKey(Key('textInput'));
      final inputText = '12sjskf';
      await tester.enterText(inputField, inputText);
      await tester.pump();

      await tester.tap(find.byKey(Key('rePrint')));
      await tester.pump();

      final messageFinder = find.text('');
      expect(messageFinder, findsNothing);

      final messageErrorFinder = find.text(ERROR_INPUT_VALIDATOR);
      expect(messageErrorFinder, findsNothing);

      final uppercaseWidgetFinder = find.text(inputText.toUpperCase());
      expect(uppercaseWidgetFinder, findsOneWidget);
    });
  });
}
