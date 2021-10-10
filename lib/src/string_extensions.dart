/// Check String is null or empty
///
/// ```dart
/// isStringNullOrEmpty('Some String');
/// ```
bool isStringNullOrEmpty(String? str) => str == null || str.isEmpty;

String? takeFirstNonEmptyString(List<String?> strings) {
  for (final str in strings) {
    if (!isStringNullOrEmpty(str)) {
      return str;
    }
  }
  return null;
}

bool areStringsEqual(
  String? left,
  String? right, {
  bool ignoreCase = false,
}) {
  if (isStringNullOrEmpty(left) || isStringNullOrEmpty(right)) {
    return false;
  }

  if (ignoreCase) {
    return left!.toLowerCase() == right!.toLowerCase();
  }

  return left == right;
}

extension StringExtension on String {
  String get capitalized {
    return isNotEmpty ? "${this[0].toUpperCase()}${this.substring(1)}" : this;
  }

  String get titleCased => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.capitalized)
      .join(" ");
}
