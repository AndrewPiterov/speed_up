import 'package:speed_up/src/range_value.dart';
import 'package:speed_up/src/string_extensions.dart';
import 'package:test/test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  test('Empty string should be empty', () {
    final isEmpty = isStringNullOrEmpty('');
    expect(isEmpty, true);
  });

  test('Null string should be empty', () {
    final isEmpty = isStringNullOrEmpty(null);
    expect(isEmpty, true);
  });

  test('Take first non empty string', () {
    const firstNonEmptyItem = 'one';
    final firstItem = takeFirstNonEmptyString([firstNonEmptyItem, 'two', null]);
    expect(firstItem, firstNonEmptyItem);
  });

  test('Take first non empty string after null string', () {
    const firstNonEmptyItem = 'one';
    final firstItem =
        takeFirstNonEmptyString([null, firstNonEmptyItem, 'two', null]);
    expect(firstItem, firstNonEmptyItem);
  });

  test('Take First non empty string after empty string', () {
    const firstNonEmptyItem = 'one';
    final firstItem =
        takeFirstNonEmptyString(['', firstNonEmptyItem, 'two', null]);
    expect(firstItem, firstNonEmptyItem);
  });

  group('Capitalization', () {
    test('should capitalize first letter', () {
      'andrew'.capitalized.should.be('Andrew');
    });

    test('should not change capitalization of other letters', () {
      'AnDReW'.capitalized.should.be('AnDReW');
    });
  });

  group('Title Cased', () {
    test('should capitalize first letters', () {
      'andrew piterov'.titleCased.should.be('Andrew Piterov');
    });

    test('should not change capitalization of other letters', () {
      'AnDReW PiterOV'.titleCased.should.be('AnDReW PiterOV');
    });
  });
}
