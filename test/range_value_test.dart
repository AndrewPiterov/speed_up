import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  given('Number', () {
    const range = RangeValue(1.5, 10);
    then('should be valid', () {
      range.isValid.should.beTrue();
    });

    then('should be invalid', () {
      const RangeValue(3, 1).isValid.should.beFalse();
    });
  });

  given('DateTime', () {
    final start = DateTime.now();
    final end = DateTime.now().add(const Duration(days: 1));

    final range = RangeValue(start, end);

    final range2 = RangeValue(
      start,
      end,
    );

    then('should be type of', () {
      range.should.beOfType<RangeValue<DateTime>>();
    });

    then('should be equal to', () {
      range.should.be(range2);
    });

    then('should be valid', () {
      range.isValid.should.beTrue();
    });

    when('invalid range', () {
      final invalidRange = RangeValue(
        end,
        start,
      );
      then('should be invalid', () {
        final res = invalidRange.isValid;
        res.should.beFalse();
      });
    });
  });

  test('Eqality of ranges', () {
    const range = RangeValue(1, 10);
    const range2 = RangeValue(1, 10);

    range.should.be(range2);
  });

  test('Range toString', () {
    const range = RangeValue(1, 10);
    range.toString().should.be('[1, 10]');
  });

  test('Range toString for doubles', () {
    const range = RangeValue(1.0, 10.99);
    range.toString().should.be('[1.0, 10.99]');
  });

  test('equality', () {
    const r1 = RangeValue(1, 2);
    const r2 = RangeValue(1, 2);

    r2.should.be(r1);
  });

  group('Num is inRange', () {
    const range = RangeValue(5, 10);

    test('should be true', () {
      range.contains(7).should.beTrue();
    });

    test('should be false left edge', () {
      range.contains(5).should.beFalse();
    });

    test('should be false', () {
      range.contains(10).should.beFalse();
    });
  });

  group('DateTime is inRange', () {
    final range = RangeValue(DateTime(2021), DateTime(2021, 12, 31));

    test('should be true', () {
      range.contains(DateTime(2021, 3, 24)).should.beTrue();
    });

    test('should be false left edge', () {
      range.contains(DateTime(2021)).should.beFalse();
    });

    test('should be false', () {
      range.contains(DateTime(2021, 12, 31)).should.beFalse();
    });
  });
}
