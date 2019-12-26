import 'dart:async';

import 'package:bloc/bloc.dart';

import 'count_evens.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is CounterIncrementEvent) {
      yield _increment();
    } else if (event is CounterIncrementBy2Event) {
      yield _add2ToCounter();
    } else if (event is CounterMultiplyBy2Event) {
      yield _multiplyBy2Counter();
    } else if (event is CounterSubtract7Event) {
      yield _subtract7FromCounter();
    }
  }

  int _increment() => state + 1;

  int _add2ToCounter() => state + 2;

  int _multiplyBy2Counter() => state * 2;

  int _subtract7FromCounter() => state - 7;
}
