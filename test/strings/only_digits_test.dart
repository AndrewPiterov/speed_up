import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('only digits', () {
    '+1 23adf45^%678?>ыоад9امنت0'.digitsOnly().should.be('1234567890');
  });
}
