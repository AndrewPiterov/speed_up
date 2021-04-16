DateTime toUnix(int timestamp) =>
    DateTime.fromMicrosecondsSinceEpoch(timestamp);

extension IntExtensions on int {
  DateTime toDateFromMsUnixTimestamp({bool asLocal = false}) {
    final d = DateTime.fromMillisecondsSinceEpoch(this);

    if (asLocal) {
      return d;
    }

    return d.toUtc();
  }
}
