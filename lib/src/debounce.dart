import 'dart:async';

/// A debouncer that will execute a callback after a given duration.
class Debounce {
  Debounce({this.delay = const Duration(milliseconds: 500)});
  final Duration delay;
  Timer? _timer;

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() {
    _timer?.cancel();
  }
}
