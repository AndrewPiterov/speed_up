import 'dart:ffi';

extension IntExtension on Iterable<int> {
  int sum() =>
      this.fold<int>(0, (previousValue, element) => previousValue + element);
}

extension DoubleExtension on Iterable<double> {
  double sum() =>
      this.fold<double>(0, (previousValue, element) => previousValue + element);
}

extension CollectionExtension<T> on Iterable<T> {
  Map<K, Iterable<U>> groupBy<K, U>(K Function(T) key, U Function(T)? map) {
    var res = <K, List<U>>{};
    for (var element in this) {
      final k = key(element);
      if (!res.containsKey(k)) {
        res[k] = [];
      }

      res[k]?.add(map == null ? element as U : map(element));
    }
    return res;
  }
}
