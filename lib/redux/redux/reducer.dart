import 'package:flutter_mentoring_programm/redux/module/counter/counter_reducer.dart';
import 'package:flutter_mentoring_programm/redux/redux/app_store.dart';

AppStore appReducer(AppStore store, action) {
  return AppStore(
    counter: counterReducer(store.counter, action),
  );
}
