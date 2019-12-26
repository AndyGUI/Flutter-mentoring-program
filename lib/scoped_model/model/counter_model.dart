import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 0;
  int get counter => _counter;

  static CounterModel of(BuildContext context) =>
      ScopedModel.of<CounterModel>(context);

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
