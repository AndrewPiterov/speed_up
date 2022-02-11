import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  const arr = [2, 1, 3, 4, 5, 7];
  test('replace where index', () {
    final newArray =
        arr.replaceWhere((index, _) => index == 3, withNewItem: 13);
    newArray.should.be([2, 1, 3, 13, 5, 7]);
  });

  test('replace where prop', () {
    final newArray =
        arr.replaceWhere((_, number) => number.isOdd, withNewItem: 13);
    newArray.should.be([2, 13, 13, 4, 13, 13]);
  });
}
