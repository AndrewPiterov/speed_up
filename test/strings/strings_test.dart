import 'package:given_when_then_unit_test/res/given.dart';
import 'package:given_when_then_unit_test/res/then.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/src/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  given('empty string', () {
    const emptyString = '';

    then('should be isNullOrEmpty', () {
      emptyString.isNullOrEmpty.should.beTrue();
    });

    then('should not be isNotNullorEmpty', () {
      emptyString.isNotNullOrEmpty.should.beFalse();
    });

    test('Empty string should be empty', () {
      final isEmpty = isStringNullOrEmpty('');
      expect(isEmpty, true);
    });

    then('should has length of 0', () {
      emptyString.hasLength(0).should.beTrue();
    });
  });

  given('Null string', () {
    const String? emptyString = null;

    then('should be isNullOrEmpty', () {
      emptyString.isNullOrEmpty.should.beTrue();
    });

    then('should not be isNotNullorEmpty', () {
      emptyString.isNotNullOrEmpty.should.beFalse();
    });

    test('Null string should be empty', () {
      final isEmpty = isStringNullOrEmpty(null);
      expect(isEmpty, true);
    });

    then('should has length of 0', () {
      emptyString.hasLength(0).should.beTrue();
    });
  });

  given('non empty string', () {
    const someString = 'some string';

    then('should have length greater than 0', () {
      someString.hasLengthGreaterThan(0).should.beTrue();
    });

    then('should have length less than 100', () {
      someString.hasLengthShortThan(100).should.beTrue();
    });

    then('should have length less or equal than real length', () {
      someString
          .hasLengthShortThan(someString.length, orEqual: true)
          .should
          .beTrue();
    });

    then('should have length less than real length', () {
      someString.hasLengthShortThan(someString.length).should.beFalse();
    });

    then('should have length greater than his (length - 1)', () {
      someString.hasLengthGreaterThan(someString.length - 1).should.beTrue();
    });

    then('should have length greater or equal his length', () {
      someString
          .hasLengthGreaterThan(someString.length, orEqual: true)
          .should
          .beTrue();
    });
  });

  test('Take first non empty string', () {
    const firstNonEmptyItem = 'one';
    final firstItem = [firstNonEmptyItem, 'two', null].firstNonEmpty;
    expect(firstItem, firstNonEmptyItem);
  });

  test('Take first non empty string after null string', () {
    const firstNonEmptyItem = 'one';
    final firstItem = [null, firstNonEmptyItem, 'two', null].firstNonEmpty;
    expect(firstItem, firstNonEmptyItem);
  });

  test('Take First non empty string after empty string', () {
    const firstNonEmptyItem = 'one';
    final firstItem = ['', firstNonEmptyItem, 'two', null].firstNonEmpty;
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

  given('two strings', () {
    const str1 = 'STRING';
    const str2 = 'string';

    then('should be equal when ignore case', () {
      str1.isEqualTo(str2, ignoreCase: true).should.beTrue();
    });

    then('should not be equal when not ignore case', () {
      str1.isEqualTo(str2).should.not.beTrue();
    });
  });

  given('Null string', () {
    const String? str = null;

    then('should be null or empty', () {
      str.isNullOrEmpty.should.beTrue();
    });
  });

  given('Empty string', () {
    const str = '';

    then('should be null or empty', () {
      str.isNullOrEmpty.should.beTrue();
    });
  });

  given('Non empty string', () {
    const str = 'Flutter';

    then('should not be null or empty', () {
      str.isNullOrEmpty.should.not.beTrue();
    });

    then('should not be equal to', () {
      str.isEqualTo('flutter').should.beFalse();
    });

    then('should be equal to', () {
      str.isEqualTo('flutter', ignoreCase: true).should.beTrue();
    });
  });
}
