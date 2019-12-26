import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentoring_programm/redux/module/counter/counter.dart';
import 'package:meta/meta.dart';

@immutable
class AppStore {
  final Counter counter;

  AppStore({this.counter});

  static initial() => AppStore(counter: Counter(0));
}
