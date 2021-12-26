import 'package:shouldly/shouldly.dart';
import 'package:speed_up/src/collection_extensions.dart';
import 'package:test/test.dart';

import 'models.dart';

void main() {
  const orders = [
    CoinOrder(2, 2),
    CoinOrder(1, 1),
    CoinOrder(3, 3),
  ];

  test('order by ASC', () {
    final ordered = orders.orderBy((x) => x.amount);

    ordered.should.be(const [
      CoinOrder(1, 1),
      CoinOrder(2, 2),
      CoinOrder(3, 3),
    ]);
  });

  test('order by DESC', () {
    final ordered = orders.orderBy((x) => x.amount, desc: true);

    ordered.should.be(const [
      CoinOrder(3, 3),
      CoinOrder(2, 2),
      CoinOrder(1, 1),
    ]);
  });
}
