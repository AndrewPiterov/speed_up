import 'dart:math';

final _random = Random();

extension IntExtension on Iterable<int> {
  int sum() =>
      fold<int>(0, (previousValue, element) => previousValue + element);
}

extension DoubleExtension on Iterable<double> {
  double sum() =>
      fold<double>(0, (previousValue, element) => previousValue + element);
}

extension CollectionExtension<T> on Iterable<T> {
  /// Group items by `Key`
  Map<K, Iterable<U>> groupBy<K, U>(
    K Function(T item) key, {
    U Function(T item)? map,
  }) {
    final res = <K, List<U>>{};
    for (final element in this) {
      final k = key(element);
      if (!res.containsKey(k)) {
        res[k] = [];
      }

      res[k]?.add(map == null ? element as U : map(element));
    }
    return res;
  }

  /// Sort items
  Iterable<T> orderBy(
    num Function(T item) order, {
    bool desc = false,
  }) sync* {
    final sorted = toList();
    if (desc) {
      sorted.sort(
        (a, b) => order(b) > order(a)
            ? 1
            : order(b) < order(a)
                ? -1
                : 0,
      );
    } else {
      sorted.sort(
        (a, b) => order(b) < order(a)
            ? 1
            : order(b) > order(a)
                ? -1
                : 0,
      );
    }
    for (final item in sorted) {
      yield item;
    }
  }

  num sum(num Function(T item) callback) {
    var res = 0.0;
    for (final item in this) {
      res += callback(item);
    }

    return res;
  }

  /// The first element satisfying [test], or `null` if there are none.
  T? firstOrNull([bool Function(T element)? predicate]) {
    if (predicate == null) {
      return isEmpty ? null : first;
    }

    T? result;
    for (final element in this) {
      if (predicate(element)) {
        result = element;
      }
    }
    return result;
  }

  /// The last element satisfying [test], or `null` if there are none.
  T? lastOrNull([bool Function(T element)? predicate]) {
    if (predicate == null) {
      return isEmpty ? null : last;
    }

    T? result;
    for (final element in this) {
      if (predicate(element)) {
        result = element;
      }
    }
    return result;
  }

  T? get random {
    if (isEmpty) {
      return null;
    }

    final randomIndex = _random.nextInt(length);
    return elementAt(randomIndex);
  }

  Iterable<T> takeRandom(int count, {bool mayHaveDuplicates = false}) sync* {
    if (count <= 0) {
      throw Error();
    }

    if (isEmpty) {
      return;
    }

    if (mayHaveDuplicates) {
      for (var i = 0; i < count; i++) {
        final randomIndex = _random.nextInt(length);
        yield elementAt(randomIndex);
      }
      return;
    }

    final allIndexies = Iterable.generate(length, (i) => i).toList()..shuffle();

    final trueCount = count > allIndexies.length ? allIndexies.length : count;
    for (var i = 0; i < trueCount; i++) {
      yield elementAt(allIndexies[i]);
    }
  }

  T takeAfter<K>(T current, {K Function(T)? byKey}) {
    final list = toList();
    final currentIndex = byKey == null
        ? list.indexOf(current)
        : list.indexWhere((element) => byKey(element) == current);
    final nextIndex = currentIndex >= list.length - 1 ? 0 : currentIndex + 1;
    return elementAt(nextIndex);
  }

  Iterable<T> placeSeparationBetweenItems(
    T Function() separator,
  ) sync* {
    final count = length + (length <= 0 ? 0 : length - 1);

    for (var i = 0; i < count; i++) {
      if (i.isOdd) {
        yield separator();
        continue;
      }

      final itemIndex = (i / 2).floor();
      final t = elementAt(itemIndex);
      yield t;
    }
  }

  /// Reorder list by indexes
  Iterable<T> reorderByIndexes({required int oldIndex, required int newIndex}) {
    final newList = toList();
    final item = newList.removeAt(oldIndex);

    final index = newIndex;
    newList.insert(index, item);

    return newList;
  }

  /// Reorder list by place item by new index
  Iterable<T> reorder(T item, {required int newIndex}) {
    final oldIndex = toList().indexOf(item);
    return reorderByIndexes(oldIndex: oldIndex, newIndex: newIndex);
  }

  /// The current elements of this iterable modified by [toElement].
  ///
  /// Returns a new lazy [Iterable] with elements that are created by
  /// calling `toElement` on each element of this `Iterable` in
  /// iteration order.
  Iterable<K> mapWithIndex<K>(K Function(int indes, T item) toElement) sync* {
    for (var i = 0; i < length; i++) {
      yield toElement(i, elementAt(i));
    }
  }
}
