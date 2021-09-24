import 'package:speed_up/src/collection_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('Number extensions:', () {
    test('sum of empty array should be 0', () {
      final sum = <double>[].sum();
      expect(sum, 0);
    });

    test('sum of non empty array', () {
      final sum = [1, 2, 3, 4, 5, 6].sum();
      expect(sum, 21);
    });

    test('sum of ints and doubles', () {
      final sum = [1.01, 2.2, 3.5].sum();
      expect(sum, 6.71);
    });
  });
}
