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
}
