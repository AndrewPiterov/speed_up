import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  const arr = [2, 1, 3, 4, 5, 7];
  test('last or null without predicate', () {
    arr.lastOrNull().should.be(7);
  });

  test('last or null with predicate', () {
    arr.lastOrNull((e) => e < 4).should.be(3);
  });

  test('last or null with predicate - unordered list', () {
    [1, 4, 5, 2, 3].lastOrNull((e) => e < 5).should.be(3);
  });
}
