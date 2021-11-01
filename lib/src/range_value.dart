import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

/// Object for representing range values.
@immutable
class RangeValue<T> {
  /// Initialize new `RangeValue`
  const RangeValue(this.start, this.end);

  final T start;
  final T end;

  /// Represents valid state
  bool get isValid {
    if (start is DateTime) {
      return (start as DateTime).isBefore(end as DateTime);
    }

    if (start is num) {
      return (start as num) < (end as num);
    }

    return true;
  }

  bool inRange(T value) {
    if (start is DateTime) {
      return (start as DateTime).isBefore(value as DateTime) &&
          value.isBefore(end as DateTime);
    }

    if (start is num) {
      return (start as num) < (value as num) && value < (end as num);
    }

    return true;
  }

  @override
  String toString() => '[$start, $end]';

  @override
  bool operator ==(Object other) =>
      other is RangeValue<T> && other.start == start && other.end == end;

  @override
  int get hashCode => hash2(
        start.hashCode,
        end.hashCode,
      );
}
