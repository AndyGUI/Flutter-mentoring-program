import 'package:flutter_mentoring_programm/redux/module/counter/counter.dart';
import 'package:flutter_mentoring_programm/redux/module/counter/counter_actions.dart';
import 'package:redux/redux.dart';

final counterReducer = combineReducers<Counter>([
  TypedReducer<Counter, CounterIncrementAction>(_increment),
  TypedReducer<Counter, CounterIncrementBy2Action>(_add2ToCounter),
  TypedReducer<Counter, CounterMultiplyBy2Action>(_multiplyBy2Counter),
  TypedReducer<Counter, CounterSubtract7Action>(_subtract7FromCounter),
]);

Counter _increment(Counter state, CounterIncrementAction action) {
  return Counter.copy(
    state,
    count: state.count + 1,
  );
}

Counter _add2ToCounter(Counter state, CounterIncrementBy2Action action) {
  return Counter.copy(
    state,
    count: state.count + 2,
  );
}

Counter _multiplyBy2Counter(Counter state, CounterMultiplyBy2Action action) {
  return Counter.copy(
    state,
    count: state.count * 2,
  );
}

Counter _subtract7FromCounter(Counter state, CounterSubtract7Action action) {
  return Counter.copy(
    state,
    count: state.count - 7,
  );
}
