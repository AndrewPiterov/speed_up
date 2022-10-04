import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Tuple (1, 2)', () {
    final tuple = Tuple2(1, 2);

    test('Equality', () {
      tuple.should.be(Tuple2(1, 2));
    });

    test('toString', () {
      tuple.toString().should.be('(1, 2)');
    });

    test('toMap', () {
      tuple.toMap().should.be({
        0: 1,
        1: 2,
      });
    });

    test('toList', () {
      tuple.toList().should.be([1, 2]);
    });

    test('copyWith()', () {
      tuple.copyWith(item1: 3).should.be(Tuple2(3, 2));
    });

    test('map()', () {
      final mapped = tuple.map((t) => Tuple3(t.item2, t.item1, 'a'));
      mapped.should.be(Tuple3(2, 1, 'a'));
    });

    test('implements MapEntry<T1, T2>', () {
      tuple.key.should.be(1);
      tuple.value.should.be(2);
    });
  });

  test('map()', () {
    final mapped = Tuple3('a', 'b', 'c').map((t) => Tuple2(t.item2, t.item1));
    mapped.should.be(Tuple2('b', 'a'));
  });

  test('from list', () {
    final t = Tuple2<int, int>.fromList(const [1, 2]);
    t.should.be(Tuple2(1, 2));
  });
}
