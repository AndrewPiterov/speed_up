import 'package:shouldly/shouldly.dart';
import 'package:speed_up/src/string_extensions.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('reversed text', () {
    const text = 'some text';
    text.reversed.should.be('txet emos');
  });
}
