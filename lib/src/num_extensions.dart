extension NumExtension on num {
  bool isBetween(num min, num max, {bool orEqualSomeEdge = false}) {
    if (orEqualSomeEdge) {
      return this >= min && this <= max;
    }
    return this > min && this < max;
  }
}
