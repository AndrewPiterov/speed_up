import 'package:speed_up/speed_up.dart';
import 'package:test/test.dart';

void main() {
  test('save new categories', () {
    // Arrange - initial state
    final initialCategories = <int>[];
    final endCategories = [5, 7];

    // Act - method under the test
    final diff = getListsDifference(initialCategories, endCategories);

    // Assert - to verify end state

    expect(diff.deletedItems, []);
    expect(diff.sameItems, []);
    expect(diff.newItems, [5, 7]);
  });

  test('get new categories with initial one', () {
    final initial = [1];
    final end = [1, 2, 3];

    //
    final diff = getListsDifference(initial, end);

    //
    expect(diff.newItems, [2, 3]);
    expect(diff.sameItems, [1]);
    expect(diff.deletedItems, []);
  });

  test('deleted categories', () {
    //  AAA

    // Arrange
    final initial = [1, 2];
    final end = [2];

    // Act
    final diff = getListsDifference(initial, end);

    // Assert = Expect
    expect(diff.newItems, []);
    expect(diff.sameItems, [2]);
    expect(diff.deletedItems, [1]);
  });
}
