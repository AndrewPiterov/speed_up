import 'package:shouldly/shouldly.dart';
import 'package:speed_up/speed_up.dart';
import 'package:test/scaffolding.dart';

void main() {
  late Debounce debounce;

  setUp(() {
    debounce = Debounce(delay: const Duration(milliseconds: 100));
  });

  test('every', () async {
    var value = '';

    debounce(() => value += 'a');
    await Future.delayed(const Duration(milliseconds: 150));
    debounce(() => value += 'b');
    await Future.delayed(const Duration(milliseconds: 150));
    debounce(() => value += 'c');
    await Future.delayed(const Duration(milliseconds: 150));
    debounce(() => value += 'd');

    await Future.delayed(const Duration(milliseconds: 1000));

    value.should.be('abcd');
  });

  test('Only last', () async {
    var value = '';

    debounce(() => value += 'a');
    debounce(() => value += 'b');
    debounce(() => value += 'c');
    debounce(() => value += 'd');

    await Future.delayed(const Duration(milliseconds: 1000));

    value.should.be('d');
  });

  tearDown(() {
    debounce.dispose();
  });
}
