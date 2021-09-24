extension NumberExtension on Iterable<num> {
  num sum() =>
      this.fold<num>(0, (previousValue, element) => previousValue + element);
}
