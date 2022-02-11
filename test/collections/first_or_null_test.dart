import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  const arr = [2, 1, 3, 4, 5, 6];
  test('first or null without predicate', () {
    arr.firstOrNull().should.be(2);
  });

  test('first or null with predicate', () {
    arr.firstOrNull((e) => e > 4).should.be(5);
  });
}
