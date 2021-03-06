extension IntExtensions on int {
  DateTime toDateFromMsUnixTimestamp({bool asLocal = false}) {
    final d = DateTime.fromMillisecondsSinceEpoch(this);

    if (asLocal) {
      return d;
    }

    return d.toUtc();
  }

  DateTime toDateFromSecUnixTimestamp({bool asLocal = false}) {
    final d = DateTime.fromMillisecondsSinceEpoch(this * 1000);

    if (asLocal) {
      return d;
    }

    return d.toUtc();
  }

  Iterable<K> generate<K>(
    K Function(int index) map, {
    bool Function(K item)? where,
  }) sync* {
    for (var i = 0; i < this; i++) {
      final t = map(i);
      if (where != null) {
        if (where(t)) {
          yield t;
        }

        continue;
      }

      yield t;
    }
  }
}
