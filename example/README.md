# Examples

```dart
void main() {
  // Summary of nums
  final arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final arrSum = arr.sum();
  print('Array sum: $arrSum');

  // Take Random element
  for (var i = 0; i < 10; i++) {
    print('Random number: ${arr.random}');
  }

  // Take random X elements
  final randomElements = arr.takeRandom(7);
  print('Random elements (unique): $randomElements');

  // Take random X elements
  final randomElementsWithDuplication =
      arr.takeRandom(7, mayHaveDuplicates: true);
  print('Random elements with duplication: $randomElementsWithDuplication');

  // Summary of Complex Object
  const orders = [CoinOrder(1.5, 2.5), CoinOrder(10.5, 3.5)];
  final amountSum = orders.sum((order) => order.amount);
  print('Amount sum: $amountSum');
}
```