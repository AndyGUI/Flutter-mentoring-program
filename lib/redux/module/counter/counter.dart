import 'package:meta/meta.dart';

@immutable
class Counter {
  final int count;
  Counter(this.count);

  factory Counter.copy(
    Counter source, {
    final int count,
  }) {
    return Counter(
      count ?? source.count,
    );
  }
}
