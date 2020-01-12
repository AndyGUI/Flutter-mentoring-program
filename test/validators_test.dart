import 'package:flutter_mentoring_programm/field_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Input validator tests', () {
    test('[ERROR] empty input returns error string', () {
      final result = validateInput('');
      expect(result, ERROR_INPUT_VALIDATOR);
    });

    /**
     * Let's fail this one
     */
    test('[ERROR] less then 3 symbols input returns error string', () {
      final result = validateInput('3d');
      expect(result, ERROR_INPUT_VALIDATOR);
    });

    test('[SUCCESS] non-empty input returns null', () {
      final result = validateInput('1wda');
      expect(result, null);
    });
  });
}
