import 'package:shouldly/shouldly_collection.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  test('empty array should be empty', () {
    intersperse(0, <int>[]).should.beEmpty();
  });

  test('intersperse should not add element in array with one element', () {
    intersperse(0, [1]).should.be([1]);
  });

  test('intersperse should add 0 between each element', () {
    intersperse(0, [1, 3, 5]).should.be([1, 0, 3, 0, 5]);
  });
}
