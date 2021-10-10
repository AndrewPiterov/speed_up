import 'package:speed_up/src/collection_extensions.dart';
import 'package:test/test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  group('Number extensions:', () {
    test('sum of empty array should be 0', () {
      final sum = <double>[].sum();
      sum.should.be(0);
    });

    test('sum of non empty array', () {
      final sum = [1, 2, 3, 4, 5, 6].sum();
      sum.should.be(21);
    });

    test('sum of ints and doubles', () {
      final sum = [1.01, 2.2, 3.5].sum();
      sum.should.be(6.71);
    });
  });

  group('Collection', () {
    group('groupBy', () {
      test('description', () {
        const people = [
          Person('Andrew', age: 18),
          Person('Oleg', age: 20),
          Person('Vera'),
        ];

        final groups = people.groupBy((p) => p.age, (p) => p.name);

        groups.should.as('group count').haveCount(3);

        groups.should.containKey(18);
        groups[18].should.contain('Andrew');

        groups.should.containKey(20);
        groups[20].should.contain('Oleg');

        groups.should.containKey(null);
        groups[null].should.contain('Vera');
      });
    });
  });
}

class Person {
  final String name;
  final int? age;

  const Person(
    this.name, {
    this.age,
  });
}
