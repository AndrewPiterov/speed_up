extension ObjectExtensions on Object? {
  bool get isNull {
    return this == null;
  }

  bool get isNotNull => !isNull;
}
