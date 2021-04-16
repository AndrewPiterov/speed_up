import 'package:test/test.dart';
import 'package:speed_up/numbers.dart';

void main() {
  test('Get date from int Unix timestamp as UTC', () {
    final date = 1617190965005.toDateFromMsUnixTimestamp();
    expect(date.year, 2021);
    expect(date.month, 3);
    expect(date.day, 31);
    expect(date.hour, 11);
    expect(date.minute, 42);
    expect(date.second, 45);
    expect(date.millisecond, 5);
  });

  test('Get date from int Unix timestamp as Local', () {
    final date = 1617190965005.toDateFromMsUnixTimestamp(asLocal: true);

    final localTz = date.timeZoneOffset;
    final local = date.add(localTz);

    expect(date.year, 2021);
    expect(date.month, 3);
    expect(date.day, 31);
    expect(date.hour, 11 + localTz.inHours);
    expect(date.minute, 42);
    expect(date.second, 45);
    expect(date.millisecond, 5);
  }, skip: true);
}
