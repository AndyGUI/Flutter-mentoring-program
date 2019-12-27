import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/redux/module/counter/counter_actions.dart';
import 'package:flutter_mentoring_programm/redux/redux/app_store.dart';
import 'package:redux_epics/redux_epics.dart';

import '../main_redux.dart';

Stream<dynamic> someFancyEpic(
  Stream<dynamic> actions,
  EpicStore<AppStore> store,
) {
  // ignore: close_sinks
  final actionsStream = StreamController();

  actions
      .where((action) => action is CounterIncrementAction)
      .map(_showSnack)
      .listen((_) => actionsStream.add(CounterSubtract7Action()));

  return actionsStream.stream;
}

_showSnack(_) {
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 789),
      content: Text("Hey from the snackbar!"),
    ),
  );
}
