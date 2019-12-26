import 'dart:async';

import 'count_evens.dart';

class CounterBloc {
  int _counter = 0;
  static final CounterBloc _singleton = CounterBloc._internal();

  factory CounterBloc() {
    return _singleton;
  }

  CounterBloc._internal() {
    // Each event should be listened and proceed with its flow
    _counterEventController.stream.listen(_mapEventToState);
  }

//  final _counterStateController = StreamController<int>();
  final _counterStateController = StreamController<int>.broadcast();

  int get initState => _counter;

  StreamSink<int> get _inCounter => _counterStateController.sink;

  // For state, exposing only a stream which outputs data
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  // For events, exposing only a sink which is an input
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  void _mapEventToState(CounterEvent event) {
    if (event is CounterIncrementEvent) {
      _increment();
    } else if (event is CounterIncrementBy2Event) {
      _add2ToCounter();
    } else if (event is CounterMultiplyBy2Event) {
      _multiplyBy2Counter();
    } else if (event is CounterSubtract7Event) {
      _subtract7FromCounter();
    }
    _inCounter.add(_counter);
  }

  void _increment() => _counter++;

  void _add2ToCounter() => _counter += 2;

  void _multiplyBy2Counter() => _counter *= 2;

  void _subtract7FromCounter() => _counter -= 7;

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
