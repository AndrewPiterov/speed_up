import 'package:test/test.dart';
import 'package:speed_up/src/number_extensions.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  test('Get date from int Unix timestamp as UTC', () {
    final date = 1617190965005.toDateFromMsUnixTimestamp();
    date.year.should.be(2021);
    date.month.should.be(3);
    date.day.should.be(31);
    date.hour.should.be(11);
    date.minute.should.be(42);
    date.second.should.be(45);
    date.millisecond.should.be(5);
  });

  test('Get date from int Unix timestamp as Local', () {
    final date = 1617190965005.toDateFromMsUnixTimestamp(asLocal: true);

    final localTz = date.timeZoneOffset;
    // final local = date.add(localTz);

    date.year.should.be(2021);
    date.month.should.be(3);
    date.day.should.be(31);
    date.hour.should.be(11 + localTz.inHours);
    date.minute.should.be(42);
    date.second.should.be(45);
    date.millisecond.should.be(5);
  }, skip: true);

  test('Genarte list', () {
    final odds = 100
        .generate(
          (index) => index,
          where: (item) => (item as int) > 10,
        )
        .skip(10)
        .take(10);

    odds.length.should.be(10);
  });
}
