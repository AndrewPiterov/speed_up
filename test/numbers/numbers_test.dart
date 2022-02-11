import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  test('Genarte list', () {
    final odds = 100
        .generate<int>(
          (index) => index,
          where: (item) => item > 10,
        )
        .skip(10)
        .take(10);

    odds.length.should.be(10);
  });
}
