import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('empty string as default', () {
    const defaultString = 'no name';
    const name = '';
    name.asDefault(defaultString).should.be(defaultString);
  });

  test('nullable string as default as empty string', () {
    // const defaultString = 'no name';
    const String? name = null;
    name?.asDefault().should.be('');
  });

  test('nullable string as default', () {
    const defaultString = 'no name';
    const String? name = null;
    name?.asDefault(defaultString).should.be(defaultString);
  });
}
