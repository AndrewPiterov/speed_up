import 'package:quiver/core.dart';

class RangeValue<T> {
  final T start;
  final T end;

  RangeValue(this.start, this.end);

  bool get isValid {
    if (start is DateTime) {
      return (start as DateTime).isBefore(end as DateTime);
    }

    if (start is num) {
      return (start as num) < (end as num);
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
