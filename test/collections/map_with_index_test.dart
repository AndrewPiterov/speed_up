import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('map with index', () {
    const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    // lazy
    final arr2 =
        arr.mapWithIndex((index, item, isFirst, isLast) => '$index - $item');

    // create a list
    final items = arr2.toList();
    for (var i = 0; i < arr.length; i++) {
      items[i].should.be('$i - ${arr.elementAt(i)}');
    }
  });
}
