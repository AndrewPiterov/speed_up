import 'package:shouldly/shouldly.dart';
import 'package:speed_up/src/collection_extensions.dart';
import 'package:test/test.dart';

import 'models.dart';

void main() {
  test('order by ASC', () {
    const orders = [CoinOrder(2, 2), CoinOrder(1, 1)];

    final ordered = orders.orderBy((x) => x.amount);

    ordered.should.be(const [CoinOrder(1, 1), CoinOrder(2, 2)]);
  });

  test('order by DESC', () {
    const orders = [CoinOrder(1, 1), CoinOrder(2, 2)];

    final ordered = orders.orderBy((x) => x.amount, desc: true);

    ordered.should.be(const [CoinOrder(2, 2), CoinOrder(1, 1)]);
  });
}
