/// Check String is null or empty
///
/// ```dart
/// isStringNullOrEmpty('Some String');
/// ```
@Deprecated(
  'Use `isNullOrEmpty` getter of `String` instead. Will be removed in 1.0.0',
)
bool isStringNullOrEmpty(String? str) =>
    str == null || str.isEmpty || str.trim().isEmpty;

extension StringIterableExtension on Iterable<String?> {
  String? get firstNonEmpty {
    for (final str in this) {
      if (!str.isNullOrEmpty) {
        return str;
      }
    }
    return null;
  }
}

extension StringExtension on String {
  String get capitalized {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }

  String get titleCased => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalized)
      .join(' ');

  String get reversed => split('').reversed.join();

  String digitsOnly() {
    return replaceAll(RegExp('[^0-9]'), '');
  }
}

extension NullableStringExtension on String? {
  bool get isNullOrEmpty => isStringNullOrEmpty(this);
  bool get isNotNullOrEmpty => !isStringNullOrEmpty(this);

  bool isEqualTo(
    String? another, {
    bool ignoreCase = false,
  }) {
    if (this == null) {
      return false;
    }

    if (ignoreCase) {
      return this!.toLowerCase() == another?.toLowerCase();
    }

    return this == another;
  }

  bool isNotEqualTo(
    String? another, {
    bool ignoreCase = false,
  }) {
    if (this == null) {
      return false;
    }

    if (ignoreCase) {
      return this!.toLowerCase() != another?.toLowerCase();
    }

    return this != another;
  }

  /// has exact length
  bool hasLength(int len) {
    return (this?.length ?? 0) == len;
  }

  bool hasLengthGreaterThan(int len, {bool orEqual = false}) {
    final myLen = this?.length ?? 0;
    return orEqual ? myLen >= len : myLen > len;
  }

  bool hasLengthShortThan(int len, {bool orEqual = false}) {
    final myLen = this?.length ?? 0;
    return orEqual ? myLen <= len : myLen < len;
  }

  String asDefault([String defaultValue = '']) {
    return this == null || this == '' ? defaultValue : '';
  }
}
