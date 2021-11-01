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
  Map<K, Iterable<U>> groupBy<K, U>(K Function(T) key, U Function(T)? map) {
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

  num sum(num Function(T item) callback) {
    var res = 0.0;
    for (final item in this) {
      res += callback(item);
    }

    return res;
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
}
