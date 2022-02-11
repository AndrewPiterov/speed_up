import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('String', () {
    test('is not equal', () {
      'flutter'.isNotEqualTo('Flutter').should.beTrue();
    });

    test('is not equal to - ignore case', () {
      'flutter'.isNotEqualTo('Flutter', ignoreCase: true).should.beFalse();
    });
  });
}
