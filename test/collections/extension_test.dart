import 'package:given_when_then_unit_test/res/given.dart';
import 'package:given_when_then_unit_test/res/test_fixtures.dart';
import 'package:given_when_then_unit_test/res/then.dart';
import 'package:given_when_then_unit_test/res/when.dart';
import 'package:shouldly/shouldly.dart';
import 'package:speed_up/src/collection_extensions.dart';
import 'package:test/test.dart';

import '../models.dart';

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

    test('sum of integers and doubles', () {
      final sum = [1.01, 2.2, 3.5].sum();
      sum.should.be(6.71);
    });
  });

  group('Collection', () {
    group('groupBy', () {
      test('description', () {
        const people = [
          Person('Andrew', age: 18),
          Person('Bob', age: 20),
          Person('Vera'),
        ];

        final groups = people.groupBy((p) => p.age, map: (p) => p.name);

        groups.should.as('group count').haveCount(3);

        groups.should.containKey(18);
        groups[18].should.contain('Andrew');

        groups.should.containKey(20);
        groups[20].should.contain('Bob');

        groups.should.containKey(null);
        groups[null].should.contain('Vera');
      });
    });
  });

  given('Empty array', () {
    const arr = [];
    then('random should be null', () {
      // arr.takeRandom().should.beNull();
      expect(arr.takeRandom(12), []);
    });
  });

  given('Coin Orders', () {
    late List<CoinOrder> orders;
    before(() {
      orders = [
        const CoinOrder(1, 1),
        const CoinOrder(1, 1),
      ];
    });

    when('sum total coins', () {
      then('total coin amount should be 2', () {
        final sum = orders.sum((o) => o.amount);
        sum.should.be(2);
      });
    });

    when('add more coins', () {
      late List<CoinOrder> secondWallet;
      before(() {
        secondWallet = orders.toList()..add(const CoinOrder(5, 1));
      });

      then('total coin amount should be 5', () {
        final sum = secondWallet.sum((o) => o.amount);
        sum.should.be(7);
      });
    });
  });

  test('placeSeparationBetweenItems', () {
    final coll = [1, 2, 3, 4, 5];
    final res = coll.placeSeparationBetweenItems(() => 0);
    res.should.be([1, 0, 2, 0, 3, 0, 4, 0, 5]);
  });
}
