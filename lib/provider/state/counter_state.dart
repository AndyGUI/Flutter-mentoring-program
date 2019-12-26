import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void add2ToCounter() {
    _counter += 2;
    notifyListeners();
  }

  void multiplyBy2Counter() {
    _counter *= 2;
    notifyListeners();
  }

  void subtract7FromCounter() {
    _counter -= 7;
    notifyListeners();
  }
}
