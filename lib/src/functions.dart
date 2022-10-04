import 'dart:developer';

@Deprecated('Use `title` getter of Enum instead. Will be removed in 1.0.0')
String getEnumTitle(dynamic someEnum) => someEnum.toString().split('.').last;

ListsDifferences<T> getListsDifference<T>(List<T> initial, List<T> end) {
  final newItems = end.where((x) => !initial.contains(x)).toList();
  final same = end.where((x) => initial.contains(x)).toList();
  final deleted = initial.where((x) => !end.contains(x)).toList();
  return ListsDifferences(
    newItems: newItems,
    sameItems: same,
    deletedItems: deleted,
  );
}

class ListsDifferences<T> {
  ListsDifferences({
    this.newItems = const [],
    this.sameItems = const [],
    this.deletedItems = const [],
  });

  final List<T> newItems;
  final List<T> sameItems;
  final List<T> deletedItems;
}

/// Log the duration of the [func] execution.
Future benchLog(String label, Function() action) async {
  final start = DateTime.now();
  await action();
  final end = DateTime.now();
  final duration = end.difference(start);
  log('$label: $duration');
}
