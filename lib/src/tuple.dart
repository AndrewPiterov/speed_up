import 'package:equatable/equatable.dart';

abstract class Tuple<A> extends Equatable {
  const Tuple(this._values);

  final List _values;

  Iterable get iterable sync* {
    for (final value in _values) {
      yield value;
    }
  }

  List toList({bool growable = false}) =>
      List.from(iterable, growable: growable);

  Map<int, dynamic> toMap() {
    final map = <int, dynamic>{};
    for (var i = 0; i < _values.length; i++) {
      map[i] = _values[i];
    }
    return map;
  }

  @override
  String toString() => '(${_values.join(', ')})';

  T map<T>(T Function(A t) tuple) {
    return tuple(this as A);
  }
}

class Tuple2<T1, T2> extends Tuple<Tuple2<T1, T2>> implements MapEntry<T1, T2> {
  Tuple2(this.item1, this.item2) : super([item1, item2]);

  /// Create a new tuple value with the specified list [items].
  factory Tuple2.fromList(List items) {
    if (items.length != 2) {
      throw ArgumentError('items must have length 2');
    }

    return Tuple2<T1, T2>(items[0] as T1, items[1] as T2);
  }

  final T1 item1;
  final T2 item2;

  @override
  List<Object?> get props => [item1, item2];

  Tuple2<T1, T2> copyWith({T1? item1, T2? item2}) {
    return Tuple2<T1, T2>(
      item1 ?? this.item1,
      item2 ?? this.item2,
    );
  }

  @override
  T1 get key => item1;

  @override
  T2 get value => item2;
}

class Tuple3<T1, T2, T3> extends Tuple<Tuple3<T1, T2, T3>> {
  Tuple3(this.item1, this.item2, this.item3) : super([item1, item2, item3]);

  /// Create a new tuple value with the specified list [items].
  factory Tuple3.fromList(List items) {
    if (items.length != 3) {
      throw ArgumentError('items must have length 3');
    }

    return Tuple3<T1, T2, T3>(items[0] as T1, items[1] as T2, items[2] as T3);
  }

  final T1 item1;
  final T2 item2;
  final T3 item3;

  @override
  List<Object?> get props => [item1, item2, item3];

  Tuple3<T1, T2, T3> copyWith({T1? item1, T2? item2, T3? item3}) {
    return Tuple3<T1, T2, T3>(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
    );
  }
}

class Tuple4<T1, T2, T3, T4> extends Tuple<Tuple4<T1, T2, T3, T4>> {
  Tuple4(this.item1, this.item2, this.item3, this.item4)
      : super([item1, item2, item3, item4]);

  /// Create a new tuple value with the specified list [items].
  factory Tuple4.fromList(List items) {
    if (items.length != 4) {
      throw ArgumentError('items must have length 4');
    }

    return Tuple4<T1, T2, T3, T4>(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
    );
  }

  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;

  @override
  List<Object?> get props => [item1, item2, item3, item4];

  Tuple4<T1, T2, T3, T4> copyWith({
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
  }) {
    return Tuple4<T1, T2, T3, T4>(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
      item4 ?? this.item4,
    );
  }
}

class Tuple5<T1, T2, T3, T4, T5> extends Tuple<Tuple5<T1, T2, T3, T4, T5>> {
  Tuple5(this.item1, this.item2, this.item3, this.item4, this.item5)
      : super([item1, item2, item3, item4, item5]);

  /// Create a new tuple value with the specified list [items].
  factory Tuple5.fromList(List items) {
    if (items.length != 5) {
      throw ArgumentError('items must have length 5');
    }

    return Tuple5<T1, T2, T3, T4, T5>(
      items[0] as T1,
      items[1] as T2,
      items[2] as T3,
      items[3] as T4,
      items[4] as T5,
    );
  }

  final T1 item1;
  final T2 item2;
  final T3 item3;
  final T4 item4;
  final T5 item5;

  @override
  List<Object?> get props => [item1, item2, item3, item4, item5];

  Tuple5<T1, T2, T3, T4, T5> copyWith({
    T1? item1,
    T2? item2,
    T3? item3,
    T4? item4,
    T5? item5,
  }) {
    return Tuple5<T1, T2, T3, T4, T5>(
      item1 ?? this.item1,
      item2 ?? this.item2,
      item3 ?? this.item3,
      item4 ?? this.item4,
      item5 ?? this.item5,
    );
  }
}
